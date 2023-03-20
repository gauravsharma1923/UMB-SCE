package com.spice.service.creation.response;

import java.util.List;

import lombok.Data;

@Data
public class UpdateNarrationResponse 
{
	List<String> serviceCode;
	List<String> reason;
	public UpdateNarrationResponse()
	{
	}
	public UpdateNarrationResponse(List<String> serviceCode, List<String> reason)
	{
		this.serviceCode = serviceCode;
		this.reason = reason;
	}
}
