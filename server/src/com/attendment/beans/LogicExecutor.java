package com.attendment.beans;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.stereotype.Component;

@Component
public class LogicExecutor {
	public String getRoundedTime(String time) {
		String[] parts = time.split(":");
		int hour = Integer.parseInt(parts[0]);
		int min = Integer.parseInt(parts[1]);
		Calendar c =new GregorianCalendar();
		c.set(Calendar.HOUR_OF_DAY, hour);
		c.set(Calendar.MINUTE, min);
		c.set(Calendar.SECOND, 0);
		Date d = c.getTime();
		return toNearestWholeHour(d);
	}
	
	private String toNearestWholeHour(Date d) {
		Calendar c =new GregorianCalendar();
		c.setTime(d);
		if(c.get(Calendar.MINUTE) >= 30)
			c.add(Calendar.HOUR, 1);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		return c.getTime().toString();
	}
}
