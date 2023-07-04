package java8;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class StreamObject {
    public static void main(String[] args) {
        //stream API - collection process
        //collection -group of object

        //1- blank
        Stream<Object> emptyStream = Stream.empty();
        //-array or object,collection then use stream
        String names[] = {"Nishchay", "anuj", "vishal", "sagar"};

        Stream<String> stream1 = Stream.of(names);
        stream1.forEach(e -> {
            System.out.println(e);
        });

        // Builder pattern
        Stream<Object> streambuilder = Stream.builder().build();

        //suppose aple kn integer hai so arrays use kr stream
        IntStream stream = Arrays.stream(new int[]{2, 4, 23, 43, 23});
        stream.forEach(e -> {
            System.out.println(e);
        });

        //collection object list set raha to directly call kr skte hai
        List<Integer> list2 = new ArrayList<>();
        list2.add(13);
        list2.add(56);
        list2.add(45);
        list2.add(16);

        Stream<Integer> stream2 =list2.stream();
        stream2.forEach(e->{
            System.out.println(e);
        });
    }
}
