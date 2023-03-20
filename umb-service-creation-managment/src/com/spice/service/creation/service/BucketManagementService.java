package com.spice.service.creation.service;

import java.sql.CallableStatement;
import java.util.Iterator;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spice.service.creation.dao.BucketManagementDao;
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
import com.spice.service.creation.request.ViewRuleRequest;
import com.spice.service.creation.request.ViewRulesRequest;
import com.spice.service.creation.response.AllBucketsResponse;
import com.spice.service.creation.response.LdmDataResponse;
import com.spice.service.creation.response.LdmResponse;
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.response.ViewBucketResponse;
import com.spice.service.creation.response.ViewBucketShortCodeResponse;
import com.spice.service.creation.response.ViewRulesResponse;


@Component
@Service
public class BucketManagementService {
	@Autowired
	private BucketManagementDao bucketmanagementdao;
	
	public ResponseObj ldm(LdmRequest ldmRequest) throws Exception
	{
		List<LdmResponse> l = bucketmanagementdao.ldm(ldmRequest);
		return new ResponseObj(l);
	}
	
	public ResponseObj ldmData(LdmDataRequest ldmDataRequest) throws Exception
	{
		List<LdmDataResponse> l = bucketmanagementdao.ldmData(ldmDataRequest);
		return new ResponseObj(l);
	}
	
	public ResponseObj fetchldmData(Integer offset, Integer limit) throws Exception
	{
		List<LdmDataResponse> l = bucketmanagementdao.fetchldmData(offset, limit);
		return new ResponseObj(l);
	}
	
	public ResponseObj getShortCodes() throws Exception {
		List <String> shortcoderesponse=bucketmanagementdao.getShortCodes();
		return new ResponseObj(shortcoderesponse);
	}
	
	public ResponseObj getMainRuleShortCodes() throws Exception {
		List <String> shortcoderesponse=bucketmanagementdao.getMainRuleShortCodes();
		return new ResponseObj(shortcoderesponse);
	}
	
	public ResponseObj createBucket(CreateBucketRequest createBucketRequest, String userId) throws Exception {
		int obj = bucketmanagementdao.createBucket(createBucketRequest, userId);
		if (obj == 0) {
			throw new com.spice.service.creation.exception.GenericException("Failed", "Failed", 0);
		}
		return new ResponseObj(obj);
	}
	
	public ResponseObj viewBuckets(ViewBucketRequest viewBucketRequest) throws Exception {
		if(viewBucketRequest.getShortCode() == null ) {
			List<ViewBucketShortCodeResponse> obj = bucketmanagementdao.viewBuckets(viewBucketRequest);
			System.out.println(obj.toString());
			if(obj.isEmpty()) {
				return new ResponseObj(null, "Failed", "No data found in db", 0);
			}
			return new ResponseObj(obj);
		}else {
			List<ViewBucketResponse> obj = bucketmanagementdao.viewBuckets2(viewBucketRequest);
			System.out.println(obj.toString());
			if(obj.isEmpty()) {
				return new ResponseObj(null, "Failed", "No data found in db", 0);
			}
			return new ResponseObj(obj);
		}	
	}
	
	public ResponseObj updatePreference(List<PreferenceRequest> prefernceRequest, String userId) throws Exception {
		CallableStatement preferenceResponse = bucketmanagementdao.updatePreferences(prefernceRequest, userId);
		return new ResponseObj(null, preferenceResponse.getString("OutStatus"),
				preferenceResponse.getString("OutDesc"), Integer.valueOf(preferenceResponse.getString("OutResponseCode")));
	}
	
	public ResponseObj updatePreferenceMain(List<MainRulePreferenceRequest> prefernceRequest, String userId) throws Exception {
		CallableStatement preferenceResponse = bucketmanagementdao.updateMainRulePreferences(prefernceRequest, userId);
		return new ResponseObj(null, preferenceResponse.getString("OutStatus"),
				preferenceResponse.getString("OutDesc"), Integer.valueOf(preferenceResponse.getString("OutResponseCode")));
	}
	
	public ResponseObj delete(DeleteBucketRequest delete, String userId) throws Exception {
		int obj =  bucketmanagementdao.delete(delete, userId);
		if (obj != 1) {
			throw new GenericException("Failed", "Failed", 0);
		}

		return new ResponseObj(obj);
	}
	
	public ResponseObj updateBucket(UpdateBucketRequest updatebucket, String userId) throws Exception {
		int obj = bucketmanagementdao.updateBucket(updatebucket, userId);
		if (obj == 0) {
			throw new GenericException("Failed", "Failed", 0);
		}

		return new ResponseObj(obj);
	}
	
	public ResponseObj getBuckets() throws Exception {
		List <String> bucketresponse=bucketmanagementdao.getBuckets();
		return new ResponseObj(bucketresponse);
	}
	
	public ResponseObj listDeploymentCriteriaType(CriteriaTypeRequest criteriaRequest) throws Exception {
		List <String> criteriaResponse=bucketmanagementdao.listDeploymentCriteriaType(criteriaRequest);
		return new ResponseObj(criteriaResponse);
	}
	
	public ResponseObj updateRule(UpdateRuleRequest updaterule) throws Exception {
		int obj = bucketmanagementdao.updateRule(updaterule);
		if (obj != 1) {
			throw new GenericException("Failed", "Failed", 0);
		}

		return new ResponseObj(obj);
	}
	
	public ResponseObj viewMainRules(ViewRulesRequest req) throws Exception {
		List<ViewRulesResponse> obj = bucketmanagementdao.viewMainRules(req);
		return new ResponseObj(obj);
	}
	
	public ResponseObj createMainRule(CreateRuleRequest createRuleRequest, String userId) throws Exception {
		int obj = bucketmanagementdao.createMainRule(createRuleRequest, userId);
		if (obj == 0) {
			throw new com.spice.service.creation.exception.GenericException("Failed", "Failed", 0);
		}
		return new ResponseObj(obj);
	}
	
	public ResponseObj deleteMainRule(DeleteRuleRequest deleteRuleRequest, String userId) throws Exception
	{
		int obj = bucketmanagementdao.deleteMainRule(deleteRuleRequest, userId);
		return new ResponseObj(obj);
	}
	
	public ResponseObj updateMainRule(UpdateMainRuleRequest updateMainRuleRequest, String userId) throws Exception
	{
		int obj = bucketmanagementdao.updateMainRule(updateMainRuleRequest, userId);
		return new ResponseObj(obj);
	}
	
	public ResponseObj allBuckets(AllBucketsRequest allBucketsRequest) throws Exception {
		List<AllBucketsResponse> obj = bucketmanagementdao.allBuckets(allBucketsRequest);
		return new ResponseObj(obj);
	}
	
	public ResponseObj deployRules(String userId)
	{
		int ret = bucketmanagementdao.deployRules(userId);
		return new ResponseObj(null, "", "", 0);
	}
}
