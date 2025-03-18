package oc.springdata.basics.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import oc.springdata.basics.model.Product;

@Repository
public interface ProductRepository extends CrudRepository<Product, Integer> {

}