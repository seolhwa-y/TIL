import java.util.Scanner;

public class Main {
	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
        
        while(in.hasNext()){ // 다음 줄이 없을 떄 까지
            int A = in.nextInt();
		    int B = in.nextInt();
            
            System.out.println(A + B);
        }
        
        in.close();
	}
}