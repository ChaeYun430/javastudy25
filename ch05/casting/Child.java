package ch05.casting;

public class Child extends Parent {

	String field2;

	void method2() {
//System.out.println("상속만 받고 오버라이딩 안 된 메서드");
	}

	void method3() {
		System.out.println("자식 클래스의 오버라이딩된 method3");
	}

	void method4() {
		System.out.println("자식 클래스의 method4");
	}
	
	
}