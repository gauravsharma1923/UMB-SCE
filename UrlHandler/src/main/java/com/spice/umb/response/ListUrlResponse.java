package com.spice.umb.response;

import lombok.Data;

@Data
public class ListUrlResponse {
	private String urlId;
	private String url;
	private String data;
	public ListUrlResponse(String urlId,String url,String data) {
		this.urlId=urlId;
		this.url=url;
		this.data=data;
	}
	public ListUrlResponse() {
		// TODO Auto-generated constructor stub
	}
}