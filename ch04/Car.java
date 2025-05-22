package ch04;

import java.util.Scanner;

public class Car {

	// 필드명
	// 고유 데이터

	public String campany;
	public String model;
	public String color;
	public String[] nums;
	public final int MAX_SPEED = 200;

	public int speed;
	public int oil;
	public int rpm;

	public Num num;
	
	
	// 생성자
	public Car() {
		speed=0;
		oil=100;
		rpm=0;
	}


	// 메서드
	public Car select() {
		Car myCar = new Car();
		Scanner scStr = new Scanner(System.in);
		System.out.print("차량명: ");
		this.campany = 	scStr.next();
		System.out.print("모델명: ");
		this.model= scStr.next();
		System.out.print("색상: ");
		this.color = scStr.next();
		System.out.print("차량번호: ");
		num = new Num();
		num = num.make();
		num.numPrint(num);
		return myCar;
	}//select method
	
	public int findMy(Car[] cars, int carNum) {
		int i = 0;
		while (cars[i].num.num3!=carNum) {
			i++;
		}
		return i;
	}
	public void info(Car[] cars, int count) {
		cars[count].num.numPrint(cars[count].num);
		System.out.println("차량명" + cars[count].campany);
		System.out.println();
	}
	public void on() {
	}
	public void run() {
	}
	public void off() {
	}
	public void oilAdd() {
	}
	public void repair( ) {
	}
	
}