package com.mindtree.bike.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mindtree.bike.model.Company;
import com.mindtree.bike.model.Customer;
import com.mindtree.bike.model.Models;
import com.mindtree.bike.service.AppService;

@Controller
public class AppController {

	@Autowired
	AppService appService;

	static String customerEmail = null;

	@RequestMapping("/")
	public String index() {
		return "loginPage";
	}

	@RequestMapping("/form")
	public String form() {
		return "loginPage";
	}

	@RequestMapping("/validate")
	public String validate(String email, String password) {
		boolean isPresent = appService.validate(email, password);
		if (isPresent == true) {
			customerEmail = email;
			 //return "add";
			return "parallaxAdd";
		}
		return "loginPage";
	}

	@RequestMapping("/form1")
	public String register() {
		return "register";
	}

	@PostMapping("/customer")
	public String addCustomer(@ModelAttribute Customer customer) {

		appService.addCustomer(customer);
		return "register";
	}

	@RequestMapping("/form2")
	public String form2(Model model) {
		List<Company> company = appService.getAllCountries();
		model.addAttribute("company", company);
		return "buyVehicle";
	}

	@RequestMapping("/buyABike")
	public String buyABike(Model model, float quantities, Date confirmDate, float totalPrice, int modelId) {
		model.addAttribute("message", appService.buyABike(quantities, confirmDate, totalPrice, modelId, customerEmail));
		return "buyVehicle";
	}

	@RequestMapping("/customerDetails")
	public String customerDetails(Model model) {

		List<Customer> customer = appService.customerDetails();
		model.addAttribute("customer", customer);
		return "customerData";
	}

	@RequestMapping("/getAllData")
	public String customerDate(@RequestParam int customerId, Model model) {
		List<Customer> customerList = appService.customerData(customerId);
		model.addAttribute("customerList", customerList);
		return "customerData";
	}

	@GetMapping("/modelData")
	public String getModelData(Model model) {
		List<Company> company = appService.getAllCompanies();
		model.addAttribute("company", company);
		return "modelData";
	}

	@GetMapping("/getModelData")
	public String getModelData(int modelId, Model model) {

		List<Customer> customer = appService.getModelData(modelId);
		model.addAttribute("customer", customer);
		return "modelData";
	}

	@GetMapping("/getCompanyData")
	public String getCompanyData(Model model) {

		List<Company> company = appService.getAllCompanies();
		model.addAttribute("company", company);
		return "surveyData";
	}

	@GetMapping("/getTheDataBy")
	public String getTheData(int companyId, Model model) {

		float customer = appService.getDataBy(companyId);
		model.addAttribute("customer", customer);
		List<Models> models = appService.getModels(companyId);
		model.addAttribute("models", models);
		return "surveyData";
	}

	@GetMapping("/excel")
	public void exportToExcel() {
		appService.exportToExcel();
	}

	
}
