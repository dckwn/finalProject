package com.itbank.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.TicketDTO;

@Repository
public interface TicketDAO {

	@Select("select * from health_ticket")
	List<TicketDTO> getList();

	@Select("select * from health_ticket where idx = #{idx}")
	TicketDTO getOne(int idx);

	@Insert("insert into health_deal (userid, ticket_id, expirDay, tkCount)"
			+ " values( #{userid}, #{ticket_id},"
			+ " (SYSDATE + NVL((SELECT SUM(tkcount) FROM health_deal WHERE userid = #{userid}), 0) + 180),"
			+ " (select tk_value from health_ticket where idx = #{ticket_id}))")
	int buy(Map<String, Object> map);
	
	
}
