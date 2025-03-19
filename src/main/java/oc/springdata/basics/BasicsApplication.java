package oc.springdata.basics;

import jakarta.transaction.Transactional;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import oc.springdata.basics.model.Category;
import oc.springdata.basics.service.CategoryService;

@SpringBootApplication
public class BasicsApplication implements CommandLineRunner {

	@Autowired
	private CategoryService categoryService;

	public static void main(String[] args) {
		SpringApplication.run(BasicsApplication.class, args);
	}

	@Override
	@Transactional
	public void run(String... args) throws Exception {

		Optional<Category> optCategory = categoryService.getCategoryById(1);
		Category categoryId1 = optCategory.get();

		System.out.println(categoryId1);

		categoryId1.getProducts().forEach(
				product -> System.out.println(product.getName()));
	}
}