package com.spice.service.creation.response;

import lombok.Data;

@Data
public class LdmResponse 
{
	String cgi;
	String salesAreaId;
	String salesAreaName;
	String zoneId;
	String zoneName;
	String lteFlag;
	
	public LdmResponse(String cgi, String salesAreaId, String salesAreaName, String zoneId, String zoneName, String lteFlag)
	{
		this.cgi = cgi;
		this.salesAreaId = salesAreaId;
		this.salesAreaName = salesAreaName;
		this.zoneId = zoneId;
		this.zoneName = zoneName;
		this.lteFlag = lteFlag;
	}
}
