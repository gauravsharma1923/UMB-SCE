package com.spice.umb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.spice.umb.dao.UrlHandlerDao;
import com.spice.umb.exception.GenericException;
import com.spice.umb.request.CreateUrlRequest;
import com.spice.umb.request.MasterPojo;
import com.spice.umb.request.ModifyUrlRequest;
import com.spice.umb.response.ResponseObj;
import com.spice.umb.response.ListUrlResponse;

@Component
@Service
public class UrlHandlerService {
	@Autowired
	private UrlHandlerDao urlhandlerdao;
	@Autowired
	private Utility utility;

	public ResponseObj createUrl(MasterPojo masterpojo) throws Exception  {
		String url = utility.createUrl(masterpojo);
		
		return urlhandlerdao.createUrl(url,masterpojo);
	}

	public ResponseObj modifyUrl(ModifyUrlRequest modifyurlreq, String urlId) throws Exception {
		String url = utility.modifyUrl(modifyurlreq);
		
		return urlhandlerdao.modifyUrl(url,modifyurlreq,urlId);
	}

	public ResponseObj deleteUrl(int urlId) throws Exception {
		int obj = urlhandlerdao.deleteUrl(urlId);
		if (obj != 1) {
			throw new GenericException("Failed", "Failed", 0);
		}

		return new ResponseObj(obj);
	}

	public ResponseObj listUrl() throws Exception {
		List<ListUrlResponse> listurlresponse = urlhandlerdao.listUrl();
		
		//System.out.println("-->"+listurlresponse.toString());
		if (listurlresponse.isEmpty()) {
			return new ResponseObj(null, "Failed", "No data found in db", 0);
		}
		return new ResponseObj(listurlresponse);
	}

}
