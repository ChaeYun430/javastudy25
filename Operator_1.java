import java.util.Scanner;

public class Operator_1 {

	public static void main(String[] args) {
		System.out.println("자연수를 입력하세요.");
		
		Scanner s = new Scanner(System.in);
		
		int i1 = s.nextInt();
		int i2 = i1 % 2;
		String x = (i2 == 1) ? "홀수" : "짝수";
		
		System.out.println("입력한 값은 " + x + "입니다.");

	}

}
