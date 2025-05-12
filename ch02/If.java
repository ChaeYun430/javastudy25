package ch02;

import java.util.Scanner;

public class If {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		// if
		System.out.println("당신의 나이를 입력하세요.");
		int age = s.nextInt();
		
		if (age >= 18) {
			System.out.println("당신의 나이는 18세 이상입니다.");
			System.out.println("당신은 투표할 자격이 있습니다.");
		}
		
		System.out.println("========================");
		//if 중괄호 제거
		System.out.println("if문에서 중괄호를 빼면 어떻게 될까요??");
		String answer = s.nextLine();
		String result = "첫 번째 행만 실행";
		
		if (result == answer) 
			System.out.println("정답!!!");
			System.out.println("나는 언제나 출력되지.");
			
		System.out.println("========================");	
		//if~else(짝홀 구분)
		System.out.println("하나의 자연수를 입력하세요.");
		int value = s.nextInt();
		
		if (value % 2 == 1) {
			System.out.println("입력하신 값은 홀수입니다.");
		}else {
			System.out.println("입력하신 값은 짝수입니다.");
		}
		
		System.out.println("========================");
		//삼항 연산자와 유사
		System.out.println("하나의 자연수를 입력하세요.");
		int a = s.nextInt();
		String b = a % 13 == 0?"13의 배수입니다.":"13의 배수가 아닙니다.";
		System.out.print("입력하신 값은 " + b);
		
		System.out.println("========================");
		//if~else if (점수에 따라 학점 부여하기)
		System.out.println("점수를 입력하세요.");
		double score = s.nextDouble();
		System.out.print("당신의 학점은 : ");
		
		if (score <=100 && score >= 0) {
			if (score >= 90) { //선제조건이 참이면 밑은 무시됨.
				System.out.println("A");
			} else if (score >= 80) { //자동으로 위의 조건에 대한 여사건 적용
				System.out.println("B");
			} else if (score >= 70) {
				System.out.println("C");
			} else if (score >= 60) {
				System.out.println("D");
			} else {
				System.out.println("F");
			} 
		}else {
			System.out.println("점수를 잘못 입력하셨습니다.");
		}
		
		System.out.println("========================");
		//중첩 if~else문(세 수의 대소 비교)
		System.out.println("서로 다른 세 수를 입력해주세요.");
		int x = s.nextInt();
		int y = s.nextInt();
		int z = s.nextInt();
		
		if (x > y) {
			if (y > z) {
				System.out.println("x > y > z");
			}else if (x > z) {
				System.out.println("x > z > y");
			}else {
				System.out.println("z > x > y");
			}
		}else {
			if (x > z) {
				System.out.println("y > x > z");
			}else if (y > z) {
				System.out.println("y > z > x");
			}else {
				System.out.println("z > y > x");
			}
		}
		
		System.out.println("========================");
		//
		
		
	}

}
