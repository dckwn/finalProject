package com.itbank.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.HealthWithDTO;
import com.itbank.model.WithDTO;
import com.itbank.repository.WithDAO;

@Service
public class WithService {
		
	@Autowired private WithDAO withDAO;
	
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

	public int receipt(String userid, int idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("idx", idx);
		return withDAO.receipt(map);
	}		


	public int delete(int idx) {
		return withDAO.delete(idx);
	}

	public List<WithDTO> getMypageList(String userid) {
		List<WithDTO> list = withDAO.getMypageList(userid);
		for(WithDTO dto : list) {
			int withNum = withDAO.getPeople(dto.getIdx());
			dto.setWithNum(withNum);
		}
		return list;
	}

	public List<WithDTO> getwJoinList(String userid) {
		List<WithDTO> wlist = withDAO.selectwJoinedList(userid); 
		for(WithDTO dto : wlist) {
			int withNum = withDAO.getPeople(dto.getIdx());
			dto.setWithNum(withNum);
		}
		return  wlist;
	}

	public int withModify(WithDTO dto) {
		int row = withDAO.update(dto);
		return row;
	}


	public int add(WithDTO dto) {
		return withDAO.add(dto);
	}


		public int cancel(String userid, int idx) {
		Map<String, Object> map = new HashMap<>();
		map.put("userid", userid);
		map.put("idx", idx);
		return withDAO.cancel(map);
	}


		public List<HealthWithDTO> getlist(int idx) {
			List<HealthWithDTO> list = withDAO.selectWlist(idx);
			return list;
		}


		public List<WithDTO> getWithListWithKeyword(String keyword) {
			return  withDAO.findByTitleContaining(keyword);
		}


		public List<WithDTO> getWithListWithCategory(String category) {
			List<WithDTO> list = withDAO.findByCategory(category);
			for(WithDTO dto : list ) {
				int withNum = withDAO.getPeople(dto.getIdx());
				dto.setWithNum(withNum);
			}
			return list;
		}


		public List<WithDTO> getWithListWithCategoryAndKeyword(String category, String keyword) {
			return withDAO.findByCategoryAndKeyword(category, keyword);
		}


//		public List<WithDTO> searchPosts(String searchType, String keyword) {
//			List<WithDTO> searchResult = null;
//			if("작성자".equals(searchType)) {
//				searchResult = withDAO.searchBywriter(keyword);
//			} else if("제목".equals(searchType)) {
//				searchResult = withDAO.searchBytitle(keyword);
//			} else if ("날짜".equals(searchType)) {
//				searchResult = withDAO.searchBydate(keyword);
//			}
//			return searchResult;
//		}




	






		

}
