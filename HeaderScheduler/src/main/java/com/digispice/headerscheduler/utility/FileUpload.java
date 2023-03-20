package com.digispice.headerscheduler.utility;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.digispice.headerscheduler.response.ResponseObj;
import com.digispice.headerscheduler.dao.HeaderSchedulerDao;
import com.digispice.headerscheduler.response.FileUploadResponse;

public class FileUpload 
{
	private MultipartFile file;
	private HeaderSchedulerDao headerschedulerdao;
	private String userId;
	
	public ResponseObj save(MultipartFile file, HeaderSchedulerDao headerschedulerdao, String userId)
	{
		this.file = file;
		this.headerschedulerdao = headerschedulerdao;
		this.userId = userId;
		return process();
	}
	
	private ResponseObj process()
	{
		Path path = null;
		if (file.isEmpty())
		{
			return new ResponseObj(0, "File is empty", "File is empty", 1);
		}
		else
		{
			try
			{
				byte[] bytes = file.getBytes();
				path = Paths.get("/tmp/" + file.getOriginalFilename());
				Files.write(path, bytes);
			}
			catch (IOException e)
			{
				return new ResponseObj(0, "Internal Server Error", "Internal Server Error", 1);
			}
			
			List<FileUploadResponse> lr = new ArrayList<FileUploadResponse>();
			try
			{
				List<SchedulerEntry> l = new ArrayList<SchedulerEntry>();
				System.out.println(path.toString());
				File fXmlFile = new File(path.toString());
				DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
				DocumentBuilder dBuilder = null;
				dBuilder = dbFactory.newDocumentBuilder();
				Document doc = null;
				doc = dBuilder.parse(fXmlFile); 
				XPath xPath =  XPathFactory.newInstance().newXPath();
				String expression = "/Headers/Header";
				NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(doc, XPathConstants.NODESET);
				int i = 0;
				String r = "";
				for (i = 0; i < nodeList.getLength(); i++)
				{
					String ex = "";	
					String type = "";
					String mainServiceCode = "";
					String startDateTime = "";
					String endDateTime = "";
					String replacement = "";
					int no = i + 1;
					
					ex = "/Headers/Header[" + no +"]/Type";
					type = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					
					ex = "/Headers/Header[" + no +"]/MainServiceCode";
					mainServiceCode = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					
					ex = "/Headers/Header[" + no +"]/StartDateTime";
					startDateTime = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					
					ex = "/Headers/Header[" + no +"]/EndDateTime";
					endDateTime = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					
					ex = "/Headers/Header[" + no +"]/Replacement";
					replacement = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					
					/*if (type.equals("HEADER"))
					{
						ex = "/Headers/Header[" + no +"]/Replacement";
						headerServiceCode = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					}
					else if (type.equals("MENU"))
					{
						ex = "/Headers/Header[" + no +"]/Replacement";
						headerServiceCode = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					}
					else if (type.equals("TEXT"))
					{
						ex = "/Headers/Header[" + no +"]/Replacement";
						text = (String) xPath.compile(ex).evaluate(doc, XPathConstants.STRING);
					}*/
					
					SchedulerEntry entry = new SchedulerEntry(type, mainServiceCode, startDateTime, endDateTime, replacement);
					
					entry.print();
					
					if (entry.validate())
					{
						try
						{
							r = entry.persist(headerschedulerdao, userId);
						}
						catch (Exception e)
						{
							r = "Internal Server Error";
						}
					}
					else
					{
						r = "Validation Failed";
					}
					
					lr.add(new FileUploadResponse(type, mainServiceCode, replacement, startDateTime, endDateTime, r));
				}
				
			}
			catch (ParserConfigurationException e)
			{	
			}
			catch (SAXException e) 
			{
				e.printStackTrace();
				return new ResponseObj(0, "Invalid XML file", "Invalid XML file", 1);
			}
			catch (IOException e)
			{
				e.printStackTrace();
			}
			catch (XPathExpressionException e) 
			{
				e.printStackTrace();
			}
			
			return new ResponseObj(lr, "Processed File", "Processed File", 0);
		}
	}
	
}
