package com.spice.service.creation.request;

import lombok.Data;

@Data
public class CreateBucketRequest {
	private String bucketName;
	private String shortCode;
	private String serviceClasses;
	private String criteriaType;
}
