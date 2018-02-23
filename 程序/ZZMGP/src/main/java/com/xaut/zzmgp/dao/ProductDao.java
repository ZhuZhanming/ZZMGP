package com.xaut.zzmgp.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xaut.zzmgp.entity.Product;
import com.xaut.zzmgp.entity.WhereOfProduct;

@Repository("productDao")
public interface ProductDao {

	Product findById(Integer id);
	
	List<Product> findProducts(WhereOfProduct where);
	
	List<Product> findAllProducts();

	int findRows(WhereOfProduct where);

	void saveProduct(Product product);

}
