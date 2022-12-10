import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
        
		int a = sc.nextInt();
		StringBuffer sb = new StringBuffer();
		
        for(int i = 1; i < a + 1; i++) {
        	for(int ii = a; ii > 0; ii--) {
        		if(i < ii) {
        			sb.append(" ");
        		} else {
        			sb.append("*");
        		}
        	}
        	sb.append("\n");
        }
        
		System.out.println(sb.toString());
 
		sc.close();
	}
}