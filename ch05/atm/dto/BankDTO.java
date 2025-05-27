package ch05.atm.dto;

public class BankDTO {
	private AccountDTO[] woriAccountDTOs = new AccountDTO[10];
	
	public void manageAccounts(AccountDTO account) {
		for (int i = 0; i < woriAccountDTOs.length; i++) {
			if (woriAccountDTOs[i] == null) {
				for (int j = i; j < woriAccountDTOs.length-i; j++) {
					woriAccountDTOs[i] = woriAccountDTOs[i+1];
				}
			}
		}
	}
	public void insertAccounts(AccountDTO account) {
		if (condition) {
			
		}
	}
}
