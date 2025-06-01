package ch05.Tire;

import java.util.Scanner;

public class CarExam {
	
	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	
	public static void main(String[] args) {
		Car myCar = new Car();
		boolean run = true;
		while (run) {
			String[] menus = {"1. 직진", "2. 좌회전", "3. 우회전", "4. 후진", "정지"};
			for (int i = 0; i < menus.length; i++) {
				System.out.println(menus[i]);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				run = myCar.leftFront.roll();
				run = myCar.leftBack.roll();
				run = myCar.rightFront.roll();
				run = myCar.rightBack.roll();
				break;
			case "2":
					run = myCar.rightFront.roll();
				run = myCar.rightBack.roll();
				break;
			case "3":
				run = myCar.leftFront.roll();
				run = myCar.leftBack.roll();
				break;
			case "4":
				run = myCar.leftFront.roll();
				run = myCar.leftBack.roll();
				run = myCar.rightFront.roll();
				run = myCar.rightBack.roll();
				break;
			case "5":
				run = false;
		
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}

	}
	static void inspect(boolean tf, Car car) {
		if (tf ==true) {
			System.out.println("타이어 정상!");
		}
		System.out.println("타이어 교체");
		car.change(car);
	}

}
