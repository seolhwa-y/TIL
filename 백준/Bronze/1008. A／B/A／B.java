import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
        
		double A = in.nextDouble(); // 나누기 하면 소수점으로 나옴
		double B = in.nextDouble();
		
		System.out.println(A / B);
 
		in.close();
	}
}