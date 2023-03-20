package com.spice.service.creation.request;

import lombok.Data;

@Data
public class UpdateBucketRequest {
	private String bucketId;
	private String bucketName;
	private String serviceClasses;
	private String criteriaType;
}
