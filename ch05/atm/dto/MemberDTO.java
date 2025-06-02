package ch05.atm.dto;

import java.util.Scanner;

import ch05.atm.dto.MoneyDTO;

public class MemberDTO {
	private String name;
	private String mno;
	private MoneyDTO moneyDTO;
	//private BodyDTO component;
	//private ThingsDTO	Posession;
	
	public MemberDTO() {
	
	}

	public MemberDTO(String name, String mno) {
	this.name = name;
	this.mno = mno;
	this.moneyDTO = new MoneyDTO();
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

	@Override
	public String toString() {
		return "MemberDTO [name=" + name + ", mno=" + mno + "]";
	}
	
	
}