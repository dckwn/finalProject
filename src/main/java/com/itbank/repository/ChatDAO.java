package com.itbank.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.itbank.model.ChatDTO;

@Repository
public interface ChatDAO {

//	@Insert("insert into health_chat (who_chat, who_send, content) "
//			+ "values (#{who_chat}, #{who_send}, #{content})")
	int insert(ChatDTO dto);

//	@Select("select * from health_chat where who_chat = #{who_chat} order by idx")
	List<ChatDTO> select(String who_chat);

//	@Delete("delete from health_chat where who_chat = #{who_chat}")
	int delete(String who_chat);

//	@Select("select who_chat from health_chat group by who_chat")
	List<String> load();

//	@Update("update health_chat set isRead = 0 who_send = #{who_chat}")
	void read(String who_chat);

}
