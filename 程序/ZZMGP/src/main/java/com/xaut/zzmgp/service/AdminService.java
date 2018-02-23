package com.xaut.zzmgp.service;

import java.util.List;

import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.WhereOfAdmin;

public interface AdminService {
	Admin login(String code, String password);

	String checkCode(String code);
	
	void regist(Admin admin);
	
	void modify(Admin admin);
	
	Object[] loadAdmins(WhereOfAdmin where);
	
	List<Admin> loadAllAdmins();
	
	String deleteAdminByCode(String code);
}
