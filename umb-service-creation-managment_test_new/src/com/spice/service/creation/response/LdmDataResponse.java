package com.spice.service.creation.response;

import lombok.Data;

@Data
public class LdmDataResponse 
{
	String areaId;
	String categoryType;
	
	public LdmDataResponse(String areaId, String categoryType)
	{
		this.areaId = areaId;
		this.categoryType = categoryType;
	}
}
