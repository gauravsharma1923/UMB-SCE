package com.spice.service.creation.response;

import lombok.Data;

@Data
public class ViewBucketShortCodeResponse {
	private String shortCode;

	public ViewBucketShortCodeResponse(String shortCode) {
		super();
		this.shortCode = shortCode;
	}
}
