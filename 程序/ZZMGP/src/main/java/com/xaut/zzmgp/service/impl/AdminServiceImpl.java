package com.xaut.zzmgp.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xaut.zzmgp.dao.AdminDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.WhereOfAdmin;
import com.xaut.zzmgp.service.AdminService;
import com.xaut.zzmgp.service.exception.CodeException;
import com.xaut.zzmgp.service.exception.PasswordException;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	@Resource(name = "adminDao")
	private AdminDao adminDao;

	public Admin login(String code, String password) {
		if (code == null || code.isEmpty()) {
			throw new CodeException("账号为空");
		}
		if (password == null || code.isEmpty()) {
			throw new PasswordException("密码为空");
		}
		Admin admin = adminDao.findByCode(code);
		if (admin == null) {
			throw new CodeException("账号不存在");
		}
		if (!password.equals(admin.getPassword())) {
			throw new PasswordException("密码错误");
		}
		return admin;
	}

	public String checkCode(String code) {
		if (code == null || code.isEmpty()) {
			return "账号不能为空";
		}
		if (adminDao.findByCode(code) != null) {
			return "账号已存在";
		}
		if (!code.matches("\\w{3,}")) {
			return "账号格式不合法";
		}
		return "可以使用";
	}

	public void regist(Admin admin) {
		if (adminDao.findByCode(admin.getCode()) != null) {
			throw new CodeException("用户名已存在");
		}
		if (!admin.getPassword().matches("\\w{3,}")) {
			throw new PasswordException("密码格式不正确");
		}
		String name = admin.getName();
		if (name == null || name.trim().isEmpty()) {
			admin.setName(admin.getCode());
		}
		adminDao.save(admin);
	}

	public void modify(Admin admin) {
		if (admin != null && admin.getCode() != null) {
			adminDao.update(admin);
		} else {
			throw new CodeException("账号错误");
		}
	}

	public List<Admin> loadAllAdmins() {
		return adminDao.findAllAdmins();
	}
	public Object[] loadAdmins(WhereOfAdmin where) {
		if (where.getPage() == null) {
			where.setPage(1);
		}
		Object[] objs = new Object[2];
		objs[0] = adminDao.findAdmins(where);
		objs[1] = adminDao.findRows(where);
		return objs;
	}

	public String deleteAdminByCode(String code) {
		Admin admin = adminDao.findByCode(code);
		if (admin != null) {
			adminDao.deleteAdmin(code);
			return admin.getName();
		} else {
			throw new CodeException("账号不存在");
		}
	}

}
