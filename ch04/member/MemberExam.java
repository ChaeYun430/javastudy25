package ch04.member;

import java.util.Scanner;

public class MemberExam {

	public static void main(String[] args) {

		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);
		System.out.println("몇 명의 회원을 등록하시겠습니까?");
		int count = scInt.nextInt();
		String[][] member = new String[3][count];
		MemberGrade[] grade = MemberGrade.values();
		for (int i = 0; i < count; i++) {
			System.out.print("name: ");
			member[0][i] = scStr.nextLine();
			System.out.print("id: ");
			member[1][i] = scStr.nextLine();
			System.out.print("pw: ");
			member[2][i] = scStr.nextLine();
			System.out.println("========회원모드======");
			for (int j = 0; j < grade.length; j++) {
				System.out.println((j + 1) + ". " + grade[j]);
			}//for(출력용)

			boolean run1;
			do {
				run1 = false;
				System.out.print("회원모드 선택: ");
				int select = scInt.nextInt();
				switch (select) {
				case 1 -> grade[i] = MemberGrade.GEUST;
				case 2 -> grade[i] = MemberGrade.USER;
				case 3 -> grade[i] = MemberGrade.MANAGER;
				case 4 -> grade[i] = MemberGrade.ADMIN;
				default -> run1 = true;
				}
			} while (run1);

			System.out.println(member[0][i] + "님 " + grade[i] + "로 회원가입이 완료되었습니다.");
		}
		for (int i = 0; i < count; i++) {
			System.out.println("===========" + member[0][i] + "님 정보==========");
			System.out.println("id: " + member[1][i] + "  pw: " + member[2][i] + "  회원모드: " + grade[i]);
		}//for(출력용)
	}//main method
}//class
