package ch02;

import java.util.Scanner;

public class CalculatorChaeYun {

	public static void main(String[] args) {

		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);

		int x1, x3;
		String x2, x4;
		boolean run1 = true, run2 = true; // 반복지점 지정 가능 //true break는 포함관계 잘 봐야함
		int result = 0;

		while (run1) {
			System.out.println("========정수 계산기=======");
			System.out.println("숫자를 입력하세요");
			x1 = scInt.nextInt();
			boolean rangex1 = range(x1);
			if (rangex1 == true) {
				System.out.println("연산자를 입력하세요");
				x2 = scStr.next();

				while (run2) {
					System.out.println("숫자를 입력하세요");
					x3 = scInt.nextInt();
					boolean rangex3 = range(x3);

					if (rangex3 == true) {
						result = calcu(x1, x2, x3);
						boolean rangere = range(result); // 입력값 바꿔가며 함수 여러 번 사용 가능

						if (rangere == true) {
							System.out.println("연산 결과 : " + result);
							System.out.println("계산기를 계속 사용하시겠습니까?");
							x4 = scStr.next();
							if (x4.equals("+") || x4.equals("-") || x4.equals("*") || x4.equals("/")) {
								x1 = result;
								x2 = x4;
							} else if (x4.equalsIgnoreCase("yes")) {
								run2 = false;
							} else {
								System.out.println("정수계산기를 종료합니다.");
								run2 = false;
								run1 = false;
								break;
							}
						}else {
							System.out.println("본 계산기 연산값의 범위를 넘어갔습니다. 처음으로 돌아갑니다.");
							run2 = false;
						}
					} else {
						System.out.println("본 계산기 연산값의 범위를 넘어갔습니다. 처음으로 돌아갑니다.");
						run2 = false;
					} // if(rangex3)

				}

			}else {
				System.out.println("본 계산기 연산값의 범위를 넘어갔습니다. 처음으로 돌아갑니다.");
				run2 = false;
			}
		}

	}

	static boolean range(int result) {
		boolean range;
		if (result <= Integer.MAX_VALUE && result >= Integer.MIN_VALUE) {
			range = true;
		} else {
			range = false;
		}
		return range;
	}

	static int calcu/* 메서드명 */(int x1, String x2, int x3) {
		int result = 0;
		switch (x2) {
		case "+" -> result = x1 + x3;
		case "-" -> result = x1 - x3;
		case "*" -> result = x1 * x3;
		case "/" -> result = x1 / x3;
		}
		return result/* 반환값 */;
	}

}
//end?