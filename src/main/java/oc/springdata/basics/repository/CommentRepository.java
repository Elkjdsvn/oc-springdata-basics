package oc.springdata.basics.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import oc.springdata.basics.model.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Integer> {

}
