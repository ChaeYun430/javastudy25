package ch05.town;

import java.util.Scanner;

import ch05.town.SV.AccountSV;
import ch05.town.SV.MemberSV;
import ch05.town.dto.AccountDTO;
import ch05.town.dto.BankDTO;
import ch05.town.dto.MemberDTO;
import ch05.town.dto.WoribankDTO;

public class atmExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	private static AccountDTO[] accountDTOs; // 사용할 계좌 배열 받는 용도
	static {
		
	}

	public static void main(String[] args) {
		MemberDTO mem0 = new MemberDTO("A", "1234561234567", null );
	
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
				System.out.println("========우리 은행========");
				accountDTOs = WoribankDTO.accountDTOs;
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
			//계좌 배열 선택 완료
			boolean run1 = true;
			while (run1) {
				
				System.out.println("======== ATM==========");
				String[] mainMenu = { "0. 계좌 생성/삭제", "1. 예금 출금", "2. 예금 조회", "3. 송금/계좌이체 ", "4. 입금", "5. 통장정리", "6.부가서비스", "7. 메인화면으로 이동" };
				for (int i = 0; i < mainMenu.length; i++) {
					System.out.println(mainMenu[i]);
				}
				System.out.print(">>>");
				select = scStr.next();
				switch (select) {
				case "0":
					AccountSV.create(scInt, scStr, mem0, accountDTOs);
					break;
				case "1":
					AccountSV.withdraw(scInt, scStr, mem0, accountDTOs);
					break;
				case "2":
					AccountSV.accountList(scInt, scStr, mem0, accountDTOs);
					break;
				case "3":
					AccountSV.transfer(scInt, scStr, mem0, accountDTOs);
					break;
				case "4":
					AccountSV.deposit(scInt, scStr, mem0, accountDTOs);
					break;
				case "5":
					AccountSV.accountList(scInt, scStr, mem0, accountDTOs);
					break;
				case "6":
					
					break;
				case "7":
					System.out.println("메인 화면으로 돌아갑니다. ");
					run1 = false;
				default:
					System.out.println("이전 메뉴로 돌아갑니다. ");
				}// switch
			} // while
		}
	}// main method

}
