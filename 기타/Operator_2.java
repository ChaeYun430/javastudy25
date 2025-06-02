import java.util.Scanner;

public class Operator_2 {

	public static void main(String[] args) {
		System.out.println("자연수를 입력하세요.");

		Scanner s = new Scanner(System.in);

		int i1 = s.nextInt();
		int i2 = i1 % 2;

		if (i2 == 1) {
			System.out.println("입력한 값은 홀수입니다.");
		} else {
			System.out.println("입력한 값은 짝수입니다.");
		} // 조건문과 출력만 변형


	}
}
