package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.InfoDTO;
import com.itbank.model.MemberDTO;
import com.itbank.repository.InfoDAO;
import com.itbank.repository.MemberDAO;

@Service
public class InfoService {
	
	@Autowired InfoDAO infoDao;
	@Autowired MemberDAO memberDao;
	
	public int add(InfoDTO infoDto) {
		MemberDTO member = memberDao.selectOne(infoDto.getUserid());
		int gender = "남성".equals(member.getGender()) ? 22 : 21;
		int result = (int) ((infoDto.getHeight() / 100) * (infoDto.getHeight() / 100) * gender);
		infoDto.setIntake(result * infoDto.getActivity());
		
		return infoDao.insert(infoDto);
	}

	public InfoDTO getOne(String userid) {
		InfoDTO dto = infoDao.selectOne(userid);
		if(dto != null) {
			int intake = dto.getIntake();
			dto.setUserTan((int) (intake * 0.5 / 4));
			dto.setUserDan((int) (intake * 0.3 / 4));
			dto.setUserJi((int) (intake * 0.2 / 9));
		}
		return dto;
	}
	
}
