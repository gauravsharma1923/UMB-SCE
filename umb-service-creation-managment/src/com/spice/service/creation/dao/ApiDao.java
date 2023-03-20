package com.spice.service.creation.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spice.service.creation.request.PostApiList;
import com.spice.service.creation.request.PreferenceRequest;
import com.spice.service.creation.response.ApiListResponse;


@Transactional
@Repository
public class ApiDao {
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
	
	public List<ApiListResponse> getApiList(PostApiList postapilist) throws Exception {
		String sid=postapilist.getServiceId();
		String str="";
		String pro_str="";
		System.out.println("service id is "+sid);
		
		if (sid == null || sid.length() == 0 || sid.contains("null")) {
			System.out.println("Inside null or blank case ");
		 str = "select app_id, app_name, app_mtype, app_description, mandatory_params, optional_params, app_response, status, created_on, last_modified from tbl_application_master";
		    System.out.println("qiery is  "+str);
		}
		else
		{
			
			pro_str = proc_get_list(sid);
			if (pro_str.contains("PROD")) {
				System.out.println("Inside PROD  because we recived from procedure >  "+pro_str);
				str = "select app_id, app_name, app_mtype, app_description, mandatory_params, optional_params, app_response, status, created_on, last_modified from tbl_application_master WHERE is_uat= 0;";
				System.out.println("qiery is  "+str);
			}
			else {
				System.out.println("Inside else case or procedure retun  because we recived from procedure > "+pro_str);
				str = "select app_id, app_name, app_mtype, app_description, mandatory_params, optional_params, app_response, status, created_on, last_modified from tbl_application_master";
				System.out.println("qiery is  "+str);
			}
		}	
		return  jdbcTemplateObject.query(str,new Object[] {}, new ApiListResponse());
	}
	
	public String proc_get_list(String sid) throws Exception {
		String str = "{call proc_get_api_list(?,?)}";
		Connection conn = null;
		String retn="";
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			
			stmt.setString(1, sid);
			stmt.registerOutParameter(2, Types.VARCHAR);
			stmt.execute();
			retn= stmt.getString(2);
		} catch (SQLException e) {
			e.printStackTrace();
			retn= "Procedure ERROR";
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
				}
			}
		}
		return retn;
	}

}
