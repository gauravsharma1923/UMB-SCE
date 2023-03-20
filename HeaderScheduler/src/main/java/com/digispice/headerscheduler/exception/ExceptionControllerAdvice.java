package com.digispice.headerscheduler.exception;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.digispice.headerscheduler.response.ResponseObj;

@ControllerAdvice(annotations = RestController.class)
public class ExceptionControllerAdvice {

	@Autowired
	private MessageSource messageSource;

	@ExceptionHandler(value = { GenericException.class })
	@ResponseStatus(value = HttpStatus.OK)
	@ResponseBody
	public ResponseObj genericException(HttpServletRequest request,GenericException ex) {
		return new ResponseObj(null, ex.getStatus(), ex.getErrorDescription(),
				ex.getCode());
	}
}