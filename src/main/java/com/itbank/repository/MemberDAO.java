package com.itbank.repository;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;

@Repository
public interface MemberDAO {

	@Select("select * from health_member where userid=#{userid} and userpw=#{userpw}")
	MemberDTO login(MemberDTO dto);

	@Select("select count(*) from health_member where userid = #{userid}")
	int check(HashMap<String, Object> param);
	
	@Insert("insert into health_member (userid, userpw, username, birth, profile_image, gender, phone_num, email) "
			+ "values (#{userid}, #{userpw}, #{username}, #{birth}, #{profile_image}, #{gender}, #{phone_num}, #{email})")
	int insert(MemberDTO dto);

	@Select("select * from health_member where userid=#{userid}")
	MemberDTO selectOne(String userid);
}
