package test;

import org.junit.Before;
import org.junit.Test;

import com.xaut.zzmgp.dao.RecordDao;
import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.service.ProductService;

public class AllocationDaoTest extends Testbase {
	private ProductService productService;
	private RecordDao recordDao;
	@Before
	public void init(){
		productService = super.getContext().getBean("productService",ProductService.class);
		recordDao = super.getContext().getBean("recordDao",RecordDao.class);
	}
	@Test
	public void insertProductTest(){
		Product product = new Product();
		product.setKind(1);
		product.setName("娴嬭瘯001");
		product.setNorm("鍗фЫ浜�");
		product.setPeople("sadfas");
		product.setNum(30001);
		Admin admin = new Admin();
		admin.setId(100028);
		System.out.println(recordDao.findById(productService.insertProduct(product,admin,"娴嬭瘯鎿嶄綔")));
	}
}
