package com.spice.umb.service;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.spice.umb.aop.LoggingAspect;
import com.spice.umb.request.Fields;
import com.spice.umb.request.MasterPojo;
import com.spice.umb.request.ModifyUrlRequest;

@Component
public class Utility {
	private static final Logger LOGGER = LogManager.getLogger(LoggingAspect.class);
	public String createUrl(MasterPojo masterpojo) {
		System.out.println(masterpojo.toString());
		String str = "";
		
		if(masterpojo.getBaseUrl().contains("?")) {
			str = "&";		
		}else {
			String baseurl = masterpojo.getBaseUrl().toString().trim();
			String lastChr = baseurl.substring(baseurl.length()-1);
			if(lastChr.contains("/")) {
				str = "?";
			}else{
				str = "?";	
			}				
		}
				
		for(Fields f:masterpojo.getFields())
		{
			str =str+f.getFieldName()+"="+f.getFieldValue()+"&";
		}
		String url = ""+masterpojo.getBaseUrl()+""+str;
		
		LOGGER.info("Complete url created :"+url.substring(0, url.length() - 1));
		return url.substring(0, url.length() - 1);
	}
	
	public String modifyUrl(ModifyUrlRequest modifyurlreq) {
		System.out.println(modifyurlreq.toString());
		String str = "";
		
		if(modifyurlreq.getBaseUrl().contains("?")) {
			str = "&";
		}else {
			String baseurl = modifyurlreq.getBaseUrl().toString().trim();
			String lastChr = baseurl.substring(baseurl.length()-1);
			
			if(lastChr.contains("/")) {
				str = "?";
			}else{
				str = "?";	
			}
		}
			
		for(Fields f:modifyurlreq.getFields())
		{
			str =str+f.getFieldName()+"="+f.getFieldValue()+"&";
		}
		String url = ""+modifyurlreq.getBaseUrl()+""+str;
		
		LOGGER.info("Modified url:"+url);
		return url.substring(0, url.length() - 1);
	}
}
