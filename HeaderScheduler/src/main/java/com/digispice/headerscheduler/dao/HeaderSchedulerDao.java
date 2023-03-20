package com.digispice.headerscheduler.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.digispice.headerscheduler.request.HeaderRequest;
import com.digispice.headerscheduler.response.ViewResponse;


@Transactional
@Repository
public class HeaderSchedulerDao {
	private static final Logger LOGGER = LogManager.getLogger(HeaderSchedulerDao.class);
	
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
	
	public List<String> serviceCode() throws Exception{
		String str = "SELECT DISTINCT service_code FROM tbl_service_nodes WHERE parent_service_id=0 ORDER BY service_code asc;";
		return jdbcTemplateObject.queryForList(str,String.class);
	}
	
	public List<String> headers() throws Exception{
		String str = "SELECT DISTINCT service_code FROM tbl_service_nodes WHERE parent_service_id=0 ORDER BY service_code asc;";
		return jdbcTemplateObject.queryForList(str,String.class);
	}
	
	public int checkCompatibility(HeaderRequest headerRequest)throws Exception {
		String str = "{call proc_check_compatibility(?,?,?,?)}";
		LOGGER.info(this.getClass().getName()+"->call proc_check_compatibility("+headerRequest.getServiceCode()+","+headerRequest.getHeader()+",@a,@b)");
		Connection conn = null;
		int checkCompatibility = 0;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_service_code",headerRequest.getServiceCode());
			stmt.setString("in_header_code",headerRequest.getHeader());
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();	
			LOGGER.info(this.getClass().getName()+"->Response from proc_check_compatibility->"+stmt.getString("OutResponseCode")+","+stmt.getString("OutDesc"));
			checkCompatibility= stmt.getInt("OutResponseCode");
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
		return checkCompatibility;
	}
	public int scheduleHeader(HeaderRequest headerRequest) throws Exception {
		LOGGER.info(this.getClass().getName()+"->INSERT INTO tbl_header_scheduler (ServiceCode, HeaderServiceCode ,StartDateTime,EndDateTime,creatorId) VALUES ("+headerRequest.toString()+")");
		String sql = "INSERT INTO tbl_header_scheduler (ServiceCode, HeaderServiceCode ,StartDateTime,EndDateTime,creatorId,HeaderType) VALUES (?,?,?,?,?,?);";
		return jdbcTemplateObject.update(sql,headerRequest.getServiceCode(),headerRequest.getHeader(),headerRequest.getStartDate(),headerRequest.getEndDate(),headerRequest.getLoginId(),headerRequest.getType());
	}
	
	public List<ViewResponse> viewHeader() {
		String sql = "SELECT * FROM tbl_header_scheduler";
		return jdbcTemplateObject.query(sql,(rs, rowNum) -> new ViewResponse(rs.getString("creatorId"),rs.getString("ServiceCode"),rs.getString("HeaderServiceCode"),rs.getString("StartDateTime"),rs.getString("EndDateTime"),rs.getString("HeaderType")));
	}
}
