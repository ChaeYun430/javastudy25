package ch05.atm.dto;

import java.util.Date;
import java.util.Scanner;

import ch05.member.MemberDTO;
import ch05.member.MemberSV;
import ch05.member.money.CardDTO;

public class AccountDTO {

	private String owner;
	private String ano;
	private String pw;
	private Date date;
	private int[] limit;  //[0]: 1회 출금 //[1]: 1회 이체
	private int balance;
	private BankBookDTO[] bankBookDTO; // 리스트 출력 뿐만 아니라 거래 내역 저장하는 용도
	private CardDTO cardDTO;
	
	public BankBookDTO[] getBankBookDTO() {
		return bankBookDTO;
	}

	public void setBankBookDTO(BankBookDTO[] bankBookDTO) {
		this.bankBookDTO = bankBookDTO;
	}

	

	public CardDTO getCardDTO() {
		return cardDTO;
	}

	public void setCardDTO(CardDTO cardDTO) {
		this.cardDTO = cardDTO;
	}

	//limit
	public int[] getLimit() {
		return limit;
	}

	public void setLimit(int...limits) { //매개값의 수가 다른 메소드 처리 방법 
		this.limit = limits;
	}


	public void setDate(Date date) {
		this.date = date;
	}


	//owner
	public String getOwner() {
		return owner + "님";
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	//date
	public String getDate() {
		return date.getYear() + "년 " + date.getMonth() + "월 " + date.getDate() + "일";
	}

	public void setDate() {
		this.date = new Date();
	}
	// 시점이 객체 형성인지 컴파일인지 출력인지 리턴인지 파악

	// ano
	public String getAno() {
		String anoShow = null;
		for (int i = 0; i < 6; i++) {
			anoShow += ano.charAt(i);
		}
		anoShow += "-";
		for (int i = 6; i < ano.length(); i++) {
			anoShow += ano.charAt(i);
		}
		return anoShow;
	}

	public boolean setAno(String ano) {
		if (ano.length() == 13) {
			// 중복확이 코드
			this.ano = ano;
			return true;
		} else {
			System.out.println("게좌번호 13자리를 입력해주세요.");
			System.out.println("이전 메뉴로 돌아갑니다.");
			return false;
		}
	}

	// pw

	public String getPw() {
		return pw;
	}

	public boolean setPw(Scanner scStr, String pw) {
		if (pw.length() == 4) {
			this.pw = pw;
			System.out.println("비밀번호 확인: ");
			String input = scStr.next();
			if (pw.equals(input)) {
				System.out.println("비밀번호 설정이 완료되었습니다.");
				return true;
			} else {
				System.out.println("설정하신 비밀번호와 일치하지 않습니다.");
				System.out.println("이전 메뉴로 돌아갑니다.");
				return false;
			}
		} else {
			System.out.println("비밀번호 4자리를 입력해주세요.");
			System.out.println("이전 메뉴로 돌아갑니다.");
			return false;
		}
	}

	//balance
	public int getBalance() {
		return balance ;
	}
	
	public void setBalance(int balance) {
		this.balance = balance;
	}

	
	}


