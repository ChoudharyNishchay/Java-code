package geeksForGeeks;
import java.util.Scanner;
public class sol2 {
public static int getDays(int n){
    int i =1;
    int count =1;
    while (i<n){
        i *= 2;
        count++;
    }
    return count;
}

public static void main(String[] args){
Scanner sc = new Scanner(System.in);
    int n = sc.nextInt();
    System.out.println(getDays(n));
    sc.close();
}
}