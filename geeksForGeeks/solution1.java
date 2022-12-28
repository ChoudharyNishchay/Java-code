package geeksForGeeks;

import java.util.*;

public class solution1 {

	static void characterCount(String inputString) {

		HashMap<Character, Integer> charCountMap = new HashMap<Character, Integer>();

		char[] strArray = inputString.toCharArray();

		for (char c : strArray) {
			if (charCountMap.containsKey(c)) {

				charCountMap.put(c, charCountMap.get(c) + 1);
			} else {

				charCountMap.put(c, 1);
			}
		}

		String res = "";
		for (int i = 0; i < strArray.length; i++) {
			if (charCountMap.get(strArray[i]) == 1) {
				res += strArray[i];
			}
		}
		System.out.println("Output string :"+res);
	}

	public static void main(String[] args) {
		String str = "abbcdeeef";
		System.out.println("Input string :" +str);
		characterCount(str);
	}
}