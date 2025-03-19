package oc.springdata.basics.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oc.springdata.basics.model.ProductCategory;
import oc.springdata.basics.repository.ProductCategoryRepository;

@Service
public class ProductCategoryService {

    @Autowired
    private ProductCategoryRepository productCategoryRepository;

    public Iterable<ProductCategory> getProductCategories() {
        return productCategoryRepository.findAll();
    }

    public Optional<ProductCategory> getProductCategoryById(final int id) {
        return productCategoryRepository.findById(id);
    }

}
