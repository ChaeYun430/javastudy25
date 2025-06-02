package ch05.atm.dto;

import java.util.Arrays;
import java.util.Scanner;

import ch05.atm.dto.MemberDTO;
import ch05.atm.sv.MemberSV;
import ch05.atm.dto.CardDTO;

public class AccountDTO {

	private String owner;
	private String ano;
	private String pw;
	private int[] limits = new int[2]; // [0]: 1회 출금 //[1]: 1회 이체 //배열로 만든 이유는 null값을 위함
	private int balance;
	private BankBookDTO bankBookDTO;// 리스트 출력 뿐만 아니라 거래 내역 저장하는 용도
	private CardDTO cardDTO;
	//거래일시
	//생성일시
	//입금처
	//출금처
	//거래 금액
	
	//신규 계좌
	public AccountDTO() {
		this.cardDTO = new CardDTO();
	}

	//기존 계좌
	//테스트용
	public AccountDTO(String owner, String ano, String pw, int withdraw, int transfer, int balance) {
		this.owner = owner;
		this.ano = ano;
		this.pw = pw;
		this.limits[0] = withdraw;
		this.limits[1] = transfer;
		this.balance = balance;
		this.cardDTO = new CardDTO();
	}

	// ano
	public String getAno() {// 계좌 보기의 용이함을 위해
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
			// 중복확인 코드 추가 필요
			this.ano = ano;
			return true;
		} else {
			System.out.println("게좌번호 13자리를 입력해주세요.");
			System.out.println("이전 메뉴로 돌아갑니다.");
			return false;
		}
	}

	// owner
	public String getOwner() {
		return owner + "님";
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	// pw
	public String getPw() {// 입력값과 비교용도
		return pw;
	}

	public boolean setPw(Scanner scStr, String pw) {
		if (pw.length() == 4) {
			System.out.println("비밀번호 확인: ");
			String input = scStr.next();
			if (pw.equals(input)) {
				this.pw = pw;
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

	// limit
	public int[] getLimit() {
		return limits;
	}

	public void setLimit(int withdraw, int transfer) { // 매개값의 수가 다른 메소드 처리 방법: int... limits
		this.limits[0] = withdraw;
		this.limits[1] = transfer;
	}

	
	//bankBookDTO
	public BankBookDTO getBankBookDTO() {
		return bankBookDTO;
	}

	public void setBankBookDTO() {
		BankBookDTO bb = new BankBookDTO();

		this.bankBookDTO
	}

	// balance
		public int getBalance() {
			return balance;
		}

		public void setBalance(int balance) {
			this.balance = balance;
		}
		
	//cardDTO
	public CardDTO getCardDTO() {
		return cardDTO;
	}

	public void setCardDTO(CardDTO cardDTO) {
		this.cardDTO = cardDTO;
	}

	@Override
	public String toString() {
		return "AccountDTO [owner=" + owner + ", ano=" + ano + ", pw=" + pw + ", limit=" + Arrays.toString(limit)
				+ ", balance=" + balance + "]";
	}

	// 시간: 시점이 객체 형성인지 컴파일인지 출력인지 리턴인지 파악



}
