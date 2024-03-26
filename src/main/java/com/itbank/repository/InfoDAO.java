package com.itbank.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.InfoDTO;

@Repository
public interface InfoDAO {

//	@Insert ("insert into health_info (userid, height, weight, activity, intake) "
//			+ "values (#{userid}, #{height}, #{weight}, #{activity}, #{intake})")
	int insert(InfoDTO infoDto);

//	@Select("select * from health_info where userid=#{userid}")
	InfoDTO selectOne(String userid);

	
}
