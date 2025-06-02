package ch05.atm.sv;

import java.util.Iterator;
import java.util.Scanner;

import ch05.atm.dto.AccountDTO;
import ch05.atm.dto.MemberDTO;
import ch05.atm.sv.MemberSV;

public class AccountSV {

	//open method
	public static void open(Scanner scInt, Scanner scStr, MemberDTO[] mems, AccountDTO[] accounts) {
		System.out.println("============계좌생성===============");
		
		//본인 인증
		System.out.print("성함: ");
		String name = scStr.next();
		System.out.print("주민번호: ");
		String mno = scStr.next();
		MemberDTO mem = identify(name, mno, mems);
		if (mem == null) {
			System.out.println("본인 인증에 실패하였습니다.");
			System.out.println("이전 메뉴로 돌아갑니다.");
		}
		
		AccountDTO account = new AccountDTO(); // 객체를 만들고 값을 넣는 방식
		
		//계좌번호, 비밀번호 설정
		boolean run2 = true;
		while (run2) {
			System.out.print("계좌번호: ");
			account.setAno(scStr.next());
			System.out.print("비밀번호: ");
			boolean pwTF = account.setPw(scStr, scStr.next());
			if (pwTF == false) {
				continue;
			}
			
		//한도 설정
			boolean run3 = true;
			while (run3) {
				System.out.println("1회 출금&이체 한도를 설정하시겠습니까?");
				System.out.println("1. 예 | 2. 아니오");
				System.out.print(">>>");
				String select = scStr.next();
				switch (select) {
				case "1":
					System.out.print("1회 출금 한도:");
					int withdraw = scInt.nextInt();
					System.out.print("1회 이체 한도:");
					int transfer = scInt.nextInt();
					account.setLimit(withdraw, transfer);
					System.out.println("한도 설정이 완료되었습니다.");
					run3 = false;
				case "2":
					run3 = false;
				default:
					System.out.println("다시 입력해주세요.");
				}
			}
			
			//초기입금액, 생성날짜
			System.out.print("입금액: ");
			account.setBalance(scInt.nextInt());

//생성날짜 입력 필요
			
			System.out.println("통장이 생성되었습니다."); 
			//set 통장
			
			//은행계좌 연결
			for (int i = 0; i < accounts.length; i++) {
				if (accounts[i] == null) {
					accounts[i] = account;
					break;
				}
			}
			System.out.println(account.getOwner() + "의 계좌 생성이 완료 되었습니다.");
		}
	}// open method

	//identify method
	private static MemberDTO identify(String name, String mno, MemberDTO[] mems) { //신원 확인용 메서드
		
		for (int i = 0; i < mems.length; i++) {
			if (mems[i].getName() == name && mems[i].getMno() == mno) {
				return mems[i];
			}
		}
		return null;
	}// identify method

	//withdraw method
	public static void withdraw(Scanner scInt, Scanner scStr, MemberDTO[] mems, AccountDTO[] accounts) {
		System.out.println("===============예금 출금============");
		AccountDTO account = findAccount(mems, accounts);
		if (account == null) {
			return;
		}
		if (authorize(scInt, scStr, account) == false) {
			return;
		}
		
		boolean run6 = true;
		while (run6) {
			System.out.println("출금하실 금액을 만 원 단위로 입력해주세요.");
			System.out.print(">>>");
			int output = scInt.nextInt() * 10000;
			if (account.getBalance() < output * 10000) {
				System.out.println("잔액이 부족합니다.");
			return;
			}
			System.out.println("1. 5만원: " + output / 5 + "장 | 1만원: " + output % 5 + "장");
			System.out.println("2. 1만원: " + output + "장");
			System.out.println("원하시는 지폐의 유형을 선택해 주세요.");
			String select = scStr.next();
			switch (select) {
			case "1":
				account.setBalance(account.getBalance() - output * 10000);
				mems.getMoneyDTO().cashDTO.cash10000 += output / 5;
				mems.getMoneyDTO().cashDTO.cash10000 += output % 5;
				System.out.println("출금이 완료되었습니다.");
				System.out.print("계좌 잔액: ");
				System.out.println(account.getBalance() + "원");
				run6 = false;
			case "2":
				account.setBalance(account.getBalance() - output * 10000);
				mems.getMoneyDTO().cashDTO.cash10000 += output;
				System.out.println("출금이 완료되었습니다.");
				System.out.print("계좌 잔액: ");
				System.out.println(account.getBalance() + "원");
				run6 = false;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}
	}//withdraw method
	
	// findAccount method
	private static AccountDTO findAccount(MemberDTO[] mems, AccountDTO[] accounts) {
		System.out.println("통장 또는 카드를 넣어주세요.");
		for (int i = 0; i < accounts.length; i++) {
			if (mems.getMoneyDTO().accountDTO.getBankBookDTO().equals(accounts[i].getBankBookDTO())) {
				return accounts[i];
			}else if (mems.getMoneyDTO().accountDTO.getBankBookDTO().equals(accounts[i].getCardDTO())) {
				return accounts[i];
			}
		}
		return null;
	}// findAccount method
	
	// authorize method
	public static boolean authorize(Scanner scInt, Scanner scStr, AccountDTO myaccount) {
		System.out.println("계좌 비밀번호를 입력해 주세요.");
		System.out.print(">>>");
		String input = scStr.next();
		if (myaccount.getPw().equals(input)) {
			return true;
		}
		return false;
	}// authorize method

	public static void accountList(Scanner scInt, Scanner scStr, MemberDTO[] mems, AccountDTO[] accounts) {
		AccountDTO account = findAccount(mems, accounts);
		if (account == null) {
			return;
		}
		if (authorize(scInt, scStr, account) == false) {
			return;
		}
		for (int i = 0; i < account.getBankBookDTO().length; i++) {
			System.out.println(account.getBankBookDTO()[i]);
			if (account.getBankBookDTO()[i] == null) {
				break;
			}
		}
	}
	
	//transfer method
	public static void transfer(Scanner scInt, Scanner scStr, MemberDTO[] mems, AccountDTO[] accountDTOs) {
		// TODO Auto-generated method stub
		
	}//transfer method
	
	//deposit method
	public static void deposit(Scanner scInt,Scanner scStr, MemberDTO[] mems, AccountDTO[] accounts) {
		System.out.println("===========입금 메뉴=========");
		AccountDTO account = findAccount(mems, accounts);
		if (account == null) {
			return;
		}
		System.out.println("입금을 원하시는 금액을 만 원 단위로 입력해주세요.");
		System.out.print(">>>");
		int input = scInt.nextInt()*10000;
		if (mems.getMoneyDTO().cashDTO.cash10000 < input*10000) {
			System.out.println("금액이 일치하지 않습니다. ");
			mems.getMoneyDTO().cashDTO.cash10000 += input;
			return;
		}
		System.out.println("1. 5만원: " + input/5 + "장 | 1만원: " + input%5 + "장");
		System.out.println("2. 1만원: " + input + "장");
		System.out.println("투입할 지폐의 유형을 선택해 주세요.");
		System.out.print(">>>");
		String select = scStr.next();
		switch (select) {
		case "1":
			mems.getMoneyDTO().cashDTO.cash10000 -= input/5;
			mems.getMoneyDTO().cashDTO.cash10000 -= input%5;
			account.setBalance(account.getBalance()+input*10000);
			System.out.println("입금이 완료되었습니다.");
			System.out.print("계좌 잔액: ");
			System.out.println(account.getBalance());
			break;
		case "2":
			mems.getMoneyDTO().cashDTO.cash10000 -= input;
			account.setBalance(account.getBalance()+input*10000);
			System.out.println("입금이 완료되었습니다.");
			System.out.print("계좌 잔액: ");
			System.out.println(account.getBalance());
			break;
		default:
			System.out.println("이전 메뉴로 돌아갑니다.");
			return;
		}
	}//deposit method







