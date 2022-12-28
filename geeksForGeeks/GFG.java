package geeksForGeeks;


import java.io.*;
import java.util.*;
class GFG { 
	static final int constX = 3 ;
	static class Application {
		int startTime; int endTime;
		int resourceID; Application( int startTime, int endTime, int resourceID) 
		{ 
			this .startTime = startTime; this .endTime = endTime; this .resourceID = resourceID; 
			}
		} 
	static int maxApplications(Application[] applications)
	{ Arrays.sort(applications, new Comparator<Application>() 
	{ public int compare(Application a1, Application a2) 
	{ return a1.startTime - a2.startTime; } }); 
	int maxApplications = 0 ; int currentApplications = 0 ;
	PriorityQueue<Application> queue = new PriorityQueue<Application> 
	( new Comparator<Application>() { public int compare(Application a1, Application a2)
	{ return a1.endTime - a2.endTime; } }); for (Application application : applications) 
	{ if (!queue.isEmpty() && queue.peek().resourceID == application.resourceID && queue.peek().endTime <= application.startTime) 
	{ queue.poll(); } if (queue.size() < constX) { queue.add(application); currentApplications++; 
	maxApplications = Math.max(maxApplications, currentApplications); } else { currentApplications--; } 
	} return maxApplications; }
	public static void main(String[] args) 
	{ int num = 6 ;
	Application[] applications = new Application[num]; applications[ 0 ] = new Application( 1200 , 1250 , 1 ); 
	applications[ 1 ] = new Application( 1210 , 1220 , 1 ); applications[ 2 ] = new Application( 1225 , 1230 , 1 ); 
	applications[ 3 ] = new Application( 1330 , 1345 , 2 ); applications[ 4 ] = new Application( 1330 , 1340 , 2 );
	applications[ 5 ] = new Application( 1340 , 1345 , 2 ); System.out.println(maxApplications(applications)); } }