package geeksForGeeks;

public class MaxAccurance {
	
	public static char maximumAccurance(String str) {
		int max=0;
		str.toLowerCase();
		String apperingNo;
		char result=' ';
		
		
		 final int size=256;
		 
		int [] count= new int [size];
		 for(int i=0;i<str.length();i++) {
			 count[str.charAt(i)]++;
//			 System.out.println("Added to array");
		 }
		 
		 for(int i=0;i<str.length();i++) {
			 if(max<count[str.charAt(i)]) {
				 max=count[str.charAt(i)];
				
				 System.out.println(result);
			 }
		 }
		return result;
	} 

	public static void main(String[] args) {
		String str="Kiran Uttam Kondawar";
		System.out.println( "max accurance of any char is"+ " "+maximumAccurance(str));

	}

}
