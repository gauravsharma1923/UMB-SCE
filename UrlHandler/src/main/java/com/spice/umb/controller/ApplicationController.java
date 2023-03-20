package com.spice.umb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spice.umb.request.CreateUrlRequest;
import com.spice.umb.request.MasterPojo;
import com.spice.umb.request.ModifyUrlRequest;
import com.spice.umb.response.ResponseObj;
import com.spice.umb.service.UrlHandlerService;

@RestController
@RequestMapping("/api/urlHandler")
public class ApplicationController {
	@Autowired
	private UrlHandlerService urlhandlerservice;

	@RequestMapping(value = "/createurl", method = RequestMethod.POST,consumes = "application/json")
	public ResponseObj createUrl(@RequestBody MasterPojo masterpojo) throws Exception {
		return urlhandlerservice.createUrl(masterpojo);
	}

	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ResponseObj modifyUrl(@RequestBody ModifyUrlRequest modifyurlreq,@RequestParam String urlId, HttpServletRequest request)
			throws Exception {
		
		return urlhandlerservice.modifyUrl(modifyurlreq,urlId);
	}

	@RequestMapping(value = "/delete/{urlId}", method = RequestMethod.DELETE)
	public ResponseObj deleteUrl(@PathVariable("urlId") int urlId) throws Exception {
		System.out.println("******delete*******");
		return urlhandlerservice.deleteUrl(urlId);
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ResponseObj listUrl() throws Exception {
		return urlhandlerservice.listUrl();
	}

	private String getBody(HttpServletRequest request) {
		// TODO Auto-generated method stub
		return null;
	}

}
