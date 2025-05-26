package ch04.car;

import java.util.Scanner;

public class CarExam {

	public static void main(String[] args) {
		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);
		Car car = new Car();
		Car cars[] = new Car[99];
		int count=0;
		boolean run = true;
		while (run) {
			System.out.println("=================");
			System.out.println("1. 차량 정보 입력");
			System.out.println("2. 차량 정보 확인");
			System.out.println("3. 차량 시동걸기");
			System.out.println("4. 차량 주행");
			System.out.println("5. 차량 시동 끄기");
			System.out.println("=================");
			System.out.println(">>>>");
			int select = scInt.nextInt();
			switch (select) {
			case 1:
				cars[count] = car.select();
				count++;
				break;
			case 2:
				System.out.println("차량 뒷번호 4자리를 입력하세요.");
				System.out.println(">>>>");
				int carNum = scInt.nextInt();
				car.info(cars, car.findMy(cars, carNum));

				break;
			case 3:

				break;
			case 4:

				break;
			case 5:

				break;

			default:
				break;
			}
		}
		
	}

}
