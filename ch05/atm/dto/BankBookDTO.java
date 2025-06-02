package ch05.atm.dto;

public class BankBookDTO extends AccountDTO{
	
	private String owner = getOwner();
	private String ano = getAno();
	private String pw = getPw();
	private String[] output;
	private String[] input;
	private int transaction;
	//거래일시
}
