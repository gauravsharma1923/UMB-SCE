package com.spice.service.creation.request;

import lombok.Data;

@Data
public class VariableApiMappingResponse {
	int appId;
	int variableId;
	public VariableApiMappingResponse(int appId, int variableId)
	{
		this.appId = appId;
		this.variableId = variableId;
	}
}
