package com.spice.service.creation.request;

import lombok.Data;

@Data
public class UpdateMainRuleRequest {
	private int main_rule_id;
	private String ruleName;
	private String salesArea;
	private String category;
	private String balance;
	private String country;
	private String imei;
	private String profile;
	private String accountGroup;
	private String serviceOffering;
	private String vlr;
	private String offerId;
	private String zone;
	private String lteFlag;
	private String lang;
}
