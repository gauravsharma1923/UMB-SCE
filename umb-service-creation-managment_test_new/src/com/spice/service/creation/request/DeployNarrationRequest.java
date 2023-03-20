package com.spice.service.creation.request;

import java.util.List;

import lombok.Data;

@Data
public class DeployNarrationRequest 
{
	List<Integer> serviceId;
	String deploymentDate;
}
