import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
        
		int a = sc.nextInt();
		StringBuffer sb = new StringBuffer();
		
        for(int i = 0; i < a; i++) {
        	for(int ii = 0; ii < i +1; ii++) {
        		sb.append("*");
        	}
        	sb.append("\n");
        }
        
		System.out.println(sb.toString());
 
		sc.close();
	}
}