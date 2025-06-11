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
	
	
	
	
	public static MemberDTO login(){
		
	}
	
	public static void menu() throws SQLException {
		System.out.println("==============회원관리=============");
		boolean run3 = true;
		while (run3) {
			String[] menu = {"1. 회원가입", "2. 회원 리스트", "3. 회원 상세 조회", "4. 회원정보 수정",  "5. 회원 탈퇴", "6. 회원 관리 종료"};
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
				searchOne
				//게시글 목록과 
				break;
			case "4":
				update();
				break;
			case "5":
				
				break;
			case "6":
				
				break;
			case "7":
				run3 = false;
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
			}
	}
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
	}
	
	private static void update() {
		boolean run = true;
		while (run) {
			System.out.println("수정할 항목을 선택해주세요.");
			String[] menu = {"1. 아이디", "2. 비밀번호", "3. 닉네임", "4. 전화번호", "5. 계정 활성화 여부"};
			String select = scStr.next();
			
		}
		
	}
	
	
}
