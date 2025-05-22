package ch02;

import java.util.Scanner;

public class SwitchIfChaeYun {
	
	public static void main(String[] args) {
		
		//주민등록번호를 이용한 성별 판단

		Scanner s = new Scanner(System.in);
		System.out.println("주민 등록 번호를 입력하세요.");
		String num = s.nextLine();
		if (num.charAt(6) == '-') {
			switch (num.charAt(7)) {
			case '1':
			case '3':
			case '5':
			case '7':
				System.out.println("남성");
				break;
			case '2':
			case '4':
			case '6':
			case '8':
				System.out.println("여성");
				break;
			default:
				System.out.println("그 외");
			}
		} else {

			switch (num.charAt(6)) {
			case '1':
			case '3':
			case '5':
			case '7':
				System.out.println("남성");
				break;
			case '2':
			case '4':
			case '6':
			case '8':
				System.out.println("여성");
				break;
			default:
				System.out.println("분류되지 않았습니다. 다시 입력해 주시길 바랍니다.");
			}
		}//주민등록번호를 이용한 성별 판단
	}
}//end