package volantine;


public class Tester {

	public static void main(String[] args) {
		polygon p= new Rectangle(5.0,6.0);
		
		  p = new Square(5.0);
		        
		       Double rectangleArea =  p.getArea();
		       Double squareArea  = p.getArea();
		       System.out.println(rectangleArea);
		       System.out.println(squareArea);
	}

}