import java.util.Scanner;
 
public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		
		int year = in.nextInt();
		in.close();
        
        // 윤년이면 1, 아니면 0
		System.out.print((year % 4 == 0)? ((year % 400 == 0)? "1" : ((year % 100) == 0)? "0" : "1") : "0");
	}
}