package com.digispice.headerscheduler.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.digispice.headerscheduler.dao.HeaderSchedulerDao;
import com.digispice.headerscheduler.exception.GenericException;
import com.digispice.headerscheduler.request.HeaderRequest;
import com.digispice.headerscheduler.response.ResponseObj;
import com.digispice.headerscheduler.response.ViewResponse;
import com.digispice.headerscheduler.utility.FileUpload;
import com.digispice.headerscheduler.utility.Utility;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Component
@Service
public class HeaderSchedulerService {
	@Autowired
	private HeaderSchedulerDao headerschedulerdao;

	public ResponseObj serviceCode() throws Exception {
		List<String> shortcoderesponse = headerschedulerdao.serviceCode();
		return new ResponseObj(shortcoderesponse);
	}

	public ResponseObj headers() throws Exception {
		List<String> shortcoderesponse = headerschedulerdao.headers();
		return new ResponseObj(shortcoderesponse);
	}

	public ResponseObj scheduleHeader(HeaderRequest headerRequest) throws Exception {
		if (headerRequest.getType() == "HEADER")
		{
			int checkCompatibility = headerschedulerdao.checkCompatibility(headerRequest);
			//System.out.println("checkCompatibility==>"+checkCompatibility);
			if(checkCompatibility == 1) {
				int obj = 0;
				List<String> startDates = Utility.tokenizeDate(headerRequest.getStartDate());
				List<String> endDates = Utility.tokenizeDate(headerRequest.getEndDate());
	
				Iterator itr = startDates.iterator();
				Iterator itr2 = endDates.iterator();
	
				while (itr.hasNext() && itr2.hasNext()) {
					headerRequest.setStartDate(itr.next().toString());
					headerRequest.setEndDate(itr2.next().toString());
	
					obj = headerschedulerdao.scheduleHeader(headerRequest);
					if (obj == 0) {
						throw new GenericException("Failed", "Failed", 0);
					}
				}
				return new ResponseObj(obj);
			}else {
				throw new GenericException("Failed", "Compatibilty failed", 0);
			}
		}
		else
		{
			int obj = 0;
			List<String> startDates = Utility.tokenizeDate(headerRequest.getStartDate());
			List<String> endDates = Utility.tokenizeDate(headerRequest.getEndDate());

			Iterator itr = startDates.iterator();
			Iterator itr2 = endDates.iterator();

			while (itr.hasNext() && itr2.hasNext()) {
				headerRequest.setStartDate(itr.next().toString());
				headerRequest.setEndDate(itr2.next().toString());

				obj = headerschedulerdao.scheduleHeader(headerRequest);
				if (obj == 0) {
					throw new GenericException("Failed", "Failed", 0);
				}
			}
			return new ResponseObj(obj);
		}
	}

	public ResponseObj viewHeader() throws Exception {
		List<ViewResponse> viewresponse = headerschedulerdao.viewHeader();
		if(viewresponse.isEmpty()) {
			return new ResponseObj(null, "Failed", "No data found in db", 0);
		}
		return new ResponseObj(viewresponse);
	}
	
	/*
	 <Headers>
	<Header>
		<Type>HEADER</Type>
		<MainServiceCode>421</MainServiceCode>
		<Replacement>123_HEADER</Replacement>
		<StartDateTime></StartDateTime>
		<EndDateTime></EndDateTime>
	</Header>
</Headers>
	 */
	public ResponseObj fileUpload(MultipartFile file, String userId) throws Exception 
	{
		FileUpload f = new FileUpload();
		return f.save(file, headerschedulerdao, userId);
	}
}
