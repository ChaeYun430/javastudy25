package ch01;

//다양한 변수선언

public class VaeExam {

	public static void main(String[] args) {
		
		int x = 1 ;
		char y = 65 ;//>>char는 문자 타입인데 숫자로 변환하기도 함.
		char z = 'A' ;//char타입의 변수 z에 A 넣음.
		//char는 유니코드에 의해 컴퓨터 알아서 변환해서 알아먹음
		//유니코드에서 65는 A임.
		
		System.out.println("int x = " + x);
		System.out.println("char y = " + y);
		System.out.println("char z = " + z);
		
		
		char z1 = 'b' ;//한 문자는 ', 문자열은 "
		
		
		//>>변수 선언과 초기화의 분리
		int x1 ;
		x1=10 ;
		System.out.println(x1);
		
		
		double x2 = 10 ;
		//실수 타입은 소수점 있음
		System.out.println("x2 =" + x2);
		
		//>>변수 작성 규칙부터 이어쓰기
		
		//다중 변수 선언
		int kor, eng, mat, total, avg ;
		//같은 타입은 이어서 쓸 수 있음.

		kor = 90 ;
		eng = 80 ;
		mat = 70 ;
		total=kor + eng + mat ;
		avg = total/3 ;
		//int로 쓸 경우 코드 상의 오류는 없으나 소수점 반영이 안 되고 순위 산출 시 구현된 값에 문제 제기 가능
		
		System.out.println("총점: " + total);
		System.out.println("평균: " + avg);
		
		
		
		//리터럴>> 직접 입력된 값
		
		int literal1 = 75 ; //10진수
		int literal2 = 075 ; //8진수
		int literal3 = 0b0011 ; //2진수
		int literal4 = 0xA; //16진수
		
		System.out.println("10진수 75: " + literal1);
		System.out.println("8진수 75: " + literal2);
		System.out.println("2진수 11: " + literal3);
		System.out.println("16진수 A: " + literal4);

	}

}
