package net.ecomm.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import net.ecomm.shoppingbackend.dao.CategoryDAO;
import net.ecomm.shoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;

	@BeforeClass 
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("net.ecomm.shoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
	}

	/*@Test
	public void testAddCategory() {
		category = new Category();

		category.setName("Television");
		category.setDescription("This is some description for Television!");
		category.setImageURL("CAT_1.png");

		assertEquals("Successfully added a category inside the table !!!", true, categoryDAO.add(category));
	}*/

	/*@Test
	public void testGetCategory() {
		category = categoryDAO.get(1);
		assertEquals("Successfully fetched a single category from the table !", "Television", category.getName());
	}*/

	/*@Test
	public void testUpdateCategory() {
		category = categoryDAO.get(3);
		category.setActive(true);
		assertEquals("Successfully updated a single category in the table !", true, categoryDAO.update(category));
	}*/

	/*@Test
	public void testDeleteCategory() {
		category = categoryDAO.get(1);
		assertEquals("Successfully Deleted a single category in the table !", true, categoryDAO.delete(category));
	}*/

	/*@Test
	public void testListCategory() {
		assertEquals("Successfully fetched the list of categories from the table !",1, categoryDAO.list().size());
	}*/

	@Test
	public void testCRUDCategory() {
		
		category = new Category();

		category.setName("TV");
		category.setDescription("This is some description for TV!");
		category.setImageURL("CAT_1.png");
		
		assertEquals("Successfully added a category inside the table !!!", true, categoryDAO.add(category));

		category = new Category();

		category.setName("Laptop");
		category.setDescription("This is some description for Laptop!");
		category.setImageURL("CAT_2.png");
		
		assertEquals("Successfully added a category inside the table !!!", true, categoryDAO.add(category));
		
		category = new Category();
		
		category.setName("Mobile");
		category.setDescription("This is some description for Mobile!");
		category.setImageURL("CAT_3.png");
		
		assertEquals("Successfully added a category inside the table !!!", true, categoryDAO.add(category));
	
		category = categoryDAO.get(1);
		category.setName("Television");
		assertEquals("Successfully updated a single category in the table !", true, categoryDAO.update(category));
		
		category = categoryDAO.get(3);
		assertEquals("Successfully Deleted a single category in the table !", true, categoryDAO.delete(category));
		
		assertEquals("Successfully fetched the list of categories from the table !",2, categoryDAO.list().size());
	}

}
