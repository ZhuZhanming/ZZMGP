package com.xaut.zzmgp.service;

import java.util.List;

import com.xaut.zzmgp.entity.Admin;
import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.entity.WhereOfProduct;

public interface ProductService {
	Object[] loadProducts(WhereOfProduct where);
	
	List<Product> loadAllProducts();

	Integer insertProduct(Product product, Admin admin,String oname);

	Integer addProduct(Product product, Admin admin,String oname);

	Integer subProduct(Integer id,String oname,Integer num,Admin admin);

	Product findById(Integer id);
}
