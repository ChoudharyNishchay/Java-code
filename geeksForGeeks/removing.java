

package geeksForGeeks;


import java.util.regex.*;


public class removing {
	
	public static String  removeUpperCaseString(String str) {
		String regex="[A-Z]";
		// compile regex to find pattern
		Pattern pattern= Pattern.compile(regex);
		System.out.println(pattern);
		//Get matcher object from pattern
		Matcher matcher = pattern.matcher(str);
		System.out.println(matcher);
		return matcher.replaceAll("");
	}

	public static void main(String[] args) {
		String str="KOndawarKira5354";
		System.out.println(removeUpperCaseString(str));

	}

}
