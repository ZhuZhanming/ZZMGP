package test;

import org.junit.Before;
import org.junit.Test;

import com.xaut.zzmgp.dao.AdminDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.service.AdminService;

public class AdminDaoTest extends Testbase {
	private AdminDao adminDao;
	private AdminService adminService;
	@Before
	public void init(){
		adminDao = super.getContext().getBean("adminDao",AdminDao.class);
		adminService = super.getContext().getBean("adminService",AdminService.class);
	}
	@Test
	public void findByCodeTest(){
		System.out.println(adminDao.findByCode("system"));
	}
	@Test
	public void find(){
		try {
			Admin admin = adminService.login("adf", "3513");
			System.out.println(admin);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
}
