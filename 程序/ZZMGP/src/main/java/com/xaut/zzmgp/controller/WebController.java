package com.xaut.zzmgp.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xaut.zzmgp.dao.AdminDao;
import com.xaut.zzmgp.dao.ProductDao;
import com.xaut.zzmgp.dao.RecordDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.Apply;
import com.xaut.zzmgp.entity.JsonResult;
import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.entity.WhereOfAdmin;
import com.xaut.zzmgp.entity.WhereOfAllocation;
import com.xaut.zzmgp.entity.WhereOfProduct;
import com.xaut.zzmgp.entity.WhereOfRecord;
import com.xaut.zzmgp.service.AdminService;
import com.xaut.zzmgp.service.AllocationService;
import com.xaut.zzmgp.service.ProductService;
import com.xaut.zzmgp.service.RecordService;

@Controller
@RequestMapping("/web")
public class WebController extends ExceptionController {
	@Resource(name = "adminDao")
	private AdminDao adminDao;
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
	@Resource(name = "allocationService")
	private AllocationService allocationService;

	@RequestMapping("/findIn.do")
	@ResponseBody
	public int findIn() {
		return recordDao.findNumForIn();
	}

	@RequestMapping("/findOut.do")
	@ResponseBody
	public int findOut() {
		return recordDao.findNumForOut();
	}

	@RequestMapping("/findVisitor.do")
	@ResponseBody
	public int findVisitor() {
		int i = adminDao.findVisitor();
		return i;
	}

	@RequestMapping("/allocation.do")
	public String allocation(HttpServletRequest request, WhereOfAllocation where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		Object[] objs = allocationService.loadAllocations(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0)
			total++;
		request.setAttribute("allocations", objs[0]);
		request.setAttribute("total", total);
		request.setAttribute("page", where.getPage());
		request.setAttribute("allNum", objs[2]);
		request.setAttribute("allRemainder", objs[3]);
		request.setAttribute("areas", objs[4]);
		if (objs[5] != null) {
			request.setAttribute("frames", objs[5]);
		}
		request.setAttribute("where", where);
		return "allocation";
	}

	@RequestMapping("/applyin.do")
	public String applyin(HttpServletRequest request, WhereOfRecord where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		where.setKind(2);
		Object[] objs = recordService.loadApplys(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0)
			total++;
		request.setAttribute("applys", objs[0]);
		request.setAttribute("total", total);
		request.setAttribute("where", where);
		return "applyin";
	}

	@RequestMapping("/applyout.do")
	public String applyout(HttpServletRequest request, WhereOfRecord where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		where.setKind(3);
		Object[] objs = recordService.loadApplys(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0)
			total++;
		request.setAttribute("applys", objs[0]);
		request.setAttribute("page", where.getPage());
		request.setAttribute("total", total);
		request.setAttribute("where", where);
		return "applyout";
	}

	@RequestMapping("/agreeApply.do")
	@Transactional
	public String agreeApply(Integer id, HttpServletRequest request, HttpSession session) {
		recordDao.updateApplyOfAgree(id);
		System.err.println(id);
		Apply apply = recordDao.findApplyById(id);
		Product product = productDao.findById(apply.getProduct_id());
		product.setNum(apply.getNum());
		String str;
		if (apply.getKind() == 2)
			str = addProduct(product, request, session, apply.getOname());
		else
			str = subProduct(apply.getProduct_id(), apply.getOname(), request, apply.getNum(), session);
		return str;
	}

	@RequestMapping("/refuseApply.do")
	@ResponseBody
	public String refuseApply(Integer id,HttpServletResponse response) {
		recordDao.updateApplyOfRefuse(id);
		response.setCharacterEncoding("utf-8");
		return "取消成功";
	}

	@RequestMapping("/toLogin.do")
	public String toLogin(HttpSession session) {
		session.invalidate();
		return "login";
	}

	@RequestMapping("/login.do")
	@ResponseBody
	public JsonResult login(String code, String password, HttpSession session) {
		Admin admin = adminService.login(code, password);
		session.setAttribute("admin", admin);
		return new JsonResult("登录成功");
	}

	@RequestMapping("/index.do")
	public String index() {
		return "index";
	}

	@RequestMapping("/checkCode.do")
	public void checkCode(String code, HttpServletResponse response) throws IOException {
		String message = adminService.checkCode(code);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		pw.println(message);
		pw.close();
	}

	@RequestMapping("/regist.do")
	@ResponseBody
	public JsonResult regist(Admin admin) {
		adminService.regist(admin);
		return new JsonResult("注册成功:" + admin.getCode());
	}

	@RequestMapping("/toSetPwd.do")
	public String toSetPwd() {
		return "setPwd";
	}

	@RequestMapping("/setPwd.do")
	public void setPwd(String oldPwd, String newPwd, String name, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		Admin admin = (Admin) session.getAttribute("admin");
		if (admin.getPassword().equals(oldPwd)) {
			admin.setPassword(newPwd);
			admin.setName(name);
			adminService.modify(admin);
			session.invalidate();
			pw.println("修改成功");
		} else {
			pw.println("旧密码错误");
		}
		pw.close();
	}

	@RequestMapping("/toAdmin.do")
	public String toAdmin(String password, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		String code = admin.getCode();
		try {
			adminService.login(code, password);
			return "redirect:/web/admin.do";
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/web/toLogin.do";
		}
	}

	@RequestMapping("/admin.do")
	public String admin(HttpServletRequest request, WhereOfAdmin where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		Object[] objs = adminService.loadAdmins(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0) {
			total++;
		}
		request.setAttribute("admins", objs[0]);
		request.setAttribute("page", where.getPage());
		request.setAttribute("total", total);
		request.setAttribute("where", where);
		return "admin";
	}

	@RequestMapping("/modifyPower.do")
	public void modifyPower(HttpServletResponse response, Admin admin) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		try {
			adminService.modify(admin);
			pw.println("修改成功");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			pw.println("修改失败");
		} finally {
			pw.close();
		}

	}

	@RequestMapping("/deleteAdmin.do")
	public void modifyPower(HttpServletResponse response, String code) throws IOException {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		try {
			pw.println(adminService.deleteAdminByCode(code) + ",删除成功");
		} catch (Exception e) {
			System.out.println(e.getMessage());
			pw.println("删除失败");
		} finally {
			pw.close();
		}
	}

	@RequestMapping("/product.do")
	public String product(HttpServletRequest request, WhereOfProduct where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		Object[] objs = productService.loadProducts(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0)
			total++;
		request.setAttribute("products", objs[0]);
		request.setAttribute("page", where.getPage());
		request.setAttribute("total", total);
		request.setAttribute("where", where);
		return "product";
	}

	@RequestMapping("/checkProductId.do")
	@ResponseBody
	public JsonResult checkProductById(Integer id) {
		Product product = productService.findById(id);
		product.setNum(product.getAllNum());
		return new JsonResult(product);
	}

	@RequestMapping("/toAddProduct.do")
	public String toAddProduct() {
		return "addProduct";
	}

	@RequestMapping("/addProduct.do")
	public String addProduct(Product product, HttpServletRequest request, HttpSession session, String oname) {
		Admin admin = (Admin) session.getAttribute("admin");
		Integer id = null;
		if (product.getId() == null) {
			id = productService.insertProduct(product, admin, oname);
		} else {
			id = productService.addProduct(product, admin, oname);
		}
		Record record = recordDao.findById(id);
		String str = record.getInfo();
		str = str.substring(1, str.indexOf("]"));
		str = str.replaceAll(":", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		String[] alls = str.split(",");
		request.setAttribute("record", record);
		request.setAttribute("alls", alls);
		return "print";
	}

	@RequestMapping("/toSubProduct.do")
	public String toSubProduct() {
		return "subProduct";
	}

	@RequestMapping("/subProduct.do")
	public String subProduct(Integer id, String oname, HttpServletRequest request, Integer num, HttpSession session) {
		Admin admin = (Admin) session.getAttribute("admin");
		id = productService.subProduct(id, oname, num, admin);
		Record record = recordDao.findById(id);
		System.out.println(record);
		String str = record.getInfo();
		str = str.substring(1, str.indexOf("]"));
		str = str.replaceAll(":", "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		String[] alls = str.split(",");
		request.setAttribute("record", record);
		request.setAttribute("alls", alls);
		return "print";
	}

	@RequestMapping("/record.do")
	public String record(HttpServletRequest request, WhereOfRecord where) {
		int size = Integer.parseInt(request.getServletContext().getInitParameter("size"));
		where.setSize(size);
		Object[] objs = recordService.loadRecords(where);
		int row = (Integer) objs[1];
		int total = row / size;
		if (row % size != 0)
			total++;
		request.setAttribute("records", objs[0]);
		request.setAttribute("page", where.getPage());
		request.setAttribute("total", total);
		request.setAttribute("where", where);
		return "record";
	}
}
