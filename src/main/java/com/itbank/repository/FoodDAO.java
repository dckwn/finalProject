package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import com.itbank.model.FoodDTO;

public interface FoodDAO {

	List<FoodDTO> selectSearchList(HashMap<String, Object> map);

	List<String> selectCategory();

	int insert(FoodDTO foodDto);

	List<FoodDTO> selectListByUserInsert();

}
