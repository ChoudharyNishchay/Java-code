package java8;//Stream API:-Process the data in terms of changing values,filter values

import java.util.Arrays;
import java.util.List;

public class Practice1 {
    public static void main(String[] args) {
        List<Integer> nums = Arrays.asList(2, 5, 3, 1, 9);

//         Stream<Integer> data = nums.stream();//parallel stream-huge amount of data
//        Stream<Integer>mapeddata= data.map(n ->n*2);
//        mapeddata.forEach(n -> System.out.println(n));

//        Predicate<Integer> predi = new Predicate<Integer>() {
//            @Override
//            public boolean test(Integer n) {
//                if(n%2==1)
//                    return true;
//                else
//                return false;
//            }
//        };   --- by output is .filter(predi)

       int result = nums.parallelStream()   //firstly  stream()
//               .filter(predi)
               .filter(n ->n%2==1)  //we got only odd value
//               .sorted()
               .map(n ->n*2)
//               .forEach(n -> System.out.println(n));
               .reduce(0,(c,e)->c+e);
        System.out.println(result);



        //        data.forEach(n -> System.out.println(n)); ----on a given int


//        long count = data.count();
//        System.out.println(count);----counting

//        Stream<Integer>sortedData = data.sorted();
//        sortedData.forEach(n -> System.out.println(n)); //Data Sorting

//        for(int n:nums){
//            System.out.println(n*2);
//
//        }



//        for (int i = 0; i < 5; i++) {
//            System.out.println(nums.get(i));
//        }
//        for(int n : nums){
//            System.out.println(n);
//        }
    }

}
