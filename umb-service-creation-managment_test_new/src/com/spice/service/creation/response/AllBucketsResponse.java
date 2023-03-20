package com.spice.service.creation.response;

import lombok.Data;

@Data
public class AllBucketsResponse {
	private String bucket;
	
	public AllBucketsResponse(String bucket) {
		super();
		this.bucket = bucket;
	}
}
