package ch05.member;

import java.util.Scanner;

import ch04.marioCart.dto.mapDTO;
import ch05.member.money.CashDTO;
import ch05.member.money.MoneyDTO;

public class MemberSV {
	private String name;
	private String mno;
	private MoneyDTO moneyDTO;

	
	public MemberSV(Scanner scInt, Scanner scStr) {
		name = scStr.next();
		mno = scStr.next();
	}
	public MemberSV() {
		name = "이채윤";
		mno = "1234561234567";
		moneyDTO.cashDTO.cash50000 = 10;
		moneyDTO.cashDTO.cash10000= 20;
		moneyDTO.cashDTO.cash5000= 30;
		moneyDTO.cashDTO.cash1000 = 40;
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMno() {
		return mno;
	}

	public void setMno(String mno) {
		this.mno = mno;
	}

	public MoneyDTO getMoneyDTO() {
		return moneyDTO;
	}

	public void setMoneyDTO(CashDTO cashDTO) {
		
		this.moneyDTO = moneyDTO;
	}
	
	
	
}
