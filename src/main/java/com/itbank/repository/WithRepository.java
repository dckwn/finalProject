package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.WithDTO;

@Repository
public interface WithRepository {

	@Select("select * from health_board where choice='with' order by idx")
	List<WithDTO> selectList();

	@Select("select * from health_board where idx = #{idx}")
	WithDTO selectOne(int idx);

	@Insert("insert into health_with (withPeople, board_id) values (#{userid}, #{idx})")
	int insert(Map<String, Object> map);

	@Select("select count(*) from health_with where board_id = #{idx}")
	int getPeople(int idx);

	@Delete("delete from health_board where idx = #{idx}")
	int delete(int idx);

	@Select("select * from health_board where choice='with' order by idx")
	List<WithDTO> getMypageList();
	
	@Update("update health_board "
			+ "set "
			+ "		title=#{title},"
			+ "		category=#{category},"
			+ "		peopleNum=#{peopleNum},"
			+ "		start_date=#{start_date},"
			+ "		end_date=#{end_date} "
			+ "where "
			+ "		idx=#{idx}")
	int update(WithDTO dto);

	@Insert("insert into health_board (title, writer, choice, category, peopleNum, start_date, end_date) "
			+ " values (#{title}, #{writer}, #{choice}, #{category}, #{peopleNum}, #{start_date}, #{end_date}) ") 
	int add(WithDTO dto);

	@Delete("DELETE FROM health_with WHERE withPeople = #{userid} AND board_id = #{idx}")
	int cancel(Map<String, Object> map);


//	@Insert("insert into health_board (title,writer,maintext,image,category,choice, write_date ,start_date ,end_date,peopleNum)"
//			+ "values(#{title}, #{writer},#{maintext},#{image},#{category,#{choice},#{write_date},#{start_date} ,#{end_date},#{peopleNum})")
//	int insert(WithDTO dto);
}