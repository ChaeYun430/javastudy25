package ch01;

public class OperatorCompare {

	public static void main(String[] args) {
		//char 타입 비교연산
		char charval1 = 'A';
		char charval2 = 65;
		char charval3 = 'B';
		char charval4 = 1;
		char charval5 = '1';
		
		System.out.println(charval1 == charval2); 
		System.out.println(charval1 < charval3);
		System.out.println(charval4 != charval5);
		System.out.println(charval2 < charval4); //char는 문자 타입인데 숫자로 변환하기도 함.
		
		boolean result1 = charval1 == charval2 ; //boolean변수 선언 후 출력
		System.out.println(result1);
		
		System.out.println("=====================");
		//정수와 실수의 비교연산
		int intval1 = 1;
		double douval1 = 1.0;
		float floatval1 = 1.0F;
		double douval2 = 0.1;
		float floatval2 = 0.1F;
		
		System.out.println(intval1 == douval1);
		System.out.println(douval1 == floatval1); 
		System.out.println(douval2 == floatval2);
		System.out.println(douval2 == (double)floatval2); //double로
		System.out.println((float)douval2 == floatval2); //float으로
		System.out.println((douval2*10) == (double)(floatval2*10));
		
		System.out.println("=====================");
		//String 타입 문자열 동등 비교
		String strval1 = "아아";
		String strval2 = "아아";
		String strval3 = new String ("아아"); //새로운 객체 생성
		String strval4 = new String ("아아"); //객체 또 생성
		
		System.out.println(strval1 == strval2); //산출값의 타입(비교&논리)
		System.out.println(strval1 != strval2);
		
		System.out.println(strval1 == strval3); //객체가 다르기 때문에
		System.out.println(strval3 == strval4); //다른 객체
		
		boolean result = strval1.equals(strval3);
		System.out.println(result);
		
		
	}

}
