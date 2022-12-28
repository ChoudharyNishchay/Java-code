package geeksForGeeks;
import java.util.*;


public class LongestSubString {
	private static String longestSub(String str) {
		HashSet<Character> set=new HashSet<>();
		
		
		String longestTillNow="";
		String longestOverall="";
		
		
    for(int i=0;i<str.length();i++) {
    	char c=str.charAt(i);
    	
    	if(set.contains(c)) {
    		longestTillNow="";
    		set.clear();
    	}
    	set.add(c);
    	longestTillNow +=c;
    	
    	if(longestTillNow.length()>longestOverall.length()) {
    		longestOverall=longestTillNow;
    	}
    	
    	
    }
		return longestOverall;
	}

	public static void main(String[] args) {
		String str="abcdab";
		
		System.out.print(longestSub(str));

	}

}
