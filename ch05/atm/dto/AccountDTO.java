package ch05.atm.dto;


import java.util.Date;

import ch05.member.MemberDTO;
import ch05.member.MemberSV;

public class AccountDTO {
	
	private String ano;
	private String pw;
	private Date date;
	private MemberDTO member;
	private int balance;
	private BankDTO bankDTO;
	private RecordDTO recordDTO;
	private BankBookDTO bankBookDTO;
	//개인에게 귀속되어 있는 정보들을 어떻게.......
	//계좌-은행명, 개인, 계좌 번호
	//구성요소의 상하관계를 보자
	
	public String getDate() {
		return date.getYear() + "년 " + date.getMonth() + "월 " + date.getDate() + "일";
	}
	public void setDate() {
		this.date = new Date();
	}
	//시점이 객체 형성인지 컴파일인지 출력인지 리턴인지 파악
	
	public String getPw() {
		
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getAno() {
		return ano;
	}
	public void setAno(String ano) {
		this.ano = ano;
	}
	public MemberDTO getMember() {
		return member;
	}
	public void setMember(MemberDTO member) {
		this.member = member;
	}
	
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balabnce) {
		this.balance = balance;
		
	}
	public BankDTO getBankDTO() {
		return bankDTO;
	}
	public void setBankDTO(BankDTO bankDTO) {
		this.bankDTO = bankDTO;
	}
	public RecordDTO getRecordDTO() {
		return recordDTO;
	}
	public void setRecordDTO(RecordDTO recordDTO) {
		this.recordDTO = recordDTO;
	}
	public BankBookDTO getBankBookDTO() {
		return bankBookDTO;
	}
	public void setBankBookDTO(BankBookDTO bankBookDTO) {
		this.bankBookDTO = bankBookDTO;
	}
	
	
}
