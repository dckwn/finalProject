package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.repository.LikeDAO;

@Service
public class LikeService {

	 @Autowired private LikeDAO likeDAO;

	 public void likePost(Long postId, String userId) {
		 likeDAO.likePost(postId, userId);
	 }

	 public void unlikePost(Long postId, String userId) {
		 likeDAO.unlikePost(postId, userId);
	 }
}
