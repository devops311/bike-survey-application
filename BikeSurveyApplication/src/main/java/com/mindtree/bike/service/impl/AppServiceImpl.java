package com.mindtree.bike.service.impl;

import java.io.FileOutputStream;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.mindtree.bike.model.Company;
import com.mindtree.bike.model.Customer;
import com.mindtree.bike.model.Models;
import com.mindtree.bike.repository.CompanyRepository;
import com.mindtree.bike.repository.CustomerRepository;
import com.mindtree.bike.repository.ModelsRepository;
import com.mindtree.bike.service.AppService;

@Service
public class AppServiceImpl implements AppService {

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	CompanyRepository companyRepository;

	@Autowired
	ModelsRepository modelsRepository;

	@Override
	public void addCustomer(Customer customer) {

		customerRepository.save(customer);
	}

	@Override
	public boolean validate(String email, String password) {
		List<Customer> customer = customerRepository.findAll();
		for (Customer customer2 : customer) {
			if (customer2.getEmail().equalsIgnoreCase(email) && customer2.getPassword().equalsIgnoreCase(password)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List<Company> getAllCountries() {

		return companyRepository.findAll();
	}

	@Override
	public List<Models> getByCompany(int companyId) {

		List<Company> companie = companyRepository.findAll();
		List<Models> model = new ArrayList<Models>();
		for (Company company : companie) {
			if (company.getCompanyId() == companyId) {
				for (Models models : company.getModels()) {
					model.add(models);
				}
			}
		}

		return model;
	}

	@Override
	public float getBikePrice(int modelId) {

		Models model = modelsRepository.findById(modelId).get();
		return model.getModelPrice();
	}

	@Override
	public String buyABike(float quantities, Date confirmDate, float totalPrice, int modelId, String customerEmail) {

		Customer customer = customerRepository.findByEmail(customerEmail);
		Models model = modelsRepository.findById(modelId).get();

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date orderDate = new java.sql.Date(utilDate.getTime());

		java.sql.Date deliveryDate = confirmDate;
		java.util.Date deliveryDateUtil = new java.util.Date(deliveryDate.getTime());

		LocalDate startDate = utilDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate endDate = deliveryDateUtil.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		Period period = Period.between(startDate, endDate);

		customer.setQuantities(quantities);
		customer.setOrderDate(orderDate);
		customer.setConfirmDate(deliveryDate);
		customer.setTotalPrice(totalPrice);
		customer.setModels(model);
		customer.setNoOfDays(period.getDays());
		customerRepository.save(customer);
		return "Ordered Placed Successfully";
	}

	@Override
	public List<Customer> customerDetails() {

		return customerRepository.findAll();
	}

	@Override
	public List<Customer> customerData(int customerId) {

		List<Customer> customers = new ArrayList<Customer>();
		Customer customer = customerRepository.findById(customerId).get();
		customers.add(customer);
		return customers;
	}

	@Override
	public List<Company> getAllCompanies() {

		return companyRepository.findAll();
	}

	@Override
	public List<Customer> getModelData(int modelId) {

		Models model = modelsRepository.findById(modelId).get();
		return model.getCustomer();
	}

	@Override
	public float getDataBy(int companyId) {

		float revenue = 0;
		Company company = companyRepository.findById(companyId).get();
		for (Models model : company.getModels()) {
			for (Customer customer : model.getCustomer()) {
				revenue += customer.getTotalPrice();
			}
		}
		return revenue;
	}

	@Override
	public List<Models> getModels(int companyId) {
		Company company = companyRepository.findById(companyId).get();
		return company.getModels();
	}

	@Override
	public void exportToExcel() {

		List<Customer> customers = customerRepository.findAll();
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Customer Data");
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("Customer Name");
		headerRow.createCell(1).setCellValue("Price");
		headerRow.createCell(2).setCellValue("Quantity");
		headerRow.createCell(3).setCellValue("Number Of Days");
		headerRow.createCell(4).setCellValue("Model Name");

		int rowNum = 1;
		for (Customer customerList : customers) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(customerList.getCustomerName());
			row.createCell(1).setCellValue(customerList.getTotalPrice());
			row.createCell(2).setCellValue(customerList.getQuantities());
			row.createCell(3).setCellValue(customerList.getNoOfDays());
			row.createCell(4).setCellValue(customerList.getModels().getModelName());
		}
		FileOutputStream fileOut;
		try {
			fileOut = new FileOutputStream("C:\\Users\\M1055983\\Desktop\\BikeSurvey.xls");
			workbook.write(fileOut);
			fileOut.close();
			workbook.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
