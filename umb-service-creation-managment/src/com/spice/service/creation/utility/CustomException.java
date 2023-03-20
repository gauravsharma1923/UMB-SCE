package com.spice.service.creation.utility;

public class CustomException extends RuntimeException
{
	public Object object;
	public CustomException()
	{
	}
	public CustomException(Object object)
	{
		this.object = object;
	}
}
