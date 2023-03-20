package com.spice.umb.request;

import java.util.List;

import lombok.Data;

@Data
public class MasterPojo {
	String baseUrl;	
	String timeOut;
	List<Fields> fields;	
}
