package ch05.atm.dto;

import ch05.atm.dto.AccountDTO;

public class MoneyDTO {
	public CashDTO cashDTO;
	public AccountDTO[] accountDTOs;
	

	public CashDTO input(CashDTO cashDTO, int plus50000, int plus10000) {
		cashDTO.cash50000 += plus50000;
		cashDTO.cash10000 += plus10000;
		return cashDTO;
	}
}