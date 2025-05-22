package ch02;

import java.util.Scanner;

public class ForChaeYun {

	public static void main(String[] args) {
		
		Scanner inputint = new Scanner(System.in);
		
		//<둘 이상의 초기화식>
		for (int in = 1, de = 10;  in<=10 && de>=1; in++, de--) {
			System.out.println("1씩 증가 : "+ in + "        1씩 감소 : " + de);
		}
		
		//<홀수의 합>
		int sum =0;
	
		for (int i = 1; i <=9; i+=2) {
			sum = sum + i;
		}
		System.out.println("1~9까지의 홀수의 합: " + sum);
		
		//<최대최소가 변동되는 합계>
		/*
		 변수의 사용 범위를 파악할 것 
		 Scanner의 입력 데이터 타입을 확인 할 것 
		 출력시 최대값의 멘트가 적용 될 것!
		 */

		System.out.print("input>>");
		int input = inputint.nextInt();
		System.out.print("min>>");
		int min = inputint.nextInt();
		System.out.print("max>>");
		int max = inputint.nextInt();
		System.out.print("add>>");
		int add = inputint.nextInt();
		
		boolean control1 = true;
		while (control1) {
			if (add > 0) {
				System.out.println(input + "~" + max + "사이 " + add + "씩 증가한 값");
				control1 = false;
			} else if (add < 0) {
				System.out.println(input + "~(" + min + ")사이 " + add + "씩 증가한 값");
				control1 = false;
			} else {
				System.out.print("add(!=0)>>");
				add = inputint.nextInt();
			}//if(add)
		}//while(control1)
		for (int total =input ; total <= max && total >= min; total = total + add) {
				System.out.println(total);
		}//for(total)
		
		//주의: 초기화식에서 루프 카운트변수를 부동 소수점인 실수방식을 사용하면 안된다.
		
		//중첩 for문
		for (int m = 1; m <=12; m++) {
			if (m==2) {
				for (int d = 1; d <= 28; d++) {
					System.out.println("2025년 " + m + "월 " + d + "일");
				} 
			}else if (m==4|m==6|m==9|m==11) {
				for (int d = 1; d <= 30; d++) {
					System.out.println("2025년 " + m + "월 " + d + "일");
				} 
			}else {
				for (int d = 1; d <= 31; d++) {
					System.out.println("2025년 " + m + "월 " + d + "일");
				} 
			}//if(m)
		}//for(m)
		
		//for문을 while문으로 변형(비교)
		int i = 0;
		int num = 0;
	
		for (; i <=6; i++) {
			num = (int)(Math.random()*45)+1;
			System.out.println("오늘의 로또번호 : " + num);
		}
		System.out.println("프로그램 종료");
		
		i=0;
		boolean run = true;
		while (run) {
			num = (int)(Math.random()*45)+1;
			System.out.println("오늘의 로또번호 : " + num);
			i++;
			if (i >=6) {
				System.out.println("프로그램 종료");
				run = false;
			}
		}//while (run)
		
		i=0;	
		while (true) {
			num = (int)(Math.random()*45)+1;
			System.out.println("오늘의 로또번호 : " + num);
			i++;
			if (i >=6) {
				System.out.println("프로그램 종료");
				break;
				}
		}//while (true)
		
	}//main
}
//end