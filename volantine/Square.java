package volantine;


class Square extends polygon{
	
	Double side=1.0;
	Square(Double side){
		super(side,side,side,side);
	}
	@Override
	public Double getArea() {
		return side*side;
	}
	
}