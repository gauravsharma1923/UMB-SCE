package com.spice.service.creation.request;

import java.util.List;

import lombok.Data;

@Data
public class UpdateNarrationRequest 
{
	List<Integer> serviceId;
	List<String> serviceCode;
	List<Integer> nodeId;
	String narration;
}
