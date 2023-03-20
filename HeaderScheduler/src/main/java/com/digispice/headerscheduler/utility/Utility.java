package com.digispice.headerscheduler.utility;

import java.util.Collections;
import java.util.List;
import java.util.StringTokenizer;
import java.util.stream.Collectors;

public class Utility {
	public static List<String> tokenizeDate(String date){
		return Collections.list(new StringTokenizer(date, ",")).stream()
			      .map(token -> (String) token)
			      .collect(Collectors.toList());
	}
}
