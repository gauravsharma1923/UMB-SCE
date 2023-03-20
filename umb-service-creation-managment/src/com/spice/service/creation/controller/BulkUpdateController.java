package com.spice.service.creation.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.spice.service.creation.request.DeployNarrationRequest;
import com.spice.service.creation.request.ListNarrationRequest;
import com.spice.service.creation.request.UpdateNarrationRequest;
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.service.BulkUpdateService;

@RestController
@RequestMapping(value = "/bulkupdate")
public class BulkUpdateController 
{
	@Autowired
	private BulkUpdateService bulkUpdateService;
	
	@RequestMapping(value = "/listNarration", method = RequestMethod.POST)
	public ResponseObj listNarration(@Valid @RequestBody ListNarrationRequest req, @RequestHeader(value="userId") String userId)
	{
		return bulkUpdateService.listNarration(req);
	}
	
	@RequestMapping(value = "/updateNarration", method = RequestMethod.POST)
	public ResponseObj updateNarration(@Valid @RequestBody UpdateNarrationRequest req, @RequestHeader(value="userId") String userId)
	{
		return bulkUpdateService.updateNarration(req, userId);
	}
	
	@RequestMapping(value = "/deployNarration", method = RequestMethod.POST)
	public ResponseObj deployNarration(@Valid @RequestBody DeployNarrationRequest req, @RequestHeader(value="userId") String userId) throws Exception
	{
		return bulkUpdateService.deployNarration(req, userId);
	}

}
