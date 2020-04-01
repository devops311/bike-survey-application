package com.mindtree.bike.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Customer {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int customerId;
	private String customerName;
	private String hobbies;
	private String gender;
	private String email;
	private long phoneNumber;
	private String password;
	private float quantities;
	private Date orderDate;
	private Date confirmDate;
	private float totalPrice;
	private int noOfDays;

	@JsonIgnoreProperties(value = "customer")
	@ManyToOne(cascade = CascadeType.ALL)
	private Models models;

	public Customer() {
	}

	public Customer(int customerId, String customerName, String hobbies, String gender, String email, long phoneNumber,
			String password, float quantities, Date orderDate, Date confirmDate, float totalPrice, int noOfDays,
			Models models) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.hobbies = hobbies;
		this.gender = gender;
		this.email = email;
		this.phoneNumber = phoneNumber;
		this.password = password;
		this.quantities = quantities;
		this.orderDate = orderDate;
		this.confirmDate = confirmDate;
		this.totalPrice = totalPrice;
		this.noOfDays = noOfDays;
		this.models = models;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getHobbies() {
		return hobbies;
	}

	public void setHobbies(String hobbies) {
		this.hobbies = hobbies;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public long getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(long phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public float getQuantities() {
		return quantities;
	}

	public void setQuantities(float quantities) {
		this.quantities = quantities;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getConfirmDate() {
		return confirmDate;
	}

	public void setConfirmDate(Date confirmDate) {
		this.confirmDate = confirmDate;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getNoOfDays() {
		return noOfDays;
	}

	public void setNoOfDays(int noOfDays) {
		this.noOfDays = noOfDays;
	}

	public Models getModels() {
		return models;
	}

	public void setModels(Models models) {
		this.models = models;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", hobbies=" + hobbies
				+ ", gender=" + gender + ", email=" + email + ", phoneNumber=" + phoneNumber + ", password=" + password
				+ ", quantities=" + quantities + ", orderDate=" + orderDate + ", confirmDate=" + confirmDate
				+ ", totalPrice=" + totalPrice + ", noOfDays=" + noOfDays + ", models=" + models + "]";
	}

}
