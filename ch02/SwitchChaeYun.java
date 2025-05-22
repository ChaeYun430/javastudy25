package ch02;

import java.util.Iterator;
import java.util.Scanner;

public class SwitchChaeYun {

	public static void main(String[] args) {
		 //과제: switch+if
		 //입력값 2개, 임의의 값, 
		Scanner inputInt = new Scanner(System.in);	
		Scanner inputStr = new Scanner(System.in);
		//입력은 용도에 따라 따로(버그때문)
		
		System.out.println("미션: 나올 수 있는 확률이 더 작은 두 주사위의 값의 합에 근접할 것.");
		
		System.out.print("주사위 게임 참가 인원: ");
		int count = inputInt.nextInt();
		String[] name = new String[count];
		int[] sum = new int[count];
		int i;
		
		for (i = 0; i < count ; i++) {
			System.out.print("주사위 게임 참가자 이름: ");
			name[i] = inputStr.nextLine();  //문장용, next는 단어용
			System.out.println("정자 서명: " + name[i]);
		
		int num1 = (int)(Math.random()*6) + 1;
		int num2 = (int)(Math.random()*6) + 1;
		sum[i] = num1 + num2;
		
		System.out.println("첫번째 주사위의 값 : " + num1);
		System.out.println("두번째 주사위의 값 : " + num2);
		System.out.println("합 : " + sum[i] + "=" + num1 + "+" + num2);
		
		switch (sum[i]) {
		case 2: case 12:{
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "1/36");
			sum[i]=1;
		}break;
			
		case 3: case 11:{
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "1/18");
			sum[i]=2;
		}break;
		
		case 4: case 10:{
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "1/12");
			sum[i]=3;
		}break;
			
		case 5: case 9:{
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "1/9" );
			sum[i]=4;
		}break;		
		
		case 6: case 8:
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "5/36");
			sum[i]=5;
		break;
			
		case 7:
			System.out.println("합으로 " + sum[i] + "가 나올 확률은 " + "1/6");
			sum[i]=6;
		break;
		
		}//switch
		}//for
		
		System.out.println("=======================================");	
		if (sum[i]==6) {
			System.out.println(name[i]);
		}else if (sum[i]==5) {
			System.out.println(name[i]);
		}
		
		}//main
	}
//ing