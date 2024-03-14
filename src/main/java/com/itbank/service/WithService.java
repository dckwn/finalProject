package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.WithDTO;
import com.itbank.repository.HealthBoardRepository;
import com.itbank.repository.WithRepository;

@Service
public class WithService {
		
	@Autowired private WithRepository withDAO;
	
	@Autowired
    private HealthBoardRepository healthBoardRepository; // 게시글 작성자가 작성한 게시글에 대한 정보를 가져오기 위해 추가

	public List<WithDTO> getWithList() {
		List<WithDTO> list = withDAO.selectList(); 
		for(WithDTO dto : list) {
			int withNum = withDAO.getPeople(dto.getIdx());
			dto.setWithNum(withNum);
		}
		return list;
	}


	public WithDTO getWith(int idx) {
		WithDTO dto = withDAO.selectOne(idx);
		dto.setWithNum(withDAO.getPeople(idx));
		return dto;
	}

	public int insert(String userid, int idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("idx", idx);
		return withDAO.insert(map);
	}		


	public int delete(int idx) {
		return withDAO.delete(idx);
	}

	public List<WithDTO> getMypageList() {
		List<WithDTO> list = withDAO.getMypageList();
		for(WithDTO dto : list) {
			int withNum = withDAO.getPeople(dto.getIdx());
			dto.setWithNum(withNum);
		}
		return list;
	}

	public int withModify(WithDTO dto) {
		int row = withDAO.update(dto);
		return row;
	}


	public int add(WithDTO dto) {
		return withDAO.add(dto);
	}

	private void increaseWithNum(int idx) {
        String writer = healthBoardRepository.getWriterByIdx(idx); // 게시글 작성자를 가져옴
        if (writer != null) {
            healthBoardRepository.increaseWithNum(writer); // 해당 작성자가 작성한 게시글의 withNum을 증가시킴
        }
    }
}
