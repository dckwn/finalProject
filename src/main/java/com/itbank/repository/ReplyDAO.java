package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.ReplyDTO;

@RequestMapping
public interface ReplyDAO {

	@Select("select * from health_reply where board_id = #{board_id} order by idx desc")
	List<ReplyDTO> selectList(int idx);


	@Insert("insert into health_reply (writer, content, board_id) values (#{writer}, #{content}, #{board_id})")
	int insert(ReplyDTO dto);

	
}
