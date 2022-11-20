package Test;

import java.util.Scanner;

public class max_min {
	public static void main(String[] args) {
		// 문제 1 : 사용자로부터 숫자를 입력 받아 해당 숫자들의 최대, 최소 값을 제외한 합을 구하는 알고리즘을 서술하시오.
	    Scanner sc = new Scanner(System.in);
	    
	    // 몇 개의 숫자를 입력할지 받기!
	    System.out.println("몇개의 숫자를 입력하실 건가요?");
	    int count = sc.nextInt();
	    int[] num = new int[count];
	    
	    // 입력받은 숫자들을 배열에 저장한다.
	    for(int i = 0; i < num.length; i++){
	        System.out.print("num [" + i + "] = ");
	        num[i] = sc.nextInt();
	    }
	    sc.close();
	    
	    // 최대값 최소값 찾기
	    int max = num[0], min = num[0], sum = 0;
	    
	    for(int i = 0; i < num.length; i++) {
	        if(max < num[i]) max = num[i];
	        if(min > num[i]) min = num[i];
	    }
	    
	    
	    // 최대 최소 제외한 값 더하기.
	    for(int i = 0; i < num.length; i++) {
	        if(max != num[i] && min != num[i]) sum += num[i];
	    }
	    
	    System.out.println("합계 = " + sum);
	}

}
