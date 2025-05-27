package ch05.atm.SV;

import java.util.Iterator;
import java.util.Scanner;

import ch05.atm.dto.AccountDTO;
import ch05.member.MemberDTO;

public class AccountSV {
	

	public AccountDTO create(Scanner scInt,Scanner scStr, MemberDTO mem) {

		AccountDTO account = new AccountDTO();
		authorize();// 개인정보... 로 본인확인.......
		
		boolean run3 = true;
		while (run3){
		System.out.print("계좌번호: ");
		account.setAno(scStr.next());
		System.out.print("비밀번호: ");
		account.setPw(scStr.next());
		System.out.print("비밀번호 확인: ");
		String input = scStr.next();
		if((input.equals(account.getpw()))){
		System.out.println("비밀번호 설정이 완료 되었습니다.");
		}else{
		System.out.println("설정하신 비밀번호와 일치하지 않습니다.");
		System.out.println("계좌 생성 처음으로 돌아갑니다.");
		break;
		}
		
		
		System.out.print("계좌번호: ");
		account.setDate();
		
		Sysstem.out.println(mem.getname()+"의 계좌 생성이 완료 되었습니다.");


		if (ano != 13) {
			System.out.println("계좌번호 13자리를 알맞게 입력해주세요.");
			return null;
		}
		//중복 확인은 db 필요한데...가상으로 만들기??

		
		
		
		
	
	}//create method

	
	private void identify() {
	
		
	}


	
	public	void withdraw(Scanner scInt,Scanner scStr, MemberDTO mem, AccountDTO account) {
		System.out.println("===============예금 출금============");
		System.out.println("통장 또는 카드를 넣어주세요.");
		boolean validity = false;
		for (int i = 0; i < array.length; i++) {
			
		}
		if (account.getBankBookDTO().equals(account)) {
			
		}else {
			System.out.println("유효하지 않은 거래입니다.");
		}
	}
	
	public AccountDTO deposit(Scanner scInt,Scanner scStr, MemberDTO mem, AccountDTO account) {
		System.out.println("===========입금 메뉴=========");
		
		System.out.println("입금을 원하시는 금액을 만 원 단위로 입력해주세요.");
		System.out.print(">>>");
		int input = scInt.nextInt()*10000;
		System.out.println("1. 5만원: " + input/5 + "장 | 1만원: " + input%5 + "장");
		System.out.println("2. 1만원: " + input + "장");
		System.out.println("투입할 지폐의 유형을 선택해 주세요.");
		System.out.print(">>>");
		String select = scStr.next();
		switch (select) {
		case "1":
			mem.getMoneyDTO().cashDTO.cash10000 -= input;
			account.setBalance(account.getBalance()+input*10000);
			System.out.println("입금이 완료되었습니다.");
			System.out.print("계좌 잔액: ");
			System.out.println(account.getBalance());
			break;
		case "2":
			member.getMoneyDTO().cashDTO.cash10000 -= input;
			if (member.getMoneyDTO().cashDTO.cash10000 < 0) {
				System.out.println("금액이 일치하지 않습니다. ");
				member.getMoneyDTO().cashDTO.cash10000 += input;
			}
			account.setBalance(account.getBalance()+input*10000);
			System.out.println("입금이 완료되었습니다.");
			System.out.print("계좌 잔액: ");
			System.out.println(account.getBalance());
			break;
		default:
			System.out.println("");
		}
		
		member.getMoneyDTO().cashDTO.cash10000-1;
	}




		public AccountDTO findAccount(AccountDTO[] accounts, AccountDTO account) {
		
		for(int i = 0; i < 
		return account
	}//findAccount method



	public MemberDTO authorize(Scanner scInt,Scanner scStr, AccountDTO myaccount) {
		
		System.out.println("계좌 비밀번호를 입력해 주세요.");
		System.out.print(">>>");
		String input = scStr.next();
		if (myaccount.getPw().equals(input)) {
			return 
		}
		return 
			}//authorize method

}
