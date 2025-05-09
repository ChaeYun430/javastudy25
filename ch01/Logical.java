package ch01;

import java.util.Iterator;
//외부 라이브러리 불러오기
import java.util.Scanner;

public class Logical {

	public static void main(String[] args) {

		// Scanner 객체 생성
		Scanner s = new Scanner(System.in);

		System.out.println("====");
		s.nextLine();
		System.out.println("====");

		// 아이디, 비밀번호 설정
		System.out.println("설정할 아이디를 입력하세요.");
		String loginid = s.nextLine();
		System.out.println("설정할 비밀번호를 입력하세요.");
		String loginpw = s.nextLine();
		System.out.println("비밀번호를 다시 한 번 입력하세요.");
		String pwTest = s.nextLine(
	
				);

		if (loginpw.equals(pwTest)) {

		} else {

			while (!(loginpw.equals(pwTest))) {
				System.out.println("비밀번호를 다시 한 번 입력하세요.");
				pwTest = s.nextLine(
						 
				);
			}
		}

		System.out.println("아이디와 비밀번호 설정이 완료되었습니다.");

		// 로그인
		System.out.println("로그인 하시려면 '로그인'을 입력해주세요");
		String loginb = "로그인";
		String login = s.nextLine();

		if (login.equals(loginb)) {

			System.out.println("아이디를 입력하세요.");
			String id = s.nextLine();
			System.out.println("비밀번호를 입력하세요.");
			String pw = s.nextLine();

			if (loginid.equals(id) && loginpw.equals(pw)) {
				System.out.println("로그인 되었습니다.");
			} else if (!(loginid.equals(id))) {
				
				System.out.println("입력하신 아이디가 존재하지 않습니다. 회원가입 하시겠습니까?");
				
			} else if (loginid.equals(id) && !(loginpw.equals(pw))) {

				while (loginid.equals(id) && !(loginpw.equals(pw))) {
				
					System.out.println("비밀번호를 다시 입력하세요.");
					pw = s.nextLine();
					
				}
				System.out.println("로그인이 완료되었습니다.");
			}
		} else {
			System.out.println("====================");
		}

	}
}
