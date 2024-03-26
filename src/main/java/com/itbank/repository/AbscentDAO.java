package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.AbscentDTO;

@Repository
public interface AbscentDAO {

//   @Insert("insert into health_abscent (userid) values (#{userid})")
   int insert(String userid);

//   @Select("SELECT DISTINCT EXTRACT(DAY FROM checkDate) AS day"
//         + " FROM health_abscent"
//         + " WHERE EXTRACT(MONTH FROM checkDate) = #{month} and userid=#{userid}")
   List<Integer> abscentList(HashMap<String, Object> map1);
   			
//   @Select("select count(*) as totalCheckDate"
//   		+ " from health_abscent"
//   		+ " where userid = #{userid}")
   int getTotaclCheckDate(String userid);
  
}
