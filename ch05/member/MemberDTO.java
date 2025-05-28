package ch05.member;

import java.util.Scanner;

import ch05.member.money.MoneyDTO;

public class MemberDTO {
	private String name;
	private String mno;
	private MoneyDTO moneyDTO;
	//private BodyDTO component;
	//private ThingsDTO	Posession;
	
	public MemberDTO() {
	
	}

	public MemberDTO(String name, String mno, MoneyDTO money) {
	this.name = name;
	this.mno = mno;
	this.moneyDTO = money;
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

	public void setMoneyDTO() {
		
		this.moneyDTO = moneyDTO;
	}
	
	
	
}
