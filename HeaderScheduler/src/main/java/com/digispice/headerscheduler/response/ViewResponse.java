package com.digispice.headerscheduler.response;

import lombok.Data;

@Data
public class ViewResponse {
	private String loginId;
	private String serviceCode;
	private String header;
	private String startDate;
	private String endDate;
	private String type;
	public ViewResponse(String loginId, String serviceCode, String header, String startDate, String endDate, String type) {
		super();
		this.loginId = loginId;
		this.serviceCode = serviceCode;
		this.header = header;
		this.startDate = startDate;
		this.endDate = endDate;
		this.type = type;
	}	
}
