package com.spice.umb.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

import com.google.gson.Gson;
import com.spice.umb.aop.LoggingAspect;
import com.spice.umb.exception.GenericException;
import com.spice.umb.request.CreateUrlRequest;
import com.spice.umb.request.MasterPojo;
import com.spice.umb.request.ModifyUrlRequest;
import com.spice.umb.response.ListUrlResponse;
import com.spice.umb.response.ResponseObj;

@Repository
@PropertySource("classpath:application.properties")
public class UrlHandlerDao {
	private static final Logger LOGGER = LogManager.getLogger(UrlHandlerDao.class);
	
	@Value("${spring.datasource.url}")
	private String jdbcUrl;

	@Value("${spring.datasource.username}")
	private String jdbcUserName;

	@Value("${spring.datasource.password}")
	private String jdbcPassword;

	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}


	@Transactional
	public ResponseObj createUrl(String url,MasterPojo masterpojo) throws Exception{
		Gson gson =new Gson();
		String str = gson.toJson(masterpojo);
		//System.out.println("-->"+str);
		
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplateObject).withProcedureName("proc_insert_urlhandler");
		Map<String, Object> inParamMap = new HashMap<String, Object>();
		inParamMap.put("url", url);
		inParamMap.put("original_data", str);		
		inParamMap.put("timeout", masterpojo.getTimeOut());	
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		LOGGER.info("Return from database:"+simpleJdbcCallResult);
		
		Object rowcount = simpleJdbcCallResult.get("rowcount");
		
		LOGGER.info("Return result from database :"+rowcount.toString().trim());
		
		if (rowcount.toString().equals("0")) {
			throw new GenericException("Failed", "Failed", 0);
		}
		return new ResponseObj(rowcount);	
	}

	@Transactional
	public ResponseObj modifyUrl(String url,ModifyUrlRequest modifyurlreq,String urlId)throws Exception{
		Gson gson =new Gson();
		String str = gson.toJson(modifyurlreq);
		//System.out.println("-->"+str);
		
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplateObject).withProcedureName("proc_modify_urlhandler");
		Map<String, Object> inParamMap = new HashMap<String, Object>();
		inParamMap.put("url", url);
		inParamMap.put("original_data", str);		
		inParamMap.put("urlId", urlId);	
		inParamMap.put("timeout", modifyurlreq.getTimeOut());	
		SqlParameterSource in = new MapSqlParameterSource(inParamMap);
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		LOGGER.info("Return from database:"+simpleJdbcCallResult);
		
		Object rowcount = simpleJdbcCallResult.get("rowcount");
		
		LOGGER.info("Return result from database :"+rowcount.toString().trim());
		
		if (rowcount.toString().equals("0")) {
			throw new GenericException("Failed", "Failed", 0);
		}
		return new ResponseObj(rowcount);	
		
	}

	@Transactional
	public int deleteUrl(int urlId) {

		LOGGER.info("Delete this urlId=>" + urlId);
		try {
			String sql = "DELETE from tbl_url_mapping WHERE url_id=?";
			return jdbcTemplateObject.update(sql, urlId);
		} catch (Exception ex) {
			return 0;
		}
	}
	
	public List<ListUrlResponse> listUrl() {
		String sql = "SELECT * FROM tbl_url_mapping";
		return jdbcTemplateObject.query(sql,
				(rs, rowNum) -> new ListUrlResponse(rs.getString("url_id"),rs.getString("url"),rs.getString("original_data")));
	}

}
