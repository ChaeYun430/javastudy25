package ch02;

import java.util.Scanner;

public class UpAndDownGame {

	public static void main(String[] args) {
		
		Scanner inputInt = new Scanner(System.in);
		Scanner inputString = new Scanner(System.in);
		
		int que = (int)(Math.random()*31)+1;
		int input;
		int hits = 1;
		
		System.out.println("Up&Down 게임을 시작하겠습니다.");
		System.out.println("3회 안에 맞추시면 상품을 드립니다.");
		System.out.println("게임에 대한 자세한 설명이 필요하시다면 '도움말'을 입력해주세요");
		String help = inputString.next();
		if (help.equals("도움말")) {
			System.out.println("랜덤으로 지정된 숫자를 맞추는 게임입니다.");
			System.out.println("입력해주신 수가 정답보다 작으면 'UP'을");
			System.out.println("입력해주신 수가 정답보다 크면 'DOWN'을");
			System.out.println("외쳐드리오니 이를 참고하여 정답을 맞춰주시면 됩니다.");
		}
		do {
			System.out.println("1~31 사이의 자연수를 입력해주세요");
			System.out.print(hits + "번째 입력>>>");
			input = inputInt.nextInt();
			hits++;
			if (input>que) {
				System.out.println("DOWN");
			}else if (input<que) {
				System.out.println("UP");
			}
		} while (input!=que);
		System.out.println("정답입니다.");
		
		if (hits<=3) {
			System.out.println("3회 이내에 성공하셔서 상품을 획득하셨습니다.");
			System.out.println("전화번호를 남겨주시면 관리자가 연락드리겠습니다.");
			String phone = inputString.next();
		}else {
			System.out.println("아쉽지만 입력횟수가 3회를 초과하여 상품획득에 실패하셨습니다.");
			System.out.println("즐거운 시간 되셨기를 바랍니다.");
		}
		System.out.println("게임이 종료되었습니다.");
	}
}
//end
