package ch02;

import java.util.Iterator;
import java.util.Scanner;

public class GradeProgressChaeYun {

	public static void main(String[] args) {

		//main을 최소화!!!
		// 홈페이지메뉴
		// 0. 관리자
		// 회원관리
		// 게시판 이용
		// 1. 교사권한
		// 성적입력 보기 수정
		// 게시판 이용
		// 2. 학생권한
		// 성적 열람
		Scanner inputStr = new Scanner(System.in);
		Scanner inputInt = new Scanner(System.in);
		Scanner inputChar = new Scanner(System.in);
		
		int count = 0;
		String name = null, birth = null;
		String[]login = new String[count];  
		String id = null, inputid = null;
		String pw = null, inputpw = null;
		String email = null, phone = null;

		boolean run1 = true, run2 = true;
		int key;
		int Class = 14;
		
		System.out.println("======관리자 메뉴=======");
		System.out.println("학생 관리");//2차원 배열 기본 무시
		
		
		System.out.println("============성적 입력하기=========");
		System.out.println("학년을 선택해주세요.");
		int grade = inputInt.nextInt();
		System.out.println("학급을 선택해주세요.");
		Class = inputInt.nextInt();
		System.out.println("국어 성적을 입력해줏[");
		for (int i = 0; i < args.length; i++) {
			
		}
		
		
		
		System.out.println("학생을 선택해주세요.");
		
		System.out.println("============성적 열람하기=========");
		System.out.println("1. 전체 석차");
		System.out.println("2. 과목별 석차");
		System.out.println("3. 학급별 석차");
		ranking
		grade[i++]
		
		
		switch (key) {
		case 1:
			
			break;

		default:
			break;
		}
		System.out.println("응시생 수를 입력하세요");

		while (run1) {

			System.out.println("==================성적 처리 프로그램==================");
			System.out.println("1. 교직원 로그인");
			System.out.println("2. 학생 로그인");
			key = inputInt.nextInt();

			while (run2) {
				if (key == 1) {
					System.out.println("0. 인증서 로그인");
				}
				System.out.println("1. 간편 로그인");
				System.out.println("2. 아이디/비밀번호 로그인");
				System.out.println("3. 회원가입");
				boolean login = login();
			} // while(run2):login

		} // while(run1)
	}//main method

	static boolean login() {
		switch (key) {
		case 0:
			System.out.println("아이디: ");
			inputid = inputStr.next();
			boolean certi = certi(id, inputid);
			if (certi == true) {
				System.out.println("로그인 되었습니다.");
			} else {
				System.out.println("로그인에 실패하였습니다.");
				continue;
			}
			break;

		case 1:
			System.out.println("전화번호: ");

		case 2:
			boolean loginOK = idlogin();
			if (loginOK == true) {
				System.out.println("로그인 되었습니다.");
			} else {
				System.out.println("로그인에 실패하였습니다.");
				continue;
			}
			break;

		case 3:
			boolean member = membership(name, birth, email, id, pw);

			break;
		}// switch (key)

		break;
	}return false;

	static boolean membership(String name, String birth, String email, String id, String pw, int key) {

		Scanner inputStr = new Scanner(System.in);
		String pwcerti;
		System.out.print("성함: ");
		name = inputStr.nextLine();
		System.out.print("주민등록번호 앞 7자리: ");
		birth = inputStr.nextLine();
		System.out.print("이메일: ");
		email = inputStr.nextLine();
		
		switch (key) {
		case 1:
			System.out.println("1. 인증서 등록");
			System.out.println("2. 인증서 미등록");
			switch (key) {
			case 1:

				break;
			case 2:

				break;
			}
		

		System.out.print("새 아이디: ");
		id = inputStr.nextLine();
		do {
			System.out.print("새 비밀번호: ");
			pw = inputStr.nextLine();
			// 비밀번호 조건 달기
			System.out.print("비밀번호 확인: ");
			pwcerti = inputStr.next();
			if (pw != pwcerti) {
				System.out.println("입력하신 비밀번호와 일치하지 않습니다.\n다시 입력해주세요. ");
			}
		} while (pw != pwcerti);
		System.out.println("회원가입이 완료되었습니다.");
		return true;
	}// membership method

	static boolean certi(String id, String inputid) {

		return true;

	}// certi method

	static boolean idlogin() {
		System.out.print("아이디: ");
		inputid = inputStr.nextLine();
		System.out.print("비밀번호: ");
		inputpw = inputStr.nextLine();
		if (condition) {

		}
	}

	static boolean simple(int key, String email) {
		System.out.println("간편인증 수단을 선택해주세요.");

		System.out.print("전화번호 : ");

		// 연결???
		System.out.println("1. 토스");
		System.out.println("2. 카카오톡");
		switch (key) {
		case 1:

			break;

		default:
			break;
		}
		return true;
	}// simple method

}// class
