package net.ecomm.shoppingbackend.dao;

import java.util.List;

import net.ecomm.shoppingbackend.dto.Category;

public interface CategoryDAO {
	
	List<Category> list();
	Category get(int id);

}
