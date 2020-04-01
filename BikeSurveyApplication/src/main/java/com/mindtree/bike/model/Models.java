package com.mindtree.bike.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Models {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int modelId;
	private String modelName;
	private float modelPrice;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "models")
	private List<Customer> customer;

	@JsonIgnoreProperties(value = "models")
	@ManyToOne(cascade = CascadeType.ALL)
	private Company company;

	public Models() {
	}

	public Models(int modelId, String modelName, float modelPrice, List<Customer> customer, Company company) {
		super();
		this.modelId = modelId;
		this.modelName = modelName;
		this.modelPrice = modelPrice;
		this.customer = customer;
		this.company = company;
	}

	public int getModelId() {
		return modelId;
	}

	public void setModelId(int modelId) {
		this.modelId = modelId;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName;
	}

	public float getModelPrice() {
		return modelPrice;
	}

	public void setModelPrice(float modelPrice) {
		this.modelPrice = modelPrice;
	}

	public List<Customer> getCustomer() {
		return customer;
	}

	public void setCustomer(List<Customer> customer) {
		this.customer = customer;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public String toString() {
		return "Models [modelId=" + modelId + ", modelName=" + modelName + ", modelPrice=" + modelPrice + ", customer="
				+ customer + ", company=" + company + "]";
	}

}
