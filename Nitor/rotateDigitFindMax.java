package Nitor;

public class rotateDigitFindMax {

	


 
 public static void rotateNoFindMax(int a,int b,int c){
     
     String n1=a+"";
     String n2=b+"";
     String n3=c+"";
     
     char t1=n1.charAt(3);
     String x=t1+n1.substring(0,3);
     String y=n2.substring(2,4)+n2.substring(0,2);
     String z=n3.substring(1,4)+n2.substring(0,1);
     
     int a1=Integer.parseInt(x);
     int b1=Integer.parseInt(y);
     int c1=Integer.parseInt(z);
     
     if(a1>b1&&a1>c1) {
    	 System.out.println("first"+a1);
     }else if(b1>c1) {
    	 System.out.println("Second"+b1);
     }else {
    	 System.out.println("Third"+c1);
     }
     
     
     
     
 }
 public static void main(String[] args) {
 
 int a=1234;
 int b=3456;int c=6789;
 
 rotateNoFindMax(a,b,c);
 }
}