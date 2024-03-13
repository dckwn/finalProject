package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.FeedDTO;
import com.itbank.repository.FeedDAO;

@Service
public class FeedService {

	@Autowired private FeedDAO dao;
	@Autowired private FileComponent filecomponent;

	public List<FeedDTO> getList() {
		
		return dao.selectList();
	}

	public FeedDTO getHealth_board(int idx) {
		
		return dao.selectOne(idx);
	}

	public int write(FeedDTO dto) {
		int row = 0;
		List<MultipartFile> list = dto.getUpload();
		String ori = "";
		String result = "";
		for(MultipartFile f : list) {
			ori += f.getOriginalFilename() + ":";
			result += filecomponent.upload(f) + ":";
		}
		ori = ori.substring(0, ori.length()-1);
		result = result.substring(0, result.length() - 1);
		dto.setStoredFileName(result);
		dto.setOrigianlFileName(ori);
		row = dao.insert(dto);
		return row;
	}

	public int modify(FeedDTO dto) {
		
		return dao.update(dto);
	}

	public int delete(int idx) {
		
		return dao.delete(idx);
	}


	
}
