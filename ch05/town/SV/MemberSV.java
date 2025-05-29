package ch05.town.SV;

import java.util.Scanner;

import ch04.marioCart.dto.mapDTO;
import ch05.town.dto.CashDTO;
import ch05.town.dto.MemberDTO;
import ch05.town.dto.MoneyDTO;

public class MemberSV {
	private String name;
	private String mno;
	private MoneyDTO moneyDTO;
	public MemberDTO[] memberDTOs = new MemberDTO[10];
	

	static {
		MemberDTO mem0 = new MemberDTO("A", "1234561234567", null );
		MemberDTO mem1 = new MemberDTO("B", "2234561234567", null );
		MemberDTO mem2 = new MemberDTO("C", "3234561234567", null );
		MemberDTO mem3 = new MemberDTO("D", "4234561234567", null );
	}
	public MemberSV() {

	}


	
	
}
