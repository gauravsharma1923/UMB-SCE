package com.digispice.headerscheduler.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.digispice.headerscheduler.request.HeaderRequest;
import com.digispice.headerscheduler.response.ResponseObj;
import com.digispice.headerscheduler.service.HeaderSchedulerService;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RestController
@RequestMapping("/api/headerScheduler")
public class ApplicationController {
	@Autowired
	private HeaderSchedulerService headerschedulerservice;

	@RequestMapping(value = "/servicecode", method = RequestMethod.POST,consumes = "application/json")
	public ResponseObj serviceCode() throws Exception {
		return headerschedulerservice.serviceCode();
	}
	
	@RequestMapping(value = "/headers", method = RequestMethod.POST,consumes = "application/json")
	public ResponseObj headers() throws Exception {
		return headerschedulerservice.headers();
	}
	
	@RequestMapping(value = "/scheduleHeader", method = RequestMethod.POST,consumes = "application/json")
	public ResponseObj scheduleHeader(@RequestBody HeaderRequest headerRequest) throws Exception {
		return headerschedulerservice.scheduleHeader(headerRequest);
	}
	
	@RequestMapping(value = "/viewHeader", method = RequestMethod.GET)
	public ResponseObj viewHeader() throws Exception {
		return headerschedulerservice.viewHeader();
	}
	
	@RequestMapping(value = "/fileUpload" , method = RequestMethod.POST, consumes="multipart/form-data", produces="application/json")
	public ResponseObj fileUpload(MultipartFile file) throws Exception 
	{
		return headerschedulerservice.fileUpload(file, "1");
	}
}
