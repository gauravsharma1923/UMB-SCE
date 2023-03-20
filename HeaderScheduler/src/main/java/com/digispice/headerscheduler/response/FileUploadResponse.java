package com.digispice.headerscheduler.response;

import lombok.Data;

@Data
public class FileUploadResponse 
{
	String Type;
	String MainServiceCode;
	String Replacement;
	String StartDateTime;
	String EndDateTime;
	String Response;
	
	public FileUploadResponse(String Type, String MainServiceCode, String Replacement, String StartDateTime,
			String EndDateTime, String Response)
	{
		this.Type = Type;
		this.MainServiceCode = MainServiceCode;
		this.Replacement = Replacement;
		this.StartDateTime = StartDateTime;
		this.EndDateTime = EndDateTime;
		this.Response = Response;
	}
}
