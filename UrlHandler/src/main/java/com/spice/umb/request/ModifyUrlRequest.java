package com.spice.umb.request;

import lombok.Data;
import java.util.List;

@Data
public class ModifyUrlRequest {
	private String baseUrl;
	private String timeOut;
	List <Fields> fields;
}
