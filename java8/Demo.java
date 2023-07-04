package java8;

import java.util.ArrayList;

public class Demo {
    public static void main(String[] args) {
        ArrayList al=new ArrayList<>();
        al.add("a");
        al.add("b");
        al.add("c");
        al.add("d");
        al.add("e");

        java.util.Iterator Itr=al.iterator();
        while(Itr.hasNext()){
            String s =(String)Itr.next();
            System.out.println(s);
            al.add("s");
        }
    }
}
