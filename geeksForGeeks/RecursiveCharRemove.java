package geeksForGeeks;

public class RecursiveCharRemove {


	
	    public String removeDuplicates(String string) {
	        if (string == null) {
	            return null;
	        }
	        char[] chars = string.toCharArray();
	        char previous = ' ';
	        int i = 0;
	        for (char c: chars) {
	            if (c != previous) {
	                chars[i++] = c;
	                previous = c;
	            }
	        }
	        return new String(chars).substring(0, i);
	    }
	    public static void main(String[] args) {
	    	RecursiveCharRemove adj = new RecursiveCharRemove();
	        String string1 = "aabaarbarccrabmq";
	       // String string2 = "marry";
	        System.out.println(adj.removeDuplicates(string1));
	        //System.out.println(adj.removeDuplicates(string2));
	    }
	}
