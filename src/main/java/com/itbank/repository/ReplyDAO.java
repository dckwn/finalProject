package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itbank.model.ReplyDTO;

@RequestMapping
public interface ReplyDAO {

    @Select("select * from health_reply where board_id = #{board_id} order by idx desc")
    List<ReplyDTO> selectList(int board_id);

    @Insert("insert into health_reply (writer, content, board_id) VALUES (#{writer}, #{content}, #{board_id})")
    int insert(ReplyDTO dto);

    @Delete("delete from health_reply where idx = #{idx}")
	int delete(ReplyDTO dto);

    @Update("update health_reply set"
    		+ "	content = #{content}"
    		+ "	where"
    		+ "	idx = #{idx}")
	int update(ReplyDTO dto);

  
    
   
}
