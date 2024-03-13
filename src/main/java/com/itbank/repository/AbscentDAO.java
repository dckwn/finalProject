package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.AbscentDTO;

@Repository
public interface AbscentDAO {

	@Insert("insert into health_abscent (userid) values (#{userid})")
	int insert(String userid);

	@Select("select * from health_abscent")
	List<AbscentDTO> selectList();

	
}
