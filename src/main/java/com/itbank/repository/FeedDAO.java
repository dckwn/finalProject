package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.FeedDTO;

@Repository
public interface FeedDAO {

	@Select("select * from health_board where choice = 'feed' order by idx")
	List<FeedDTO> selectList();

	@Select("select * from health_board where idx = #{idx}")
	FeedDTO selectOne(int idx);

	@Insert("insert into health_board (writer, title, maintext, originalFileName, storedFileName, choice) "
			+ "values (#{writer}, #{title}, #{maintext}, #{originalFileName}, #{storedFileName}, 'feed')")
	int insert(FeedDTO dto);

	@Update("update health_board set"
			+ " title = #{title}, "
			+ " maintext = #{maintext},"
			+ " originalFileName = #{originalFileName},"
			+ " storedFileName = #{storedFileName}"
			+ " where"
			+ " idx = #{idx}")
	int update(FeedDTO dto);

	@Delete("delete from health_board where idx = #{idx}")
	int delete(int idx);


	
}
