package com.xaut.zzmgp.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xaut.zzmgp.dao.AllocationDao;
import com.xaut.zzmgp.dao.ProductDao;
import com.xaut.zzmgp.dao.RecordDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.Allocation;
import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.entity.Record;
import com.xaut.zzmgp.entity.WhereOfAllocation;
import com.xaut.zzmgp.entity.WhereOfProduct;
import com.xaut.zzmgp.service.ProductService;
import com.xaut.zzmgp.service.exception.ProductNotFoundException;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	@Resource(name = "productDao")
	private ProductDao productDao;
	@Resource(name = "recordDao")
	private RecordDao recordDao;
	@Resource(name = "allocationDao")
	private AllocationDao allocationDao;
	
	public List<Product> loadAllProducts() {
		return productDao.findAllProducts();
	}
	public Object[] loadProducts(WhereOfProduct where) {
		if (where.getPage() == null) {
			where.setPage(1);
		}
		Object[] objs = new Object[2];
		objs[0] = productDao.findProducts(where);
		objs[1] = productDao.findRows(where);
		return objs;
	}
	@Transactional
	public Integer insertProduct(Product product, Admin admin, String oname) {
		// 1保存 总数量
		Integer num = product.getNum();
		// 2保存印品-获得自动生成的id
		productDao.saveProduct(product);
		// 3修改记录 货位情况
		WhereOfAllocation where = new WhereOfAllocation();
		where.setKind(product.getKind());
		List<Allocation> allocations = new ArrayList<Allocation>();
		while (product.getNum() > 0) {
			allocations.add(saveForAddAllocation(product, where));
		}

		// 4保存记录-返回记录id
		product.setNum(num);
		return saveAddRecord(product, admin, allocations.toString(), oname);
	}

	/**
	 * 从货位为零到满
	 */
	private Allocation saveForAddAllocation(Product product, WhereOfAllocation where) {
		Allocation allocation = allocationDao.findOneAllocation(where);
		if (product.getNum() > allocation.getRemainder()) {
			product.setNum(product.getNum() - allocation.getRemainder());
			allocation.setNum(allocation.getRemainder());
			allocation.setRemainder(0);
		} else {
			Integer num = product.getNum();
			product.setNum(0);
			allocation.setNum(num);
			allocation.setRemainder(allocation.getRemainder() - num);
		}
		allocation.setProduct_id(product.getId());
		allocationDao.update(allocation);
		return allocation;
	}
	@Transactional
	public Integer addProduct(Product product, Admin admin, String oname) {
		List<Allocation> allocations = new ArrayList<Allocation>();
		// 1保存 总数量
		Integer num = product.getNum();
		// 2把以前没装满的装满
		allocations.add(addFirst(product));
		// 3修改记录 货位情况
		WhereOfAllocation where = new WhereOfAllocation();
		where.setKind(product.getKind());
		while (product.getNum() > 0) {
			allocations.add(saveForAddAllocation(product, where));
		}
		// 4保存记录-返回记录id
		product.setNum(num);
		return saveAddRecord(product, admin, allocations.toString(), oname);
	}

	private Allocation addFirst(Product product) {
		Integer num;
		WhereOfAllocation where = new WhereOfAllocation();
		where.setKind(product.getKind());
		where.setProduct_id(product.getId());
		Allocation allocation = allocationDao.findOneAllocation(where);
		if (product.getNum() > allocation.getRemainder()) {
			num = allocation.getRemainder();
			product.setNum(product.getNum() - num);
			allocation.setNum(allocation.getNum() + num);
			allocation.setRemainder(0);
		} else {
			num = product.getNum();
			product.setNum(0);
			allocation.setNum(allocation.getNum() + num);
			allocation.setRemainder(allocation.getRemainder() - num);
		}
		allocation.setProduct_id(product.getId());
		allocationDao.update(allocation);
		// 记录实际存储的数据
		allocation.setNum(num);
		return allocation;
	}
	@Transactional
	public Integer subProduct(Integer id, String oname, Integer num, Admin admin) {
		int allNum = num;
		List<Allocation> allocations = new ArrayList<Allocation>();
		Product product = productDao.findById(id);
		if (num > product.getAllNum()) {
			return 666;
		}
		int index = product.getAllocations().size();
		while (num > 0) {
			//存储每次操作的数量
			int i = 0;
			Allocation allocation = product.getAllocations().get(--index);
			if (num >= allocation.getNum()) {
				i = allocation.getNum();
				num -= i;
				allocation.setNum(0);
				allocation.setRemainder(allocation.getRemainder() + i);
				allocation.setProduct_id(null);
				allocation.setProduct_name(null);
			} else {
				i = num;
				num = 0;
				allocation.setNum(allocation.getNum() - i);
				allocation.setRemainder(allocation.getRemainder() + i);
			}
			allocationDao.update(allocation);
			allocation.setNum(i);
			allocations.add(allocation);
		}

		product.setNum(allNum);
		return saveSubRecord(product, admin, allocations.toString(), oname);
	}
	
	private Integer saveAddRecord(Product product, Admin admin, String info, String oname) {
		Record record = new Record();
		record.setKind(Record.IN);
		record.setProduct_id(product.getId());
		record.setAdmin_id(admin.getId());
		record.setNum(product.getNum());
		record.setOname(oname);
		record.setInfo(info);
		recordDao.insertRecord(record);
		return record.getId();
	}
	
	private Integer saveSubRecord(Product product, Admin admin, String info, String oname) {
		Record record = new Record();
		record.setKind(Record.OUT);
		record.setProduct_id(product.getId());
		record.setAdmin_id(admin.getId());
		record.setNum(product.getNum());
		record.setOname(oname);
		record.setInfo(info);
		recordDao.insertRecord(record);
		return record.getId();
	}

	public Product findById(Integer id) {
		if (id == null) {
			throw new ProductNotFoundException("id不能为空");
		}
		Product product = productDao.findById(id);
		if (product == null) {
			throw new ProductNotFoundException("货物不存在");
		}
		return product;
	}

}
