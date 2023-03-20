package com.spice.service.creation.request;

import lombok.Data;

@Data
public class KeepAliveRequest {
	private String serviceId;
	private String userId;
}