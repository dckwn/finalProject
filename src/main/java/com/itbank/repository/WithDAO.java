package com.itbank.repository;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.HealthWithDTO;
import com.itbank.model.WithDTO;

@Repository
public interface WithDAO {


	@Select("select * from health_with where board_id = #{idx} ")
	List<HealthWithDTO> selectWlist(int idx);   // health_with (동행정보) 해당 id의 정보

	@Select("select * from health_board where choice='with' order by idx")
	List<WithDTO> selectList();					// with게시글리스트 보기

	@Select("select * from health_board where idx = #{idx}")
	WithDTO selectOne(int idx);					// with게시글 조회하기

	@Insert("insert into health_with (withPeople, board_id) values (#{userid}, #{idx})")
	int receipt(Map<String, Object> map);			// 접수하기

	@Select("select count(*) from health_with where board_id = #{idx}")
	int getPeople(int idx);							// 참여인원 수량 
	 

	@Delete("delete from health_board where idx = #{idx}")
	int delete(int idx);							// 삭제

	@Select("select * from health_board where choice='with' and writer=#{userid} order by idx")
	List<WithDTO> getMypageList(String userid);			// 마이페이지 내가 작성한 with리스트
	
	@Update("update health_board "
			+ "set "
			+ "		title=#{title},"
			+ "		category=#{category},"
			+ "		peopleNum=#{peopleNum},"
			+ "		start_date=#{start_date},"
			+ "		end_date=#{end_date} "
			+ "where "
			+ "		idx=#{idx}")
	int update(WithDTO dto);				// 수정하기

	@Insert("insert into health_board (title, writer, choice, category, peopleNum, start_date, end_date) "
			+ " values (#{title}, #{writer}, #{choice}, #{category}, #{peopleNum}, #{start_date}, #{end_date}) ") 
	int add(WithDTO dto);					// 작성하기

	@Delete("DELETE FROM health_with WHERE withPeople = #{userid} AND board_id = #{idx}")
	int cancel(Map<String, Object> map);   // 취소하기

	@Select("SELECT * FROM health_board WHERE idx IN (SELECT board_id FROM health_with WHERE withPeople = #{userid})")
	List<WithDTO> selectwJoinedList(String userid);    // mypage with에 내가 참여한 with

	@Select("select * from health_board where choice='with' and title like '%' || #{keyword} || '%' order by idx")
	List<WithDTO> findByTitleContaining(String keyword);

	@Select("SELECT * FROM health_board WHERE choice='with' AND category = #{category} ORDER BY idx")
	List<WithDTO> findByCategory(String category);

	@Select("SELECT * FROM health_board WHERE choice='with' AND category = #{category} AND title  like '%' || #{keyword} || '%' ORDER BY idx")
	List<WithDTO> findByCategoryAndKeyword(String category, String keyword);



//	@Insert("insert into health_board (title,writer,maintext,image,category,choice, write_date ,start_date ,end_date,peopleNum)"
//			+ "values(#{title}, #{writer},#{maintext},#{image},#{category,#{choice},#{write_date},#{start_date} ,#{end_date},#{peopleNum})")
//	int insert(WithDTO dto);
}