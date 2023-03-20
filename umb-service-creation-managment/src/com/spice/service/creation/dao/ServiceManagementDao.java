package com.spice.service.creation.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import javax.sql.DataSource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spice.service.creation.config.LoggingAspect;
import com.spice.service.creation.request.CancelEditServiceRequest;
import com.spice.service.creation.request.CommitServiceRequest;
import com.spice.service.creation.request.CreateServiceMasterRequest;
import com.spice.service.creation.request.CreateServiceNode;
import com.spice.service.creation.request.CreateServiceRequest;
import com.spice.service.creation.request.EditServiceRequest;
import com.spice.service.creation.request.FetchServiceDetailRequest;
import com.spice.service.creation.request.KeepAliveRequest;
import com.spice.service.creation.request.LinkServiceNodeRequest;
import com.spice.service.creation.request.RevokeRevisionRequest;
import com.spice.service.creation.request.ServiceListRequest;
import com.spice.service.creation.request.ServiceStatus;
import com.spice.service.creation.request.UpdateNodeStatusRequest;
import com.spice.service.creation.request.UpdateServiceDetailRequest;
import com.spice.service.creation.request.UpdateServiceRequest;
import com.spice.service.creation.response.ServiceListResponse;
import com.spice.service.creation.response.ServiceRevisionResponse;
import com.spice.service.creation.response.SingleServiceNodeReponse;
import com.spice.service.creation.response.ViewEditServiceResponse;

@Transactional
@Repository
public class ServiceManagementDao {
	private static final Logger log = LoggerFactory.getLogger(ServiceManagementDao.class);

	@Value("${jdbc.url}")
	private String jdbcUrl;

	@Value("${jdbc.username}")
	private String jdbcUserName;

	@Value("${jdbc.password}")
	private String jdbcPassword;

	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	@Qualifier("dataSource")
	public void setDataSource(DataSource ds) {
		this.jdbcTemplateObject = new JdbcTemplate(ds);
	}

	public CallableStatement updatesServiceStatus(ServiceStatus serviceStatus) throws Exception {
		String str = "{call proc_update_service_status(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_service_id", serviceStatus.getServiceId());
			stmt.setString("in_status", serviceStatus.getStatus());
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

	public CallableStatement createService(CreateServiceRequest createServiceRequest, String userId) throws Exception {

		String str = "{call proc_create_service_master(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_service_name", createServiceRequest.getServiceName());
			stmt.setString("in_service_code", createServiceRequest.getServiceCode());
			stmt.setString("in_creator_id", createServiceRequest.getCreatorId());
			stmt.setString("in_parent_service_id", createServiceRequest.getParentServiceId());
			stmt.setString("in_scope", createServiceRequest.getScope());
			stmt.setString("in_dcs", createServiceRequest.getDcs());
			stmt.setString("in_circle", createServiceRequest.getCircle());
			stmt.setString("in_status", createServiceRequest.getStatus());
			stmt.setString("in_operator", createServiceRequest.getOperator());
			stmt.setString("in_subscriber_type", createServiceRequest.getSubscriberType());
			stmt.setString("in_description", createServiceRequest.getDescription());
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

	public List<SingleServiceNodeReponse> getSingleServiceNode(String parentId, String serviceId) throws Exception {
		String str = "Call proc_get_single_service_node(?,?)";
		return jdbcTemplateObject.query(str, new Object[] { parentId, serviceId }, new SingleServiceNodeReponse());
	}

	public CallableStatement createServiceNode(CreateServiceNode createServiceNode, String userId) throws Exception {
		String str = "{call proc_create_service_node(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			System.out.println("-->" + jdbcUrl);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_parent_id", createServiceNode.getParentId());
			stmt.setString("in_status", createServiceNode.getStatus());
			stmt.setString("in_service_id", createServiceNode.getServiceId());
			stmt.setString("in_service_code", createServiceNode.getServiceCode());
			stmt.setString("in_request_text", createServiceNode.getRequestText());
			stmt.setString("in_response_text", createServiceNode.getResponseText());
			stmt.setString("in_regex", createServiceNode.getRegex());
			stmt.setString("in_invalid_response_text", createServiceNode.getInvalidResponseText());

			stmt.setString("in_invalid_menu_flag", createServiceNode.getInvalidMenuFlag());

			if (createServiceNode.getInvalidMenuFlag() == null || createServiceNode.getInvalidMenuFlag() == "") {
				stmt.setInt("in_invalid_menu_flag", 0);

			} else {
				stmt.setInt("in_invalid_menu_flag", Integer.parseInt(createServiceNode.getInvalidMenuFlag()));
			}

			stmt.setString("in_node_type", createServiceNode.getNodeType());
			stmt.setString("in_is_header", createServiceNode.getIsHeader());
			stmt.setString("in_is_footer", createServiceNode.getIsFooter());
			stmt.setString("in_is_list_element", createServiceNode.getIsListElement());
			stmt.setString("in_preference", createServiceNode.getPreference());
			stmt.setString("in_menu_flag", createServiceNode.getMenuFlag());
			stmt.setString("in_dcs", createServiceNode.getDcs());
			if (createServiceNode.getDcs() == null || createServiceNode.getDcs() == "") {
				stmt.setInt("in_dcs", 0);

			} else {
				stmt.setInt("in_dcs", Integer.parseInt(createServiceNode.getDcs()));
			}
			if (createServiceNode.getApplicationId() == null || createServiceNode.getApplicationId() == "") {
				stmt.setInt("in_application_id", 0);

			} else {
				stmt.setInt("in_application_id", Integer.parseInt(createServiceNode.getApplicationId()));
			}

			stmt.setString("in_variable_name", createServiceNode.getVariableName());
			stmt.setString("in_variable_value", createServiceNode.getVariableValue());

			stmt.setString("in_switch_service_id", createServiceNode.getSwitchServiceId());

			if (createServiceNode.getSwitchServiceId() == null || createServiceNode.getSwitchServiceId() == "") {
				stmt.setInt("in_switch_service_id", 0);
			} else {
				stmt.setInt("in_switch_service_id", Integer.parseInt(createServiceNode.getSwitchServiceId()));
			}
			stmt.setString("in_switch_service_code", createServiceNode.getServiceCode());
			stmt.setString("in_circle_id", createServiceNode.getCircleId());
			stmt.setString("in_operator_id", createServiceNode.getOperatorId());
			stmt.setString("in_if_clause", createServiceNode.getIfClause());
			if (createServiceNode.getIfClause() == null || createServiceNode.getIfClause() == "") {
				stmt.setInt("in_if_clause", 0);

			} else {
				stmt.setInt("in_if_clause", Integer.parseInt(createServiceNode.getIfClause()));
			}
			stmt.setString("in_if_value_clause", createServiceNode.getIfValueClause());
			stmt.setString("in_sequence_no", createServiceNode.getSequenceNo());
			/* stmt.setString("in_is_hide", createServiceNode.getIsHide()); */
			stmt.registerOutParameter("OutStatus", Types.INTEGER);
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

	public CallableStatement updateService(UpdateServiceRequest updateServiceRequest, String userId) throws Exception {
		String str = "{call proc_update_service_node(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_node_id", updateServiceRequest.getNodeId());
			stmt.setString("in_parent_id", updateServiceRequest.getParentId());
			stmt.setString("in_status", updateServiceRequest.getStatus());
			stmt.setString("in_service_id", updateServiceRequest.getServiceId());
			stmt.setString("in_service_code", updateServiceRequest.getServiceCode());
			stmt.setString("in_request_text", updateServiceRequest.getRequestText());
			stmt.setString("in_response_text", updateServiceRequest.getResponseText());
			stmt.setString("in_regex", updateServiceRequest.getRegex());
			stmt.setString("in_invalid_response_text", updateServiceRequest.getInvalidResponseText());

			if (updateServiceRequest.getInvalidMenuFlag() == null || updateServiceRequest.getInvalidMenuFlag() == "") {
				stmt.setInt("in_invalid_menu_flag", 0);
			} else {
				stmt.setInt("in_invalid_menu_flag", Integer.parseInt(updateServiceRequest.getInvalidMenuFlag()));
			}

			stmt.setString("in_node_type", updateServiceRequest.getNodeType());
			stmt.setString("in_is_header", updateServiceRequest.getIsHeader());
			stmt.setString("in_is_footer", updateServiceRequest.getIsFooter());
			stmt.setString("in_is_list_element", updateServiceRequest.getIsListElement());
			stmt.setString("in_preference", updateServiceRequest.getPreference());
			stmt.setString("in_menu_flag", updateServiceRequest.getMenuFlag());
			if (updateServiceRequest.getDcs() == null || updateServiceRequest.getDcs() == "") {
				stmt.setInt("in_dcs", 0);
			} else {
				stmt.setInt("in_dcs", Integer.parseInt(updateServiceRequest.getDcs()));
			}

			stmt.setString("in_application_id", updateServiceRequest.getApplicationId());
			stmt.setString("in_variable_name", updateServiceRequest.getVariableName());
			stmt.setString("in_variable_value", updateServiceRequest.getVariableValue());
			stmt.setString("in_switch_service_id", updateServiceRequest.getSwitchServiceId());
			stmt.setString("in_switch_service_code", updateServiceRequest.getSwitchServiceCode());
			stmt.setString("in_circle_id", updateServiceRequest.getCircleId());
			stmt.setString("in_operator_id", updateServiceRequest.getOperatorId());
			if (updateServiceRequest.getIfClause() == null || updateServiceRequest.getIfClause() == "") {
				stmt.setInt("in_if_clause", 0);

			} else {
				stmt.setInt("in_if_clause", Integer.parseInt(updateServiceRequest.getIfClause()));
			}
			stmt.setString("in_if_value_clause", updateServiceRequest.getIfValueClause());
			stmt.setString("in_login_id", userId);
			stmt.setString("in_sequence_no", updateServiceRequest.getSequenceNo());
			/* stmt.setString("in_is_hide", updateServiceRequest.getIsHide()); */
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

	public CallableStatement updateNodeStatus(UpdateNodeStatusRequest updateNodeStatusRequest, String userId)
			throws Exception {
		String str = "{call proc_update_node_status(?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_node_id", updateNodeStatusRequest.getNodeId());
			stmt.setString("in_status", updateNodeStatusRequest.getStatus());
			stmt.setString("in_service_id", updateNodeStatusRequest.getServiceId());
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

	public CallableStatement createServiceMaster(CreateServiceMasterRequest createServiceMasterRequest, String userId)
			throws Exception {
		String str = "{call proc_create_service_master(?,?,?,?,?,?,?,?,?,?,?)}";
		System.out.println("call proc_create_service_master("+userId+",?,?,?,?,?,?,?,?,?,?)");
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setInt("in_creation_mode", Integer.parseInt(createServiceMasterRequest.getCreationMode()));

			if (createServiceMasterRequest.getSourceServiceId() == null
					|| createServiceMasterRequest.getSourceServiceId() == "") {
				stmt.setInt("in_source_service_id", 0);

			} else {
				stmt.setInt("in_source_service_id", Integer.parseInt(createServiceMasterRequest.getSourceServiceId()));
			}

			if (createServiceMasterRequest.getParentServiceId() == null
					|| createServiceMasterRequest.getParentServiceId() == "") {
				stmt.setInt("in_parent_service_id", 0);

			} else {
				stmt.setInt("in_parent_service_id", Integer.parseInt(createServiceMasterRequest.getParentServiceId()));
			}

			stmt.setString("in_service_name", createServiceMasterRequest.getServiceName());
			stmt.setString("in_service_code", createServiceMasterRequest.getServiceCode());
			stmt.setString("in_description", createServiceMasterRequest.getDescription());
			stmt.setString("in_tree_type", createServiceMasterRequest.getTreeType());
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

	public CallableStatement commitService(CommitServiceRequest commitServiceRequest, String userId) throws Exception {

		String str = "{call proc_commit_service(?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			System.out.println("call proc_commit_service(" + userId + "," + commitServiceRequest.getVersionType() + ","
					+ commitServiceRequest.getServiceId() + "," + commitServiceRequest.getRemarks() + ",?,?,?)");
			// System.out.println("userId="+userId+",version="+commitServiceRequest.getVersionType()+",service="+commitServiceRequest.getServiceId()+",Remarks="+commitServiceRequest.getRemarks());

			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			System.out.println("connection==" + conn);

			CallableStatement stmt = conn.prepareCall(str);

			stmt.setString("in_login_id", userId);
			stmt.setString("in_version_type", commitServiceRequest.getVersionType());
			stmt.setString("in_service_id", commitServiceRequest.getServiceId());
			stmt.setString("in_remarks", commitServiceRequest.getRemarks());

			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			System.out.println("stmt ----" + stmt.toString());
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

	public CallableStatement editService(EditServiceRequest editServiceRequest, String userId) throws Exception {
		log.info("call proc_edit_service("+userId+","+editServiceRequest.getServiceId()+",@a,@b,@c)");
		String str = "{call proc_edit_service(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_service_id", editServiceRequest.getServiceId());
			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();
			log.info("Response from proc_edit_service-->"+stmt.getString("OutStatus")+","+stmt.getString("OutResponseCode")+","+stmt.getString("OutDesc"));
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

	public List<ServiceListResponse> serviceList(ServiceListRequest serviceListRequest, String userId)
			throws Exception {
		String str = "call proc_get_service_list(?,?)";
		return jdbcTemplateObject.query(str, new Object[] { userId, serviceListRequest.getParentId() },
				new ServiceListResponse());
	}

	public CallableStatement updateServiceDetail(UpdateServiceDetailRequest updateServiceDetailRequest, String userId)
			throws Exception {
		String str = "{call proc_update_service_detail(?,?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_description", updateServiceDetailRequest.getDescription());
			stmt.setString("in_service_id", updateServiceDetailRequest.getServiceId());
			stmt.setString("in_service_name", updateServiceDetailRequest.getServiceName());
			stmt.setString("in_status", updateServiceDetailRequest.getStatus());
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

	public CallableStatement cancelEditService(CancelEditServiceRequest cancelEditServiceRequest, String userId)
			throws Exception {
		String str = "{call proc_cancel_edit_service(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_service_id", cancelEditServiceRequest.getServiceId());
			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();
			System.out.println("Response from proc_cancel_edit_service-->"+stmt.getString("OutStatus")+","+stmt.getString("OutResponseCode")+","+stmt.getString("OutDesc"));
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

	public CallableStatement keepAlive(KeepAliveRequest keepRequest) throws Exception {
		log.info("call proc_service_keep_alive("+keepRequest.getUserId()+","+keepRequest.getServiceId()+",@a,@b,@c)");
		String str = "{call proc_service_keep_alive(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", keepRequest.getUserId());
			stmt.setString("in_service_id", keepRequest.getServiceId());
			stmt.registerOutParameter("OutStatus", Types.VARCHAR);
			stmt.registerOutParameter("OutResponseCode", Types.INTEGER);
			stmt.registerOutParameter("OutDesc", Types.VARCHAR);
			stmt.execute();
			log.info("Response from proc_service_keep_alive-->"+stmt.getString("OutStatus")+","+stmt.getString("OutResponseCode")+","+stmt.getString("OutDesc"));
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

	public CallableStatement fetchServiceDetail(FetchServiceDetailRequest fetchServiceDetailRequest, String userId)
			throws Exception {
		String str = "{call proc_fetch_service_detail(?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_service_id", fetchServiceDetailRequest.getServiceId());
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

	public List<ServiceRevisionResponse> serviceRevision(String loginId) throws Exception {
		String str = "Call proc_view_service_revision_history(?)";
		return jdbcTemplateObject.query(str, new Object[] { loginId }, new ServiceRevisionResponse());
	}

	public List<ViewEditServiceResponse> viewEditService(String loginId) throws Exception {
		String str = "Call proc_view_edit_service_history(?)";
		return jdbcTemplateObject.query(str, new Object[] { loginId }, new ViewEditServiceResponse());
	}

	public CallableStatement revokeRevisionService(RevokeRevisionRequest revokeRevisionRequest, String userId)
			throws Exception {
		String str = "{call proc_revoke_revision_service(?,?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_service_id", revokeRevisionRequest.getServiceId());
			stmt.setString("in_version_major", revokeRevisionRequest.getVersionMajor());
			stmt.setString("in_version_minor", revokeRevisionRequest.getVersionMinor());
			stmt.setString("in_remarks", revokeRevisionRequest.getRemarks());
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

	public CallableStatement linkServiceNode(LinkServiceNodeRequest linkServiceNodeRequest, String userId)
			throws Exception {
		String str = "{call proc_link_service_node(?,?,?,?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			CallableStatement stmt = conn.prepareCall(str);
			stmt.setString("in_login_id", userId);
			stmt.setString("in_service_id", linkServiceNodeRequest.getServiceId());
			stmt.setString("in_source_node_id", linkServiceNodeRequest.getSourceNodeId());
			stmt.setString("in_dest_node_id", linkServiceNodeRequest.getDestNodeId());
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

	/*
	 * public void test(int id, String str) { try { Connection con =
	 * DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
	 * PreparedStatement ps = con.prepareStatement(
	 * "insert into tbl_service_nodes_t (parent_id, service_id, service_code, response_text) values(?,?,?,?)"
	 * );
	 *
	 * ps.setInt(1, 2); ps.setInt(2, 2); ps.setString(3, "2"); ps.setString(4, str);
	 * ps.executeUpdate();
	 *
	 * PreparedStatement ps1 =
	 * con.prepareStatement("select response_text from tbl_service_nodes_t");
	 * ResultSet rs = ps1.executeQuery(); while (rs.next()) { //
	 * System.out.println(rs.getString(2)+", "); } } catch (Exception ex) {
	 * ex.printStackTrace(); } }
	 */

	public void test(int id, String str) {
		String proc = "{call proc_test(?,?,?,?)}";
		Connection conn = null;
		try {
			conn = DriverManager.getConnection(jdbcUrl, jdbcUserName, jdbcPassword);
			System.out.println("--->" + str);
			CallableStatement stmt = conn.prepareCall(proc);
			stmt.setInt(1, 3);
			stmt.setInt(2, 3);
			stmt.setString(3, "3");
			stmt.setString(4, str);

			stmt.execute();

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

	}

}
