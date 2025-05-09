package ch01;

import java.util.Scanner;

public class LogicalAnd_Or {

	public static void main(String[] args) {

		Scanner s = new Scanner(System.in);

		// 논리곱(유니코드 표에서 영문 대소문자, 숫자 찾기)
		System.out.println("수를 입력하시면 유니코드표를 이용하여 영문자와 숫자를 찾아드리겠습니다. ");

		// 논리합(2의 배수 또는 3의 배수인지 판단하기)
		System.out.println("2의 배수 또는 3의 배수를 찾아 볼까요??");
		System.out.print("수를 입력하세요. : ");
		int value = s.nextInt();

		if ((value % 2 ==0) || (value % 3 ==0) ) {
			System.out.println("");
		}else {
			System.out.println("");
			
		}

	}

}
