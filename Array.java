
public class Array {
	public static void rotate(int [] arr1,int d,int n) {
		
		int[] temp= new int[n];
		
		int k=0;
		for(int i=d; i<n;i++) {
			temp[k]=arr1[i];
			k++;
		}
		
		for(int i=0; i<d;i++) {
			temp[k]=arr1[i];
			k++;
		}
		
		for(int i=0;i<n;i++) {
			System.out.println(temp[i]);
		}
	}

	public static void main(String[] args) {
		int []  arr= {1,3,5,7,8,6,4};
		int d=6;
		
		rotate(arr,d,arr.length);

	}

}
