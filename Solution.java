
public class Solution {
	
	public static int solution(int [] A) {
		int ans=1000;
		
		for(int i=0;i<A.length;i++) {
			if(ans>A[i])
				ans=A[i];
			
		}
		return ans;
	}

	public static void main(String[] args) {
		int A[]= {5,9,4,3,-2,-8};
		System.out.println(solution(A));

	}

}
