package oc.springdata.basics.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import oc.springdata.basics.model.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category, Integer> {

}
