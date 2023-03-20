package com.spice.service.creation.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spice.service.creation.exception.GenericException;
import com.spice.service.creation.request.AllBucketsRequest;
import com.spice.service.creation.request.CreateBucketRequest;
import com.spice.service.creation.request.CreateRuleRequest;
import com.spice.service.creation.request.CriteriaTypeRequest;
import com.spice.service.creation.request.DeleteBucketRequest;
import com.spice.service.creation.request.DeleteRuleRequest;
import com.spice.service.creation.request.LdmDataRequest;
import com.spice.service.creation.request.LdmRequest;
import com.spice.service.creation.request.MainRulePreferenceRequest;
import com.spice.service.creation.request.PreferenceRequest;
import com.spice.service.creation.request.UpdateBucketRequest;
import com.spice.service.creation.request.UpdateMainRuleRequest;
import com.spice.service.creation.request.UpdateRuleRequest;
import com.spice.service.creation.request.ViewBucketRequest;
import com.spice.service.creation.request.ViewRulesRequest;
import com.spice.service.creation.response.AllBucketsResponse;
import com.spice.service.creation.response.LdmDataResponse;
import com.spice.service.creation.response.LdmResponse;
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.response.ViewBucketResponse;
import com.spice.service.creation.response.ViewBucketShortCodeResponse;
import com.spice.service.creation.response.ViewRulesResponse;




@Transactional
@Repository
public class BucketManagementDao {
	@Value("${jdbc.url}")
	private String jdbcUrl;
	
	@Value("${jdbc.username}")
	private String jdbcUserName;
	
	@Value("${jdbc.password}")
	private String jdbcPassword;
	
	private JdbcTemplate jdbcTemplateObject;
	
	private JdbcTemplate jdbcTemplateObject1;

	@Autowired
	@Qualifier("dataSource")
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}
	
	@Autowired
	@Qualifier("dataSource1")
	public void setDataSource1(DataSource ds) {
		this.jdbcTemplateObject1 = new JdbcTemplate(ds);
	}
	
	public List<LdmResponse> ldm(LdmRequest ldmRequest) throws Exception
	{
		String sql = "select CGI, area_id, area_name, zone_id, zone_name, lte_flag from tbl_cgi_salesArea where CGI = ?";
		return jdbcTemplateObject1.query(sql, new Object[]{ldmRequest.getCGI()},
				(rs, rowNum) -> new LdmResponse(rs.getString("CGI"), rs.getString("area_id"), rs.getString("area_name"), rs.getString("zone_id"), rs.getString("zone_name"), rs.getString("lte_flag")));
	}
	
	public List<LdmDataResponse> ldmData(LdmDataRequest ldmDataRequest) throws Exception
	{
		String sql = "select area_id, category_type from tbl_areaAttackType where area_id = ?";
		return jdbcTemplateObject1.query(sql, new Object[]{Integer.parseInt(ldmDataRequest.getAreaId())},
				(rs, rowNum) -> new LdmDataResponse(rs.getString("area_id"), rs.getString("category_type")));
	}
	
	public List<LdmDataResponse> fetchldmData(Integer offset, Integer limit) throws Exception
	{
		String sql = "select area_id, category_type from tbl_areaAttackType limit " + offset + "," + limit;
		return jdbcTemplateObject1.query(sql, new Object[] {}, 
				(rs, rowNum) -> new LdmDataResponse(rs.getString("area_id"), rs.getString("category_type")));
	}
	
	public List<String>  getShortCodes() throws Exception {
		String str = "SELECT DISTINCT service_code FROM tbl_service_nodes WHERE parent_service_id=0 order by service_code;";
		//System.out.println(jdbcTemplateObject.queryForList(str,String.class));	
		return jdbcTemplateObject.queryForList(str,String.class);
	}
	
	public List<String>  getMainRuleShortCodes() throws Exception {
		String str = "select distinct short_code service_code from tbl_main_rules_mapping order by short_code;";
		//System.out.println(jdbcTemplateObject.queryForList(str,String.class));	
		return jdbcTemplateObject.queryForList(str,String.class);
	}
	
	public int createBucket(CreateBucketRequest createBucketRequest, String userId) throws Exception {
		String sql = "INSERT INTO  tbl_service_class_mapping (bucket_name, short_code,service_class,criteria) VALUES(?,?,?,?) ";
		return jdbcTemplateObject.update(sql,createBucketRequest.getBucketName(),createBucketRequest.getShortCode(),createBucketRequest.getServiceClasses(),createBucketRequest.getCriteriaType());
		/*if (x > 0)
		{
			return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, ?, now())", userId, createBucketRequest.getCriteriaType());
		}
		else
			return 0;*/
	}
	
	public List<ViewBucketShortCodeResponse> viewBuckets(ViewBucketRequest viewBucketRequest) {
		String sql = "SELECT short_code FROM tbl_service_class_mapping where criteria = ? GROUP BY short_code";
		return jdbcTemplateObject.query(sql,new Object[]{viewBucketRequest.getCriteriaType()},
				(rs, rowNum) -> new ViewBucketShortCodeResponse(rs.getString("short_code")));
	}
	
	public List<ViewBucketResponse> viewBuckets2(ViewBucketRequest viewBucketRequest) {
		String sql = "SELECT bucket_id,bucket_name,service_class FROM tbl_service_class_mapping WHERE criteria = ? AND short_code = ? ORDER BY preference ASC;";
		return jdbcTemplateObject.query(sql,new Object[]{viewBucketRequest.getCriteriaType(),viewBucketRequest.getShortCode()},
				(rs, rowNum) -> new ViewBucketResponse(rs.getString("bucket_id"),rs.getString("bucket_name"),rs.getString("service_class")));
	}
	
	public CallableStatement updatePreferences(List<PreferenceRequest> prefernceRequest, String userId) throws Exception
	{
		CallableStatement preferenceResponse = null;
		Iterator<PreferenceRequest> itr = prefernceRequest.listIterator();
		while (itr.hasNext()) {
			PreferenceRequest preferenceReq = itr.next();
			preferenceResponse = updatePreference(preferenceReq, userId);
			if (!"success".equalsIgnoreCase(preferenceResponse.getString("OutStatus"))) {
				throw new GenericException(preferenceResponse.getString("OutStatus"), preferenceResponse.getString("OutDesc"),
						Integer.valueOf(preferenceResponse.getString("OutResponseCode")));
			}
		}
		//jdbcTemplateObject.update("call proc_trigger_add_pref(?, 0, 0, now(), ?)", userId, prefernceRequest.get(0).getBucketId());
		return preferenceResponse;
	}
	
	public CallableStatement updateMainRulePreferences(List<MainRulePreferenceRequest> prefernceRequest, String userId) throws Exception
	{
		CallableStatement preferenceResponse = null;
		Iterator<MainRulePreferenceRequest> itr = prefernceRequest.listIterator();
		while (itr.hasNext()) {
			MainRulePreferenceRequest preferenceReq = itr.next();
			preferenceResponse = updateMainRulePreference(preferenceReq, userId);
			if (!"success".equalsIgnoreCase(preferenceResponse.getString("OutStatus"))) {
				throw new GenericException(preferenceResponse.getString("OutStatus"), preferenceResponse.getString("OutDesc"),
						Integer.valueOf(preferenceResponse.getString("OutResponseCode")));
			}
		}
		//jdbcTemplateObject.update("call proc_trigger_add_pref_main(?, 0, 0, now(), 'mainRules')", userId);
		return preferenceResponse;
	}
	
	public CallableStatement updatePreference(PreferenceRequest prefernceRequest, String userId) throws Exception {
		String str = "{call proc_set_bucket_preference(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_bucket_id", prefernceRequest.getBucketId());
			stmt.setString("in_preference", prefernceRequest.getPreference());
			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();
			return stmt;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return null;
	}
	
	public CallableStatement updateMainRulePreference(MainRulePreferenceRequest prefernceRequest, String userId) throws Exception {
		String str = "{call proc_set_bucket_preference_main(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_main_rule_id", prefernceRequest.getMain_rule_id());
			stmt.setString("in_preference", prefernceRequest.getPreference());
			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();
			return stmt;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return null;
	}
	
	public int delete(DeleteBucketRequest delete, String userId) {
		try {
			String sql = "DELETE from tbl_service_class_mapping WHERE bucket_id=?";
			return jdbcTemplateObject.update(sql, delete.getBucketId());
		} catch (Exception ex) {
			return 0;
		}
	}
	
	public int updateBucket(UpdateBucketRequest updatebucket, String userId) throws Exception {
		System.out.println(updatebucket.toString());
		String sql = "UPDATE tbl_service_class_mapping SET bucket_name = ?, service_class = ? WHERE bucket_id = ? and criteria = ?";
		return jdbcTemplateObject.update(sql,updatebucket.getBucketName(),updatebucket.getServiceClasses(),updatebucket.getBucketId(),updatebucket.getCriteriaType());
		/*if (x > 0)
		{
			return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, ?, now())", userId, updatebucket.getCriteriaType());
		}
		else
			return 0;*/
	}
	
	/*********** creating rule engine apis ************/
	public List<String>  getBuckets() throws Exception {
		String str = "SELECT DISTINCT bucket_name FROM tbl_service_class_mapping;";	
		return jdbcTemplateObject.queryForList(str,String.class);
	}
	
	public List<String>  listDeploymentCriteriaType(CriteriaTypeRequest criteriaRequest) throws Exception {
		String str = "SELECT DISTINCT bucket_name FROM tbl_service_class_mapping WHERE criteria= ?";	
		return jdbcTemplateObject.queryForList(str,String.class,criteriaRequest.getCriteriaType());
	}
	
	public int updateRule(UpdateRuleRequest updaterule) throws Exception {
		System.out.println(updaterule.toString());
		String sql = "UPDATE tbl_service_class_mapping SET bucket_name = ?, service_class = ? WHERE bucket_id = ? and criteria = ?";
		return jdbcTemplateObject.update(sql,updaterule.getRuleId(),updaterule.getRuleName());
	}
	
	public List<ViewBucketShortCodeResponse> viewRules(ViewBucketRequest viewBucketRequest) {
		String sql = "SELECT short_code FROM tbl_service_class_mapping where criteria = ? GROUP BY short_code;";
		return jdbcTemplateObject.query(sql,new Object[]{viewBucketRequest.getCriteriaType()},
				(rs, rowNum) -> new ViewBucketShortCodeResponse(rs.getString("short_code")));
	}

	public List<ViewRulesResponse> viewMainRules(ViewRulesRequest req) {
		String sql = "select main_rule_id, main_rule,salesarea,category,balance,country,imei,profile,account_group,service_offering,vlr,offer_id,zone,lte_flag,lang,preference from tbl_main_rules_mapping where short_code = ? order by preference;";
		return jdbcTemplateObject.query(sql, new Object[] {req.getShortcode()},
				(rs, rowNum) -> new ViewRulesResponse(rs.getString("main_rule_id") ,rs.getString("main_rule"), rs.getString("salesarea"), rs.getString("category"), rs.getString("balance"), rs.getString("country"), rs.getString("imei"), rs.getString("profile"), rs.getString("account_group"), rs.getString("service_offering"), rs.getString("vlr"), rs.getString("offer_id"),rs.getString("zone"),rs.getString("lte_flag"),rs.getString("lang"),rs.getInt("preference")));
		}
	
	public int createMainRule(CreateRuleRequest createRuleRequest, String userId) throws Exception {
		String sql = "INSERT INTO tbl_main_rules_mapping (main_rule,salesarea,category,balance,country,imei,profile,account_group,service_offering,vlr,offer_id,zone,lte_flag,lang,short_code) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
		return jdbcTemplateObject.update(sql,createRuleRequest.getRuleName(),createRuleRequest.getSalesArea(),createRuleRequest.getCategory(),createRuleRequest.getBalance(),createRuleRequest.getCountry(),createRuleRequest.getImei(),createRuleRequest.getProfile(),createRuleRequest.getAccountGroup(),createRuleRequest.getServiceOffering(),createRuleRequest.getVlr(),createRuleRequest.getOfferId(),createRuleRequest.getZone(),createRuleRequest.getLteFlag(),createRuleRequest.getLang(),createRuleRequest.getShortcode());
		/*if (x > 0)
		{
			return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, 'mainRules', now())", userId);
		}
		else
			return 0;*/
	}
	
	public int deleteMainRule(DeleteRuleRequest deleteRuleRequest, String userId) throws Exception
	{
		String sql = "delete from tbl_main_rules_mapping where main_rule_id = ?";
		return jdbcTemplateObject.update(sql, deleteRuleRequest.getMain_rule_id());
		/*if (x > 0)
		{
			return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, 'mainRules', now())", userId);
		}
		else
			return 0;*/
	}
	
	public int updateMainRule(UpdateMainRuleRequest updateMainRuleRequest, String userId) throws Exception
	{
		String sql = "update tbl_main_rules_mapping set main_rule = ?, salesarea = ?, category = ?, balance = ?, country = ? "
				+ ",imei = ?, profile = ?, account_group = ?, service_offering = ?, vlr = ?, offer_id = ?, zone = ?, lte_flag = ?, lang = ? where main_rule_id = ?";
		return jdbcTemplateObject.update(sql, updateMainRuleRequest.getRuleName(), updateMainRuleRequest.getSalesArea(), 
				updateMainRuleRequest.getCategory(), updateMainRuleRequest.getBalance(), updateMainRuleRequest.getCountry(),
				updateMainRuleRequest.getImei(), updateMainRuleRequest.getProfile(), updateMainRuleRequest.getAccountGroup(),
				updateMainRuleRequest.getServiceOffering(), updateMainRuleRequest.getVlr(), updateMainRuleRequest.getOfferId(),
				updateMainRuleRequest.getZone(), updateMainRuleRequest.getLteFlag(), updateMainRuleRequest.getLang(), updateMainRuleRequest.getMain_rule_id());
		/*if (x > 0)
		{
			return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, 'mainRules', now())", userId);
		}
		else
			return 0;*/
	}
	
	public List<AllBucketsResponse> allBuckets(AllBucketsRequest allBucketsRequest) {
		//String sql = "select distinct bucket_name bucket_list from tbl_service_class_mapping where criteria = ?;";
		//return jdbcTemplateObject.query(sql, new Object[]{allBucketsRequest.getCriteria()},
		//		(rs, rowNum) -> new AllBucketsResponse(rs.getString("bucket_list")));
		String sql = "select distinct bucket_name bucket_list from tbl_service_class_mapping where criteria = ? and short_code = ?;";
		return jdbcTemplateObject.query(sql, new Object[]{allBucketsRequest.getCriteria(), allBucketsRequest.getShortcode()},
				(rs, rowNum) -> new AllBucketsResponse(rs.getString("bucket_list")));
	}
	
	public int deployRules(String userId)
	{
		return jdbcTemplateObject.update("call proc_trigger_add(?, 0, 0, 'mainRules', now())", userId);
	}
}
