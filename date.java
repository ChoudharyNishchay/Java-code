

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class date {

 public static void main(String []args){
	 Scanner sc = new Scanner(System.in);
	 int day,month,year;

	String sb;
	 day=sc.nextInt();
	 month=sc.nextInt();
	 year=sc.nextInt();
	 sb=day+"/"+month+"/"+year;
	 

 String inputDate = sb;

 String inputFormat = "dd/MM/yyyy";
 

 SimpleDateFormat dateFormat = new SimpleDateFormat(inputFormat);
 Date date = null;
 try {
  date = dateFormat.parse(inputDate);
 } catch (ParseException e) {
  e.printStackTrace();
 }

 Calendar calendar = Calendar.getInstance();
 calendar.setTime(date);
 int weekNumber = calendar.get(Calendar.WEEK_OF_YEAR);

 System.out.println(weekNumber);
 }
}