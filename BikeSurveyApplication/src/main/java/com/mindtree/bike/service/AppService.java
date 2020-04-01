package com.mindtree.bike.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import com.mindtree.bike.model.Company;
import com.mindtree.bike.model.Customer;
import com.mindtree.bike.model.Models;

@Service
public interface AppService {

	void addCustomer(Customer customer);

	boolean validate(String email, String password);

	List<Company> getAllCountries();

	List<Models> getByCompany(int companyId);

	float getBikePrice(int modelId);

	Object buyABike(float quantities, Date confirmDate, float totalPrice, int modelId,String customerEmail);

	List<Customer> customerDetails();

	List<Customer> customerData(int customerId);

	List<Company> getAllCompanies();

	List<Customer> getModelData(int modelId);

	float getDataBy(int companyId);

	List<Models> getModels(int companyId);

	void exportToExcel();

}
