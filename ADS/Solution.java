package ADS;

//public class MiddleLinkedList {
//
//	public static void main(String[] args) {
//		
//
//	}
//
//}
class Solution{
	public:
		ListNode middleNode(ListNode head){
		ListNode hare,tortoise;
		hare=tortoise=head;
		while(hare && hare.next) {
			hare=hare.next.next;
			tortoise=tortoise.next;
		}
	}
}