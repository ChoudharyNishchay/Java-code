package geeksForGeeks;
import java.util.Scanner;
public class Palindrome {
public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.println("Enter string");
		String inp = sc.next();
		StringBuilder sb = new StringBuilder();
		StringBuilder sb1 = new StringBuilder();
		String oup = "";

			sb.append(inp);
			sb.reverse();
			String op = sb.toString();
			if(inp.equals(op)) {
				System.out.println(inp);
			}else {
				sb1.append(inp.substring(0,(inp.length() / 2) + 1));
				sb1.reverse();
				//System.out.println("Input String " + sb);
				oup = inp + sb1.toString();
				System.out.println("Output String : "+ oup);
			}
		
	}

}