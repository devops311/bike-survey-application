package com.mindtree.bike.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.mindtree.bike.model.Models;
import com.mindtree.bike.service.AppService;

@RestController
@RequestMapping("/rest")
public class RestAppController {

	@Autowired
	AppService appService;

	@RequestMapping(value = "/modelByCompany/{companyId}", method = RequestMethod.GET)
	public List<Models> getModels(@PathVariable int companyId) {
		List<Models> result = appService.getByCompany(companyId);
		return result;
	}

	@RequestMapping(value = "/getBikePrice/{modelId}",method = RequestMethod.GET)
	public float getBikePrice(@PathVariable int modelId) {

		float result = appService.getBikePrice(modelId);
		return result;
	}

}
