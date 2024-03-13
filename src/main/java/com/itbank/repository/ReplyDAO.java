package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.FeedDTO;
import com.itbank.model.replyDTO;

@RequestMapping
public interface ReplyDAO {

	@Select("select * from health_reply order by idx desc")
	List<replyDTO> selectList();

	@Insert("insert into health_reply (writer, content, writedate) values (#{writer}, #{content}, #{writedate})")
	int insert(FeedDTO dto);

	
}
