package java8;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class Work {
    public static void main(String[] args) {
        //create a list and filter all even no. from list?
        List<Integer> list1 = List.of(2,4,50,21,22,67);
        List<Integer> list2 = new ArrayList<>();
        list2.add(13);
        list2.add(56);
        list2.add(45);
        list2.add(16);
        list2.add(22);

        List<Integer> list3= Arrays.asList(23,444,45,34,44);  //This three ways to create to list

        List<Integer> ListEven=new ArrayList<>(); //..for using for loop
        for(Integer i:list1){
            if(i%2==0){
                ListEven.add(i);
            }
        }       //...this way to looping (hardcore)

        //for using stream

        Stream<Integer> stream =list1.stream();
        List<Integer>newList= stream.filter(i->i%2==0).collect(Collectors.toList());
        System.out.println(newList);

//        List<Integer>newList1= stream.filter(i->i%2==0).collect(Collectors.toList());
//        System.out.println(newList1);

        List<Integer>newList2=list1.stream().filter(i->i>10).collect(Collectors.toList());
        System.out.println(newList2);


//        System.out.println(list1);
//        System.out.println(ListEven);


    }
}
