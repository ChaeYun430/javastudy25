package ch02;

import java.util.Scanner;

public class CarRunTest {

	public static void main(String[] args) {
		//<자동차 주행 프로그램>
		//시동/계기판 정보 출력/주행/시동off
		Scanner inputInt = new Scanner(System.in);
		boolean run = true;
		int speed = 0;
		final int MAXSPEED = 300;
		final int MINSPEED = 0;
		
		System.out.println("람보르기니가 입고 되었습니다.");
		System.out.println("시동을 켭니다.");
		System.out.println("현재 속도 : " + speed + "km/h");
		
		while (run) {
			System.out.println("=========================");
			System.out.println("0. 시동종료");
			System.out.println("1. 엑셀");
			System.out.println("2. 브레이크");
			System.out.println("3. 멀티미디어");
			System.out.println("4. 주유하기");
			System.out.println("=========================");
			System.out.print("(0~4숫자 입력)>>>>");
			
			int select = inputInt.nextInt();
			
			switch (select) {
			case 0:
				System.out.println("시동을 종료합니다.");
				run = false;
				break;
			
			case 1:
				System.out.println("가속을 진행합니다.");
				speed+=30;
				if (speed>=MAXSPEED) {
					speed = MAXSPEED;
				}
				System.out.println("현재 속도 : " + speed + "km/h");
				break;
			
			case 2:
				System.out.println("감속을 진행합니다.");
				speed-=30;
				if (speed<=0) {
					speed = 0;
				}
				System.out.println("현재 속도 : " + speed + "km/h");
				break;
			
			case 3:
				System.out.println("멀티미디어를 진행합니다.");
				break;
				
			case 4:
				System.out.println("주유를 진행합니다.");
				break;
				
			default:
				System.out.println("0~4 사이의 수를 입력해주세요.");
			}//switch (select)
		}//while (run)
		System.out.println("람보르기니 자동차가 사라집니다.");
	}//main
}//class CaeRunTest
//end