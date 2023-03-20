package com.spice.service.creation.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spice.service.creation.dao.BulkUpdateDao;
import com.spice.service.creation.request.DeployNarrationRequest;
import com.spice.service.creation.request.ListNarrationRequest;
import com.spice.service.creation.request.UpdateNarrationRequest;
import com.spice.service.creation.response.ListNarrationResponse;
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.response.UpdateNarrationResponse;
import com.spice.service.creation.utility.CustomException;

@Service
public class BulkUpdateService 
{
	@Autowired
	BulkUpdateDao bulkUpdateDao;
	
	public ResponseObj listNarration(ListNarrationRequest req)
	{
		List<ListNarrationResponse> l = bulkUpdateDao.listNarration(req);
		return new ResponseObj(l);
	}
	
	public ResponseObj updateNarration(UpdateNarrationRequest req, String userId)
	{
		UpdateNarrationResponse resp;
		resp = bulkUpdateDao.updateNarration(req, userId); 
		return new ResponseObj(resp);
	}
	
	public ResponseObj deployNarration(DeployNarrationRequest req, String userId) throws Exception
	{
		int res = bulkUpdateDao.deployNarration(req, userId);
		return new ResponseObj(res);
	}
}
