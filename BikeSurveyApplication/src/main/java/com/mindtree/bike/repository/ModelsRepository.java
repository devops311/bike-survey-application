package com.mindtree.bike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mindtree.bike.model.Models;

@Repository
public interface ModelsRepository extends JpaRepository<Models, Integer> {

}
