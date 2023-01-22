package volantine;



class Rectangle extends polygon{
	Double side1=1.0;
	Double side2=2.0;
	Rectangle(Double side1,Double side2){
		super(side1,side2,side1,side2);
		
	}
	
	
	public Double getArea() {
		return side1*side2;
	}
}