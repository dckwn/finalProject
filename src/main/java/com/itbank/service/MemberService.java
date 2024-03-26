package com.itbank.service;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.component.MailComponent;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO memberDao;
	@Autowired private HashComponent hashComponent;
	@Autowired private MailComponent mailComponent;

	private String saveDirectory = "D:\\upload\\profile";
		
	public MemberService() {
		//스프링 빈이 생성될 때 (=서버가 시작될 때) saveDirectory 경로를 체크하고 없으면 새로 만든다
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public MemberDTO login(MemberDTO dto) {
		String hash = hashComponent.getHash(dto.getUserpw());
		
		dto.setUserpw(hash);
		return memberDao.login(dto);
	}

	public int join(MemberDTO dto) throws ParseException {
		String image = dto.getProfile_Upload().getOriginalFilename();		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date birth = dateFormat.parse(dto.getStrbirth());
		java.sql.Date sqlBirth = new java.sql.Date(birth.getTime());
		dto.setBirth(sqlBirth);
		
		dto.setProfile_image(image);
		
		File f = new File(saveDirectory, image);
		
		try {	
			dto.getProfile_Upload().transferTo(f);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		String hash = hashComponent.getHash(dto.getUserpw());
		dto.setUserpw(hash);
		
		
		return memberDao.insert(dto);
	}

	public int check(HashMap<String, Object> param) {
		return memberDao.check(param);
	}

	public List<MemberDTO> getList() {
		return memberDao.selectList();
	}

	public int chPw(Map<String, String> param) {
		String currentPw = param.get("userPw");
		String newPw = param.get("newPw");
		if(!currentPw.equals(newPw)) {
			param.put("newPw", hashComponent.getHash(newPw));
			memberDao.update(param);
			return 1;
		}
		return 0;
	}
	
public String sendPassword(HashMap<String, String> param) {
		
		int memberCount = memberDao.sendPassword(param);
		
		System.out.println(memberCount);
		
		if(memberCount > 0) {
			 String newPwd = UUID.randomUUID().toString().replace("-", "").substring(0,8);
			 System.out.println(newPwd);
			 
			 param.put("address",param.get("email"));
			 param.put("subject", "비밀번호 재설정 안내");
			 param.put("content", newPwd);
			 
			 int result = mailComponent.sendMimeMessage(param);
	            
	            if(result > 0) {
	            	
	            	int changePassword = memberDao.changePassword(param);
	            	System.out.println(changePassword != 0 ? "변경 성공" : "변경 실패");
	            	
	            	return "redirect:/member/login";
	            }else {
	            	return "redirect:/member/sendPassword";
	            }    
	        }else {
	        	return "redirect:/member/sendPassword";
	        }
	
	}

	public int updateInfo(MemberDTO login, MemberDTO dto) {
		
		
		if(dto.getProfile_Upload() == null) {
			dto.setProfile_image(dto.getPrev_Profile());
		}
		else {
			String image = dto.getProfile_Upload().getOriginalFilename();
			dto.setProfile_image(image);
			File f = new File(saveDirectory, image);
			
			try {	
				dto.getProfile_Upload().transferTo(f);
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		return memberDao.updateInfo(dto);
	}
	
	
	
}
