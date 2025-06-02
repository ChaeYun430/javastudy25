package ch05.atm;

import java.util.Scanner;

import ch05.atm.dto.AccountDTO;
import ch05.atm.dto.MemberDTO;
import ch05.atm.dto.WoribankDTO;
import ch05.atm.sv.AccountSV;

public class AtmExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static MemberDTO[] mems = new MemberDTO[10]; //고객님//등록된 국민
	public static AccountDTO[] accountDTOs;//운용할 은행의 계좌
	static {
		MemberDTO mem0 = new MemberDTO("A", "1234561234567");
		MemberDTO mem1 = new MemberDTO("B", "2345671234567");
		MemberDTO mem2 = new MemberDTO("C", "3456781234567");
		MemberDTO mem3 = new MemberDTO("D", "4567891234567");
		mems[0] = mem0;
		mems[1] = mem1;
		mems[2] = mem2;
		mems[3] = mem3;
		
	}

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
			// 계좌 배열 선택 완료
			boolean run1 = true;
			while (run1) {

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
					AccountSV.open(scInt, scStr, mems, accountDTOs);
					break;
				case "1":
					AccountSV.withdraw(scInt, scStr, mems, accountDTOs);
					break;
				case "2":
					AccountSV.accountList(scInt, scStr, mems, accountDTOs);
					break;
				case "3":
					AccountSV.transfer(scInt, scStr, mems, accountDTOs);
					break;
				case "4":
					AccountSV.deposit(scInt, scStr, mems, accountDTOs);
					break;
				case "5":
					AccountSV.accountList(scInt, scStr, mems, accountDTOs);
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
