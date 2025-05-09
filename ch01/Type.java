package ch01;

public class Type {

	public static void main(String[] args) {
		//byte타입의 오류범위 테스트
		byte x = 125;
		int y = 125;
		
		for (int i = 0; i < 5; i++) {//i = 0~4 초기화식 코드 증감식 조건식_ 코드 증감식 조건식_
			x++;
			y++;			
			System.out.println("x : " + x + "           " + "y : " + y);
		}
		
		//유니코드와 char
		char charVar1 = '가';
		char charVar2 = 44032;
		char charVar3 = '\uac00'; //작은 따옴표 
		
		System.out.println(charVar1);
		System.out.println(charVar2);
		System.out.println(charVar3);
		
		//int타입의 범위를 벗어난 값 long타입으로 표현
		long longvar1 = 2147483647;
		//long longvar2 = 2147483648;
		long longvar2 = 2147483648L;
		

	}
}
