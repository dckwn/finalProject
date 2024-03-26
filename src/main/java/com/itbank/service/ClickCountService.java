package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.repository.ClickCountDAO;

@Service
public class ClickCountService {

	@Autowired private ClickCountDAO clickCountDAO;

	public void increaseClickCount(Long boardId) {
        clickCountDAO.increaseClickCount(boardId);
    }

    public void decreaseClickCount(Long boardId) {
        clickCountDAO.decreaseClickCount(boardId);
    }
}
