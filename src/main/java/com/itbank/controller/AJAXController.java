package com.itbank.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.itbank.model.ClickEventDTO;
import com.itbank.model.ReplyDTO;
import com.itbank.service.ClickCountService;
import com.itbank.service.LikeService;
import com.itbank.service.ReplyService;

@Controller
public class AJAXController {

	@Autowired private ReplyService rs;
	@Autowired private ClickCountService clickCountService;
    @Autowired private LikeService likeService;
	
	
	@PostMapping("/feed/view/{idx}/{feedidx}")
	public String replyModify(@RequestBody ReplyDTO dto) {
		int row = rs.replyModify(dto);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/social/feed/view/{idx}/{feedidx}";
	}
	
	// 클릭 이벤트 처리 메서드
    @PostMapping("/api/clickEvent")
    public ResponseEntity<String> handleEvent(@RequestBody ClickEventDTO clickEventDTO) {
        try {
            if ("increase".equals(clickEventDTO.getAction())) {
                clickCountService.increaseClickCount(clickEventDTO.getBoardId());
            } else if ("decrease".equals(clickEventDTO.getAction())) {
                clickCountService.decreaseClickCount(clickEventDTO.getBoardId());
            }
            return ResponseEntity.ok("Click event handled successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error handling click event.");
        }
    }
    
    // 게시물 좋아요 처리 메서드
    @PostMapping("/api/like")
    public ResponseEntity<String> likePost(@RequestParam Long postId, @RequestParam String userId) {
        try {
            likeService.likePost(postId, userId);
            return ResponseEntity.ok("Post liked successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error liking post.");
        }
    }

    // 게시물 좋아요 취소 처리 메서드
    @PostMapping("/api/unlike")
    public ResponseEntity<String> unlikePost(@RequestParam Long postId, @RequestParam String userId) {
        try {
            likeService.unlikePost(postId, userId);
            return ResponseEntity.ok("Post unliked successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error unliking post.");
        }
    }

}
