package com.digispice.headerscheduler.request;

import lombok.Data;

@Data
public class HeaderRequest {
	private int loginId;
	private String serviceCode;
	private String header;
	private String startDate;
	private String endDate;
	private String type;
	
	public HeaderRequest()
	{
		this.loginId = 0;
		this.serviceCode = "";
		this.header = "";
		this.startDate = "";
		this.endDate = "";
		this.type = "";
	}
	
	public HeaderRequest(int loginId, String serviceCode, String header, String startDate, String endDate,
			String type)
	{
		this.loginId = loginId;
		this.serviceCode = serviceCode;
		this.header = header;
		this.startDate = startDate;
		this.endDate = endDate;
		this.type = type;
	}
}
