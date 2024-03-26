package com.itbank.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeDAO {

	// 하트의 상태를 업데이트하는 메서드
    @Update("UPDATE health_board SET heart_status = #{heartStatus} WHERE idx = #{boardId}")
    int updateHeartStatus(Long boardId, String heartStatus);

    // 하트의 카운트를 증가시키는 메서드
    @Update("UPDATE health_board SET heart_count = heart_count + 1 WHERE idx = #{boardId}")
    int increaseHeartCount(Long boardId);

    // 하트의 카운트를 감소시키는 메서드
    @Update("UPDATE health_board SET heart_count = heart_count - 1 WHERE idx = #{boardId}")
    int decreaseHeartCount(Long boardId);

    // 하트를 누른 경우 정보를 삽입하는 메서드
    @Insert("INSERT INTO like_table (post_id, user_id) VALUES (#{postId}, #{userId})")
    int likePost(Long postId, String userId);

    // 하트를 취소한 경우 정보를 삭제하는 메서드
    @Delete("DELETE FROM like_table WHERE post_id = #{postId} AND user_id = #{userId}")
    int unlikePost(Long postId, String userId);
}
