package com.spice.umb.request;

import lombok.Data;

@Data
public class CreateUrlRequest {
	private String 	baseUrl;
	private String  opCode;
	private int  delieverMode;
	private String 	dateTime;
	private int	subGroup;
	private String	smsType;
	private String	shortNo;
	private int	seqNo;
	private String	msisdn;
	private String	imsi;
	private String	hlr;
	private String	serviceCode;
	private String	imei;
	private String	cellId;
	private String	originalShortCode;
	private String	messageId;
}
