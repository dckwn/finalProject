package com.itbank.repository;

import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface ClickCountDAO {

	 // 게시물의 클릭 수를 증가시키는 메서드
    @Update("UPDATE health_board SET click_count = click_count + 1 WHERE idx = #{boardId}")
    int increaseClickCount(Long boardId);

    // 게시물의 클릭 수를 감소시키는 메서드
    @Update("UPDATE health_board SET click_count = click_count - 1 WHERE idx = #{boardId}")
    int decreaseClickCount(Long boardId);
}
