package oc.springdata.basics;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import oc.springdata.basics.model.Comment;
import oc.springdata.basics.model.Product;
import oc.springdata.basics.model.ProductCategory;
import oc.springdata.basics.service.CommentService;
import oc.springdata.basics.service.ProductCategoryService;
import oc.springdata.basics.service.ProductService;

@SpringBootApplication
public class BasicsApplication implements CommandLineRunner {

	@Autowired
	private ProductService productService;

	@Autowired
	private CommentService commentService;

	@Autowired
	private ProductCategoryService productCategoryService;

	public static void main(String[] args) {
		SpringApplication.run(BasicsApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		Iterable<Product> products = productService.getProducts();
		products.forEach(System.out::println);

		Iterable<Comment> comments = commentService.getComments();
		comments.forEach(System.out::println);

		Iterable<ProductCategory> productCategories = productCategoryService.getProductCategories();
		productCategories.forEach(System.out::println);
	}
}
