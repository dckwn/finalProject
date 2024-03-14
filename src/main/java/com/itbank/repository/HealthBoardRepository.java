package com.itbank.repository;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface HealthBoardRepository {

	@Select("SELECT writer FROM health_board WHERE idx = #{idx}")
	String getWriterByIdx(int idx);
	
	@Update("UPDATE health_member SET withNum = withNum + 1 WHERE userid = #{userid}")
	void increaseWithNum(String writer);


}
