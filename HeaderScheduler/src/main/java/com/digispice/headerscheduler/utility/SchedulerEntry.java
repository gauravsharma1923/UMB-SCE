package com.digispice.headerscheduler.utility;

import java.util.Iterator;
import java.util.List;

import javax.xml.xpath.XPathConstants;

import org.springframework.beans.factory.annotation.Autowired;

import com.digispice.headerscheduler.dao.HeaderSchedulerDao;
import com.digispice.headerscheduler.exception.GenericException;
import com.digispice.headerscheduler.response.ResponseObj;

import com.digispice.headerscheduler.request.HeaderRequest;

public class SchedulerEntry 
{
	String Type;
	String MainServiceCode;
	String StartDateTime;
	String EndDateTime;
	String Replacement;
	
	
	public SchedulerEntry()
	{
		this.Type = "";
		this.MainServiceCode = "";
		this.StartDateTime = "";
		this.EndDateTime = "";
		this.Replacement = "";
	}
	
	public SchedulerEntry(String Type, String MainServiceCode, String StartDateTime, String EndDateTime,
			String Replacement)
	{
		this.Type = Type;
		this.MainServiceCode = MainServiceCode;
		this.StartDateTime = StartDateTime;
		this.EndDateTime = EndDateTime;
		this.Replacement = Replacement;
	}
	
	public boolean validate()
	{
		if (Type.equals("") || MainServiceCode.equals("") || StartDateTime.equals("") || EndDateTime.equals("") || Replacement.equals(""))
		{
			return false;
		}
		if (!(Type.equals("HEADER") || Type.equals("MENU") || Type.equals("TEXT")))
		{
			return false;
		}
		if (Type.equals("TEXT"))
		{
			if (Replacement.length() > 182)
				return false;
		}
		return true;
	}
	
	public void print()
	{
		System.out.printf("%s|%s|%s|%s|%s\n", Type, MainServiceCode, Replacement, StartDateTime, EndDateTime);
	}
	
	public String persist(HeaderSchedulerDao headerschedulerdao, String userId) throws Exception
	{
		HeaderRequest headerRequest = new HeaderRequest(Integer.parseInt(userId), MainServiceCode, Replacement, StartDateTime, EndDateTime, Type);
		
		if (headerRequest.getType().equals("HEADER"))
		{
			int checkCompatibility = headerschedulerdao.checkCompatibility(headerRequest);
			if(checkCompatibility == 1) 
			{
				int obj = 0;
				List<String> startDates = Utility.tokenizeDate(headerRequest.getStartDate());
				List<String> endDates = Utility.tokenizeDate(headerRequest.getEndDate());
	
				Iterator itr = startDates.iterator();
				Iterator itr2 = endDates.iterator();
	
				while (itr.hasNext() && itr2.hasNext()) 
				{
					headerRequest.setStartDate(itr.next().toString());
					headerRequest.setEndDate(itr2.next().toString());
	
					obj = headerschedulerdao.scheduleHeader(headerRequest);
					if (obj == 0) 
					{
						return "Internal Server Error";
					}
				}
				return "Successfully Scheduled";
			}
			else 
			{
				return "Incompatible Header Menu";
			}
		}
		else // MENU and TEXT
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
				if (obj == 0) 
				{
					return "Internal Server Error";
				}
			}
			return "Successfully Scheduled";
		}
		
	}
}
