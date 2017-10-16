package www.retail.gahan.utility;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.joda.time.DateTime;
import org.joda.time.Days;
import org.joda.time.Period;
import org.joda.time.ReadableInstant;
import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class DateFormate {

	public static String dateToString(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String datestr = formatter.format(date);
		return datestr;
	}
	
	public static String dateTimeToString(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("hh:mm a  MMM-dd-yyyy  ");
		String dateTimestr = formatter.format(date);
		return dateTimestr;
	}
	
	public static Date stringToDate(String datestr) throws ParseException{
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		Date date = formatter.parse(datestr);
		return date;
	}
	
	public static String stringNextWeekDateFromToday(Date date){
		long newDate = date.getTime()+7*24*60*60*1000;
		Date date7 = new Date(newDate);
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
		String datestr = formatter.format(date7);
		return datestr;
	}
	
	public static String periodCounter(String gahanDate) throws ParseException{
		ReadableInstant gDate = DateTime.parse(gahanDate, DateTimeFormat.forPattern("dd-MM-yyyy"));
		ReadableInstant todaysDate = new DateTime();
		Period p = new Period(gDate,todaysDate);
		int dayCount = p.getDays();
		int monthCount = p.getMonths();
		int yearCount = p.getYears();
		if(yearCount==0 && monthCount==0 && dayCount!=0){
			String daysCount = dayCount+" Days " ;
			return daysCount;
		}
		if(yearCount==0 && monthCount!=0 && dayCount!=0){
			String monthDayCount = monthCount+" Months and " + dayCount+" Days " ;
			return monthDayCount;
		}
		if(monthCount==0 && yearCount!=0 && dayCount!=0){
			String yearDayCount = yearCount+" Years and "+ dayCount+" Days " ;
			return yearDayCount;
		}
		if(dayCount==0 && monthCount!=0 && yearCount!=0){
			String yearDayCount = yearCount+" Years and "+ monthCount+" Months" ;
			return yearDayCount;
		}
		if(dayCount!=0 && monthCount!=0 && yearCount!=0){
		 String yearMonthDayCount = p.getYears()+" Years "+ p.getMonths()+" Months and " + p.getDays()+" Days " ;
		 return yearMonthDayCount;
		}
		return gahanDate;
		
	}

	public static String monthPeriodLastDate(String gahanDate, Integer monthPeriod) {
		DateTime gDate = DateTime.parse(gahanDate, DateTimeFormat.forPattern("dd-MM-yyyy"));
		DateTime monthPeriodLastDate = gDate.plusMonths(monthPeriod);
		DateTimeFormatter formatter = DateTimeFormat.forPattern("dd-MM-yyyy");
		String lastDate  = formatter.print(monthPeriodLastDate);
		return lastDate;
	}
	
	public static Integer numberOfDaysBetweenTwoDates(String date1, String date2){
		DateTime gDate1 = DateTime.parse(date1, DateTimeFormat.forPattern("dd-MM-yyyy"));
		DateTime gDate2 = DateTime.parse(date2, DateTimeFormat.forPattern("dd-MM-yyyy"));
		Integer days = Days.daysBetween(gDate1, gDate2).getDays();
		return days;
		
	}

}




















