package ch02;

import java.util.Iterator;
import java.util.Scanner;

public class doWhileBreakOutterContinue {

	public static void main(String[] args) {
		Scanner inputString = new Scanner(System.in);
		//do-while
		System.out.println("메세지를 입력하세요.");
		System.out.println("프로그램을 종료하려면 quit을 입력하세요.");
		
		String chat;
		do {
			System.out.print(">>>");
			chat = inputString.nextLine();
			System.out.println("전송값 : " + chat);
		} while (!chat.equals("quit"));
		
		System.out.println("==============");
		System.out.println("프로그램 종료");
		System.out.println("==============");
		
		//break 라벨문
		for (char upper = 'A'; upper < 'Z'; upper++) {
			Outter : for (char lower = 'a'; lower < 'z'; lower++) {
				System.out.println(upper + "-" + lower);
				if (lower=='c') {
					break Outter;
				}//if (lower=='c)
			}//for(lower)
		}//for(upper)
		
		//continue문 (증감식 또는 조건식으로 이동)
		for (int i = 1; i <=10; i++) {
			if (i%2 != 0) {
				continue;
			}
			System.out.println(i);
		}//for(i)
	}//main
}//doWhileBreakContinue
//end