package array;

public class SumHundread {

	public static void main(String[] args) {
		int [] arr= {29,23,53,9,92,46,8};
	System.out.println("hello");
		int totalsum=100;
		int sum=0;
		for(int i=0;i<arr.length;i++) {
			sum = arr[i];
			for(int j=0;j<arr.length;j++ ) {
				if(j !=i) {
				sum +=arr[j];
				if(totalsum == sum) {
					System.out.println("indexes for sum 100 avialbel on"+ " "+ i + " and"+" " +j);
					return ;
				}else {
					sum -=arr[j];
					
				}
			}
		}

	}
	}

}
