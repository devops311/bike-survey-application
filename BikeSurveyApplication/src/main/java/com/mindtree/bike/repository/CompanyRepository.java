package com.mindtree.bike.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mindtree.bike.model.Company;

@Repository
public interface CompanyRepository extends JpaRepository<Company, Integer>{

}
