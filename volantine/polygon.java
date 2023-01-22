package volantine;
import java.util.*;
public class polygon {


	List<Double> sides= new ArrayList<>();
	
	polygon(Double ...side){
		for(Double s:sides)
		{
			sides.add(s);
		}
	}
	
	public List<Double> getSides(){
		return sides;
	}
	
	public Double getArea() {
		Double area=0.0;
		for(Double s:sides)
		{
			area+=s;
		}
		return area;
	}
}