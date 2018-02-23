package com.xaut.zzmgp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.WhereOfAdmin;

@Repository("adminDao")
public interface AdminDao {
	Admin findByCode(String code);

	void save(Admin admin);
	
	void update(Admin admin);
	
	List<Admin> findAdmins(WhereOfAdmin where);
	
	List<Admin> findAllAdmins();
	
	int findRows(WhereOfAdmin where);
	
	void deleteAdmin(String code);

	int findVisitor();
	
}
