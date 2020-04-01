package com.mindtree.bike.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Company {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int companyId;
	private String companyName;
	
	@JsonIgnoreProperties(value = "company")
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "company")
	private List<Models> models;

	public Company() {
	}

	public Company(int companyId, String companyName, List<Models> models) {
		super();
		this.companyId = companyId;
		this.companyName = companyName;
		this.models = models;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public List<Models> getModels() {
		return models;
	}

	public void setModels(List<Models> models) {
		this.models = models;
	}

	@Override
	public String toString() {
		return "Company [companyId=" + companyId + ", companyName=" + companyName + ", models=" + models + "]";
	}

}
