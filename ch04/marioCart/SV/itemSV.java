package ch04.marioCart.SV;

import java.sql.Time;
import java.util.Calendar;
import java.util.Scanner;
import java.util.Timer;

import ch04.marioCart.ItemDTO;

public class itemSV {
	
	
	public ItemDTO getItem(ItemDTO[] itemDTOs) {
		System.out.println("======아이템 선택=====");
		String[] itemNums = {" 1 ", " 2 ", " 3 ", " 4 ", " 5 "};
		
		return itemDTOs[(int)(Math.random()*5)];
	}
	
	public ItemDTO assign(ItemDTO[] itemDTOs) {
		return itemDTOs[(int)(Math.random()*5)];
	}
	

	
}
