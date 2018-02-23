package com.xaut.zzmgp.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xaut.zzmgp.dao.ProductDao;
import com.xaut.zzmgp.dao.RecordDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.JsonResult;
import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.service.AdminService;
import com.xaut.zzmgp.service.ProductService;
import com.xaut.zzmgp.service.RecordService;
import com.xaut.zzmgp.service.exception.CodeException;
import com.xaut.zzmgp.service.exception.PasswordException;
import com.xaut.zzmgp.service.exception.ProductNotFoundException;

@Controller
@RequestMapping("/android")
public class AndroidController{
	@Resource(name = "adminService")
	private AdminService adminService;
	@Resource(name = "productDao")
	private ProductDao productDao;
	@Resource(name = "productService")
	private ProductService productService;
	@Resource(name = "recordService")
	private RecordService recordService;	
	@Resource(name = "recordDao")
	private RecordDao recordDao;
	
	@RequestMapping("/regist.do")
	@ResponseBody
	public String regist(Admin admin) {
		adminService.regist(admin);
		return "注册成功:" + admin.getCode();
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(String code, String password) {
		//System.out.println(code+":"+password);
		Admin admin = adminService.login(code, password);
		return new JsonResult(admin);
	}
	
	@RequestMapping("/product.do")
	@ResponseBody
	public Object product() {
		return new JsonResult(productService.loadAllProducts());
	}
	
	@RequestMapping("/admin.do")
	@ResponseBody
	public Object admin() {
		return new JsonResult(adminService.loadAllAdmins());
	}
	
	@RequestMapping("/record.do")
	@ResponseBody
	public Object record() {
		return new JsonResult(recordService.loadAllRecords());
	}

	@RequestMapping("/checkProductId.do")
	@ResponseBody
	public Object checkProductById(int id) {
		Product product = productService.findById(id);
		product.setNum(product.getAllNum());
		return new JsonResult(product);
	}
	
	@RequestMapping("/insertApply.do")
	@ResponseBody
	public Object insertApply(Record record){
		record.setInfo("app端进行的申请操作");
		recordService.insertApply(record);
		return "ok";
	}

	@ExceptionHandler(org.springframework.dao.DataAccessResourceFailureException.class)
	@ResponseBody
	public JsonResult DatabaseExc(){
		return new JsonResult(5,null,"链接数据库失败");
	}
	
	
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
	@ExceptionHandler(ProductNotFoundException.class)
	@ResponseBody
	public JsonResult productExc(ProductNotFoundException e) {
		return new JsonResult(2, e);
	}
	@ExceptionHandler(Exception.class)
	@ResponseBody
	public Object execute(Exception e) {
		e.printStackTrace();
		return new JsonResult(e);
	}
}
