package ch05.atm;

import java.util.Scanner;

import ch05.atm.dto.AccountDTO;
import ch05.atm.dto.BankDTO;
import ch05.member.MemberSV;

public class atmExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static AccountDTO[] accountDTs;

	static {
		// 테스트용 가상 인물정보
		MemberSV member0 = new MemberSV();
		//새로운 클래스 지정하기 싫은 기본값들
		AccountDTO[] woriAccounts = new AccountDTO[100];
	}

	// 실물 통장/카드
	// 비번 입력
	// if 인증완료
	// 메뉴 실행
	public static void main(String[] args) {

		boolean run0 = true;
		while (run0) {
			System.out.println("======== ATM==========");
			System.out.println("거래를 원하시는 은행을 선택해주세요.");
			String[] bankMenus = { "1. 우리은행", "2. 하나은행", "3. 신한은행", "4. 농협은행" };
			for (int i = 0; i < bankMenus.length; i++) {
				System.out.println(bankMenus[i]);
			}
			
			String select = scStr.next();
			switch (select) {
			case "1":
				
				break;
			case "2":

				break;
			case "3":

				break;
			case "4":

				break;
			default:
				System.out.println("다시 선택해주세요.");
			}

			boolean run1 = true;
			while (run1) {
				MemberSV member = new MemberSV();

				System.out.println("======== ATM==========");
				String[] mainMenu = { "0. 계좌 생성/삭제", "1. 예금 출금", "2. 예금 조회", "3. 송금/계좌이체 ", "4. 입금", "5. 통장정리",
						"6.부가서비스", "7. 메인화면으로 이동" };
				for (int i = 0; i < mainMenu.length; i++) {
					System.out.println(mainMenu[i]);
				}
				System.out.print(">>>");
				select = scStr.next();
				switch (select) {
				case "0":

					break;
				case "1":
					System.out.println("=========예금 출금===========");

					break;
				case "2":

					break;
				case "3":

					break;
				case "4":

					break;
				case "5":

					break;
				case "6":
					System.out.println("메인 화면으로 돌아갑니다. ");
					run1 = false;
				default:
					System.out.println("이전 메뉴로 돌아갑니다. ");
				}// switch
			} // while
		}
	}// main method

}
