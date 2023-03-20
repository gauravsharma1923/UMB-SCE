package com.spice.service.creation.response;
import lombok.Data;

@Data
public class ViewBucketResponse {
	private String bucketId;
	private String bucketName;
	private String serviceClasses;
	public ViewBucketResponse(String bucketId, String bucketName, String serviceClass) {
		super();
		this.bucketId = bucketId;
		this.bucketName = bucketName;
		this.serviceClasses = serviceClass;
	}
	
}
