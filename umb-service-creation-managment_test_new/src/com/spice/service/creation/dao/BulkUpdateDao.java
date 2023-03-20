package com.spice.service.creation.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spice.service.creation.request.DeployNarrationRequest;
import com.spice.service.creation.request.DeployUatRequest;
import com.spice.service.creation.request.ListNarrationRequest;
import com.spice.service.creation.request.UpdateNarrationRequest;
import com.spice.service.creation.response.ListNarrationResponse;
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.response.UpdateNarrationResponse;
import com.spice.service.creation.utility.CustomException;

@Transactional(rollbackFor = CustomException.class)
@Repository
public class BulkUpdateDao 
{
	@Value("${jdbc.url}")
	private String jdbcUrl;
	
	@Value("${jdbc.username}")
	private String jdbcUserName;
	
	@Value("${jdbc.password}")
	private String jdbcPassword;
	
	private JdbcTemplate jdbcTemplateObject;
	
	@Autowired
	private DeploymentDao deploymentDao;
	
	@Autowired
	@Qualifier("dataSource")
	public void setDataSource(DataSource ds) 
	{
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}
	
	public List<ListNarrationResponse> listNarration(ListNarrationRequest req)
	{
		String sql = "call proc_get_narration(?)";
		return jdbcTemplateObject.query(sql, new Object[]{req.getServiceCode()},
				(rs, rowNum) -> new ListNarrationResponse(rs.getInt("service_id"), rs.getString("service_code"), 
						rs.getString("response_text"), rs.getInt("node_id")));
	}

	public UpdateNarrationResponse updateNarration(UpdateNarrationRequest req, String userId)
	{
		List<String> reason = new ArrayList<String>();
		List<String> serviceCode = new ArrayList<String>();
		int size = req.getServiceCode().size();
		List<Integer> l1 = req.getServiceId();
		List<String> l2 = req.getServiceCode();
		List<Integer> l3 = req.getNodeId();
		int flag = 0;
		startTrans();
		for (int i = 0; i < size; i++)
		{
			int res = updateNarrationTrans(userId, l1.get(i), l2.get(i), req.getNarration() ,l3.get(i));
			if (res == 1)
			{
				reason.add("Internal server problem");
				serviceCode.add(l2.get(i));
				flag = 1;
			}
			else if (res == 2)
			{
				reason.add("Service is in edit mode");
				serviceCode.add(l2.get(i));
				flag = 1;
			}
			else if (res == 3 || res == 4)
			{
				reason.add("Service has been changed");
				serviceCode.add(l2.get(i));
				flag = 1;
			}
		}
		if (flag == 1)
		{
			rollback();
		}
		else
		{
			commit();
		}
		return new UpdateNarrationResponse(serviceCode, reason);
	}
	
	public int deployNarration(DeployNarrationRequest req, String userId) throws Exception
	{
		List<Integer> l1 = req.getServiceId();
		int size = req.getServiceId().size();
		for (int i = 0; i < size; i++)
		{
			DeployUatRequest deployUatRequest = new DeployUatRequest();
			deployUatRequest.setDeploymentDate(req.getDeploymentDate());
			deployUatRequest.setServiceId(l1.get(i).toString());
			try 
			{
				deploymentDao.deployLive(deployUatRequest, userId);
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				throw e;
			}
		}
		return 0;
	}
	
	private Integer updateNarrationTrans(String userId, Integer serviceId, String serviceCode, String narration, Integer nodeId)
	{
		String remarks = "Bulk Update Narration (" + serviceCode + ")";
		SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplateObject);
		simpleJdbcCall.withProcedureName("proc_commit_mass_update_narration");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("p_login_id", Integer.parseInt(userId));
		param.put("p_service_id", serviceId);
		param.put("p_service_code", serviceCode);
		param.put("p_response_text", narration);
		param.put("p_node_id", nodeId);
		param.put("p_remarks", remarks);
		SqlParameterSource in = new MapSqlParameterSource(param);
		Map<String, Object> simpleJdbcCallResult = simpleJdbcCall.execute(in);
		Integer res = (Integer) simpleJdbcCallResult.get("p_return_value");
		return res;
	}
	
	private void startTrans()
	{
		String sql = "start transaction;";
		jdbcTemplateObject.update(sql);
	}
	
	private void commit()
	{
		String sql = "commit;";
		jdbcTemplateObject.update(sql);
	}
	
	private void rollback()
	{
		String sql = "rollback;";
		jdbcTemplateObject.update(sql);
	}
}
