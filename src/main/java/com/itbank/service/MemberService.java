package com.itbank.service;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO memberDao;

	private String saveDirectory = "D:\\upload\\profile";
		
	public MemberService() {
		//스프링 빈이 생성될 때 (=서버가 시작될 때) saveDirectory 경로를 체크하고 없으면 새로 만든다
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public MemberDTO login(MemberDTO dto) {
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
		
		return memberDao.insert(dto);
	}

	public int check(HashMap<String, Object> param) {
		return memberDao.check(param);
	}
	
	
	
}
