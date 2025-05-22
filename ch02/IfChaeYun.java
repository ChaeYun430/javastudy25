package ch02;

import java.util.Scanner;

public class IfChaeYun {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		// if
		System.out.println("당신의 나이를 입력하세요.");
		int age = s.nextInt();

		if (age >= 18) {
			System.out.println("당신의 나이는 만 18세 이상입니다.");
			System.out.println("당신은 투표할 자격이 있습니다.");
		}

		System.out.println("========================");
		// if 중괄호 제거
		System.out.println("if문에서 중괄호를 빼면 어떻게 될까요??");
		System.out.println("과연 첫 번째 행만 실행 될까요?");
		System.out.println("Yes/No로 답해주세요.");

		String answer = s.next();
		if (answer.equalsIgnoreCase("Yes")) //문자열의 내용 검증(대소문자 구분 안함)

			System.out.println("정답!!!");
		System.out.println("나는 언제나 출력되지.");

		System.out.println("========================");
		// if~else(짝홀 구분)
		System.out.println("하나의 자연수를 입력하세요.");
		int value = s.nextInt();

		if (value % 2 == 1) {
			System.out.println("입력하신 값은 홀수입니다.");
		} else {
			System.out.println("입력하신 값은 짝수입니다.");
		}

		System.out.println("========================");
		// 삼항 연산자와 유사한 if~else(배수인지 확인하기)
		System.out.println("하나의 자연수를 입력하세요.");
		int a = s.nextInt();
		System.out.println("어떤 수의 배수인지 확인해 보시겠습니까??");
		int b = s.nextInt();
		String c = a % b == 0 ? b + "의 배수입니다." : b + "의 배수가 아닙니다.";
		System.out.println(a + " 는 " + c);

		System.out.println("========================");
		// if~else if (점수에 따라 학점 부여하기)
		System.out.println("점수를 입력하세요.");
		double score = 101;
		while (!(score <= 100 && score >= 0)) {
			score = s.nextDouble();
			if (score <= 100 && score >= 0) {
				System.out.print("당신의 학점은 : ");
				if (score >= 90) { // 선제조건이 참이면 밑은 무시됨.
					System.out.println("A");
				} else if (score >= 80) { // 자동으로 위의 조건에 대한 여사건 적용
					System.out.println("B");
				} else if (score >= 70) {
					System.out.println("C");
				} else if (score >= 60) {
					System.out.println("D");
				} else {
					System.out.println("F");
				}
			} else {
				System.out.println("점수를 올바른 범위 내에서 다시 입력해주세요.");
			}
		}
		System.out.println("========================");
		// 중첩 if~else문(세 수의 대소 비교)
		System.out.println("서로 다른 세 수를 입력해주세요.");
		int x = s.nextInt();
		int y = s.nextInt();
		int z = s.nextInt();

		if (x > y) {
			if (y > z) {
				System.out.println(x + ">" + y + ">" + z);
			} else if (x > z) {
				System.out.println(x + ">" + z + ">" + y);
			} else {
				System.out.println(z + ">" + x + ">" + y);
			}
		} else {
			if (x > z) {
				System.out.println(y + ">" + x + ">" + z);
			} else if (y > z) {
				System.out.println(y + ">" + z + ">" + x);
			} else {
				System.out.println(z + ">" + y + ">" + x);
			}
		}

		System.out.println("========================");
		// 주사위 게임
		int num1 = (int) (Math.random()) * 6 + 1;
		int num2 = (int) (Math.random()) * 6 + 1;
		System.out.println("주사위1의 값: " + num1);
		System.out.println("주사위2의 값: " + num2);
		if (num1 == num2) {
			System.out.println("한 번 더~");
			int num3 = (int)(Math.random())* 6 + 1;
			int num4 = (int)(Math.random())* 6 + 1;
			System.out.println("주사위1의 값: " + num3);
			System.out.println("주사위2의 값: " + num4);

			if (num3 == num4) {
				System.out.println("한 번 더~");
				int num5 = (int) (Math.random()) * 6 + 1;
				int num6 = (int) (Math.random()) * 6 + 1;
				System.out.println("주사위1의 값: " + num5);
				System.out.println("주사위2의 값: " + num6);
				System.out.println("주사위 값의 합은 " + (num1 + num2 + num3 + num4 + num5 + num6) + "입니다.");

			} else {

				System.out.println("주사위 값의 합은 " + (num1 + num2 + num3 + num4) + "입니다.");

			}
		} else {

			System.out.println("주사위 값의 합은 " + (num1 + num2) + "입니다.");

		}

		System.out.println("========================");
		// 로또 프로그램
		int myluck1 = (int) (Math.random() * 45 ) + 1;
		int myluck2 = (int) (Math.random() * 45 ) + 1;
		int myluck3 = (int) (Math.random() * 45 ) + 1;		
		int myluck4 = (int) (Math.random() * 45 ) + 1;
		int myluck5 = (int) (Math.random() * 45 ) + 1;
		int myluck6 = (int) (Math.random() * 45 ) + 1;
		
		int luck1 = (int) (Math.random() * 45 ) + 1;
		int luck2 = (int) (Math.random() * 45 ) + 1;
		int luck3 = (int) (Math.random() * 45 ) + 1;
		int luck4 = (int) (Math.random() * 45 ) + 1;
		int luck5 = (int) (Math.random() * 45 ) + 1;
		int luck6 = (int) (Math.random() * 45 ) + 1;
	}
}//ing