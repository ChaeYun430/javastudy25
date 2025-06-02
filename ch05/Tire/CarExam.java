package ch05.tire;

import java.util.Scanner;

public class CarExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);

	public static void main(String[] args) {
		Car myCar = new Car();

		boolean run = true;
		while (run) {
			for (int i = 0; i < 4; i++) {
				if (i == myCar.run()) {
					System.out.println(myCar.tire[i].location + " 타이어 교체");

					while (true) {
						System.out.println("어느 타이어로 교체하시겠습니까?");
						System.out.println("1. 금호타이어 | 2. 한국 타이어");
						System.out.print(">>>");
						String select = scStr.next();
						switch (select) {
						case "1":
							myCar.tire[i] = new GhTire(20, myCar.tire[i].location);
							break;
						case "2":
							myCar.tire[i] = new HgTire(20, myCar.tire[i].location);
							break;
						default:
							System.out.println("다시 한 번 선택해주세요.");
						}
					} // while(true)
				} // if(i == myCar.run())
			} // for 교체여부 결정

			String[] menus = { "1. 직진", "2. 좌회전", "3. 우회전", "4. 후진", "정지" };
			for (int i = 0; i < menus.length; i++) {
				System.out.println(menus[i]);
			}
			System.out.print(">>>");
			select = scStr.next();
			switch (select) {
			case "1":
				run = myCar.tire[0].roll();
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
				System.out.println("정지합니다.");
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}

		} // while(run)
	}// main method
}
// class
