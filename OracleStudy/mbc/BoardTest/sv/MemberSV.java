package boardtest.sv;

import java.nio.channels.SelectableChannel;
import java.sql.SQLException;
import java.util.Scanner;

import boardtest.dao.MemberDAO;
import boardtest.dto.MemberDTO;

public class MemberSV {
	static Scanner scStr = new Scanner(System.in);
	static Scanner scLine = new Scanner(System.in);
	static Scanner scInt = new Scanner(System.in);
	static MemberDAO memberDAO = new MemberDAO();

	public static MemberDTO login(MemberDTO session) throws SQLException {
		System.out.println("아이디를 입력하세요");
		System.out.println(">>>");
		session.setId(scStr.next());
		System.out.println("비밀번호를 입력하세요");
		System.out.println(">>>");
		session.setPw(scStr.next());
		session = memberDAO.login(session);
		return session;
	}

	
	//userMenu method
	public static void userMenu(MemberDTO session) throws SQLException {
		System.out.println("==========회원용 회원 관리==========");
		boolean run = true;
		while (run) {
			String[] menu = {"1. 내 회원정보 조회", "2. 회원정보 수정", "3. 회원 비활성화", "4. 회원 관리 종료" };
			for (int i = 0; i < menu.length; i++) {
				System.out.println(menu[i]);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				
				break;
			case "2":
				update(session);
				break;
			case "3":
				memberDAO.accountLock(session);
				break;
			case "4":
				run = false;
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}//switch
		}//while
	}//userMenu method
	
	
	private static void update(MemberDTO session) {
		MemberDTO input = new MemberDTO();
		System.out.println("수정할 항목을 선택하세요.");
		String[] menu = {"1. 아이디&비밀번호 변경", "2. 닉네임 변경", "3. 전화번호 변경", "4. 회원정보 수정 종료"};
		for (int i = 0; i < menu.length; i++) {
			System.out.println(menu[i]);
		}
		System.out.print(">>>");
		String select = scStr.next();
		switch (select) {
		case "1":
			System.out.println("수정할 아이디를 입력하세요.");
			System.out.print(">>>");
			input.setId(scStr.next());
			System.out.println("수정할 비밀번호를 입력하세요.");
			System.out.print(">>>");
			input.setPw(scStr.next());
			
			break;
		case "2":
			
			break;
		case "3":
			
			break;
		case "4":
			
			break;
		default:
			break;
		}
	}


	//adminMenu method
	public static void adminMenu() throws SQLException {
		System.out.println("==============관리자용 회원관리=============");
		boolean run = true;
		while (run) {
			String[] menu = { "1. 회원가입", "2. 회원 리스트", "3. 회원 상세 조회", "4. 회원정보 수정", "5. 회원 탈퇴", "6. 회원 관리 종료" };
			for (int i = 0; i < menu.length; i++) {
				System.out.println(menu[i]);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				insert();
				break;
			case "2":
				memberDAO.readAll();
				break;
			case "3":

				// 게시글 목록과
				break;
			case "4":
				update();
				break;
			case "5":

				break;
			case "6":
				run = false;
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}
	}//adminMenu method

	
	//insert method
	public static void insert() {
		MemberDTO memberDTO = new MemberDTO();
		System.out.print("아이디: ");
		memberDTO.setId(scStr.next());
		System.out.print("비밀번호: ");
		memberDTO.setPw(scStr.next());
		System.out.print("닉네임: ");
		memberDTO.setNick(scStr.next());
		System.out.println("전화번호: ");
		memberDTO.setPhone(scStr.next());
		memberDAO.insert(memberDTO);
	}//insert method

	
	//update method
	private static void update() {
		boolean run = true;
		while (run) {
			System.out.println("수정할 항목을 선택해주세요.");
			String[] menu = { "1. 아이디", "2. 비밀번호", "3. 닉네임", "4. 전화번호", "5. 계정 활성화 여부" };
			String select = scStr.next();

		}

	}//update method

}
