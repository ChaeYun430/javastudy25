package ch04.studyClass;

import java.util.Scanner;

public class Gas {
	public int gas;
	public int MAXGAS = 100;
	public int cash=100000;
	public int speed;
	
	
	public boolean checkState(int gas) {
		if (gas>10) {
			System.out.println("안전 운행 하세요.");
			return true;
		}else if (0<gas && gas<10) {
			System.out.println("연료를 충전해주세요.");
			return false;
		}else {
			System.out.println("차량 운행 종료");
			return false;
		}
	}
	
	public int inputGas(int gas){
		Scanner scInt = new Scanner(System.in);
		
		System.out.println("주유를 원하는 연료의 금액을 입력해주세요.");
		
		System.out.println();
		
	}
	
	public boolean run(int gas) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("1. 엑셀 | 2. 브레이크");
		System.out.print(">>>");
		int key = scInt.nextInt();
		switch (key) {
		case 1:
			speed++;
			gas-=2;
			break;
		case 2:
			speed--;
			gas--;
			break;
		default:
			System.out.println("오류가 발생했습니다. 안전을 위해 운행을 종료합니다.");
			break;
		}
	}
}
