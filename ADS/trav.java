package ADS;

import java.util.ArrayList;

import org.w3c.dom.Node;

public class trav {
	ArrayList<E> <Integer> list=new ArrayList<Integer>();
	
	public static  trav(Node node) {
		while(node.next!=null) {
			if((node.data%2)==0) {
				list.add(node.data);
			}
			node=node.getNext;
		}
		System.out.println(list);
	}

	public static void main(String[] args) {
		

	}

}
