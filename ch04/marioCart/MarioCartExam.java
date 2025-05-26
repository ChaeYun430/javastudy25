package ch04.marioCart;

import java.util.Calendar;
import java.util.Scanner;

import ch04.marioCart.SV.MemberSV;
import ch04.marioCart.dto.MemberDTO;

public class MarioCartExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static MemberDTO[] memberDTOs = new MemberDTO[999];
	public static ItemDTO itemDTO;
	public static Seesion loginState;

	static {
		// 게스트 용 기본값
		memberDTOs[0] = new MemberDTO(0, null, null, null, "guest");
	}//static 

	public static void main(String[] args) {
		boolean run1 = true;
		while (run1) {
	
			System.out.println("<마리오 카트>에 오신 것을 환영합니다.");
			System.out.println("1. guest | 2. user | 3. 시스템 종료");
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				System.out.println("게임 진행기록이 저장되지 않습니다.");
				System.out.println("계속하시겠습니까?");
				System.out.println("1. 예 | 2. 아니오");
			



				
				//게스트와 사용자의 구분을 어디에?? 설정
				MemberSV.memberMenu(scInt, scStr, memberDTOs);
				break;
			case "2":
				MemberSV.memberMenu(scInt, scStr, memberDTOs);
				break;
			case "3":
				System.out.println("시스템을 종료합니다.");
				run1 = false;
			case "99":
				System.out.println("cheat control");
				break;
			case "999":
				System.out.println("관리자로 입장");
				break;
			default:
				System.out.println("잘못 입력하셨습니다.");
				System.out.println("처음으로 돌아갑니다.");
			}//switch
		}//while
	}//main method
}
