package com.spice.service.creation.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spice.service.creation.dao.BucketManagementDao;
import com.spice.service.creation.request.AllBucketsRequest;
import com.spice.service.creation.request.CreateBucketRequest;
import com.spice.service.creation.request.CreateRuleRequest;
import com.spice.service.creation.request.CreateServiceRequest;
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
import com.spice.service.creation.response.ResponseObj;
import com.spice.service.creation.service.BucketManagementService;

@RestController
@RequestMapping(value = "/bucketManagement")
public class BucketManagementController {
	@Autowired
	private BucketManagementService bucketmanagementservice;
	
	@RequestMapping(value = "/ldm", method = RequestMethod.POST)
	public ResponseObj ldm(@RequestBody LdmRequest ldmRequest) throws Exception
	{
		return bucketmanagementservice.ldm(ldmRequest);
	}
	
	@RequestMapping(value = "/ldmData", method = RequestMethod.POST)
	public ResponseObj ldmData(@RequestBody LdmDataRequest ldmDataRequest) throws Exception
	{
		return bucketmanagementservice.ldmData(ldmDataRequest);
	}
	
	@RequestMapping(value = "/fetchldmData", method = RequestMethod.POST)
	public ResponseObj fetchldmData(@RequestParam Integer offset, @RequestParam Integer limit) throws Exception
	{
		return bucketmanagementservice.fetchldmData(offset, limit);
	}

	@RequestMapping(value = "/shortCodes", method = RequestMethod.POST)
	public ResponseObj shortCodes() throws Exception {
		return bucketmanagementservice.getShortCodes();
	}
	
	@RequestMapping(value = "/mainRuleShortCodes", method = RequestMethod.POST)
	public ResponseObj mainRuleShortCodes() throws Exception {
		return bucketmanagementservice.getMainRuleShortCodes();
	}

	@RequestMapping(value = "/createBucket", method = RequestMethod.POST)
	public ResponseObj createBucket(@Valid @RequestBody CreateBucketRequest createBucketRequest, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.createBucket(createBucketRequest, userId);
	}

	@RequestMapping(value = "/viewBuckets", method = RequestMethod.POST)
	public ResponseObj viewBuckets(@Valid @RequestBody ViewBucketRequest viewBucketRequest) throws Exception {
		return bucketmanagementservice.viewBuckets(viewBucketRequest);
	}

	@RequestMapping(value = "/updatePreference", method = RequestMethod.POST)
	public ResponseObj updatePreference(@RequestBody List<PreferenceRequest> prefernceRequest, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.updatePreference(prefernceRequest, userId);
	}
	
	@RequestMapping(value = "/updatePreferenceMain", method = RequestMethod.POST)
	public ResponseObj updatePreferenceMain(@RequestBody List<MainRulePreferenceRequest> prefernceRequest, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.updatePreferenceMain(prefernceRequest, userId);
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public ResponseObj delete(@RequestBody DeleteBucketRequest delete, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.delete(delete, userId);
	}

	@RequestMapping(value = "/updateBucket", method = RequestMethod.POST)
	public ResponseObj updateBucket(@RequestBody UpdateBucketRequest updatebucket, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.updateBucket(updatebucket, userId);
	}
	
	/*********** creating rule engine apis ************/
	
	@RequestMapping(value = "/rule/listBuckets", method = RequestMethod.POST)
	public ResponseObj listBuckets() throws Exception {
		return bucketmanagementservice.getBuckets();
	}
	
	@RequestMapping(value = "/rule/listDeploymentCriteriaType", method = RequestMethod.POST)
	public ResponseObj listDeploymentCriteriaType(@RequestBody CriteriaTypeRequest criteriaRequest) throws Exception {
		return bucketmanagementservice.listDeploymentCriteriaType(criteriaRequest);
	}

	@RequestMapping(value = "/rule/createRule", method = RequestMethod.POST)
	public ResponseObj createRule(@Valid @RequestBody CreateRuleRequest createRuleRequest, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.createMainRule(createRuleRequest, userId);
	}
	
	@RequestMapping(value = "/rule/deleteRule", method = RequestMethod.POST)
	public ResponseObj deleteRule(@Valid @RequestBody DeleteRuleRequest deleteRuleRequest, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.deleteMainRule(deleteRuleRequest, userId);
	}
	
	@RequestMapping(value = "/rule/updateMainRule", method = RequestMethod.POST)
	public ResponseObj updateMainRule(@RequestBody UpdateMainRuleRequest updaterule, @RequestHeader(value="userId") String userId) throws Exception {
		return bucketmanagementservice.updateMainRule(updaterule, userId);
	}
	
	@RequestMapping(value = "/rule/updateRule", method = RequestMethod.POST)
	public ResponseObj updateRule(@RequestBody UpdateRuleRequest updaterule) throws Exception {
		return bucketmanagementservice.updateRule(updaterule);
	}
	
	@RequestMapping(value = "/rule/viewRules", method = RequestMethod.POST)
	public ResponseObj viewRules(@RequestBody ViewRulesRequest req) throws Exception {
		return bucketmanagementservice.viewMainRules(req);
	}
	
	@RequestMapping(value = "/rule/allBuckets", method = RequestMethod.POST)
	public ResponseObj allBuckets(@RequestBody AllBucketsRequest allBucketsRequest) throws Exception {
		return bucketmanagementservice.allBuckets(allBucketsRequest);
	}
	
	@RequestMapping(value = "/deployRules", method = RequestMethod.POST)
	public ResponseObj deployRules(@RequestHeader(value="userId") String userId)
	{
		return bucketmanagementservice.deployRules(userId);
	}
}
