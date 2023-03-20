package com.spice.service.creation.response;

import lombok.Data;

@Data
public class ListNarrationResponse 
{
	Integer serviceId;
	String serviceCode;
	String responseText;
	Integer nodeId;
	public ListNarrationResponse()
	{
	}	
	public ListNarrationResponse(Integer serviceId, String serviceCode, String responseText, Integer nodeId)
	{
		this.serviceId = serviceId;
		this.serviceCode = serviceCode;
		this.responseText = responseText;
		this.nodeId = nodeId;
	}
}
