package ch04.studyClass;

public class Chain {
	
	Chain(){
		this(10);
		System.out.println("기본 생성자 Chain() 호출");
	}
	
	Chain(int x){
		this(5, 6);
		System.out.println("사용자 지정 생성자 Chain(int x) 호출");
		System.out.println("x의 값: " + x);
	}
	
	Chain(int x, int y){
		System.out.println("사용자 지정 생성자 Chain(int x, int y) 호출");
		System.out.println("x와 y값: " + x + " " + y);
	}
	
}
