package com.xaut.zzmgp.controller;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xaut.zzmgp.entity.JsonResult;
import com.xaut.zzmgp.service.exception.CodeException;
import com.xaut.zzmgp.service.exception.PasswordException;

public abstract class ExceptionController {
	@ExceptionHandler(CodeException.class)
	@ResponseBody
	public JsonResult nameExp(CodeException e) {
		return new JsonResult(2, e);
	}

	@ExceptionHandler(PasswordException.class)
	@ResponseBody
	public JsonResult passwordExc(PasswordException e) {
		return new JsonResult(3, e);
	}

	@ExceptionHandler(Exception.class)
	public String execute(Exception e) {
		e.printStackTrace();
		return "error";
	}
}
