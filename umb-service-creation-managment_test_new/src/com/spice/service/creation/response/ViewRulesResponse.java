package com.spice.service.creation.response;

import lombok.Data;

@Data
public class ViewRulesResponse {
	private String main_rule_id;
	private String main_rule;
	private String salesarea;
	private String category;
	private String balance;
	private String country;
	private String imei;
	private String profile;
	private String account_group;
	private String service_offering;
	private String vlr;
	private String offer_id;
	private String zone;
	private String lteFlag;
	private String lang;
	private Integer preference;
	
	public ViewRulesResponse(String main_rule_id, String main_rule, String salesarea, String category, String balance, String country, String imei, String profile, String account_group, String service_offering, String vlr, String offer_id, String zone, String lteFlag, String lang, Integer preference) {
		super();
		this.main_rule_id = main_rule_id;
		this.main_rule = main_rule;
		this.salesarea = salesarea;
		this.category = category;
		this.balance = balance;
		this.country = country;
		this.imei = imei;
		this.profile = profile;
		this.account_group = account_group;
		this.service_offering = service_offering;
		this.vlr = vlr;
		this.offer_id = offer_id;
		this.zone = zone;
		this.lteFlag = lteFlag;
		this.lang = lang;
		this.preference = preference;
	}
}