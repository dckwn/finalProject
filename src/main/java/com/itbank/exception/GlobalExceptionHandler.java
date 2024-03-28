package com.itbank.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.NoHandlerFoundException;


@ControllerAdvice
public class GlobalExceptionHandler {
	   
	@ExceptionHandler(NoHandlerFoundException.class)
	    public ModelAndView handle404(NoHandlerFoundException e) {
	        return new ModelAndView("redirect:/page404");
	}
	
//	@ExceptionHandler(IllegalArgumentException.class)
//    public ResponseEntity<String> handleIllegalArgumentException(IllegalArgumentException ex) {
//        return new ResponseEntity<>("유효하지 않은 입력값: " + ex.getMessage(), HttpStatus.BAD_REQUEST);
//    }
//	
}

