package ch05.casting;

public class CastingTestExam {

	public static void main(String[] args) {

//자동 타입 변환
//부모 필드 + 부모 오버라이딘 안 된 메서드 + 자식 오버라이딩된 메서드
		Parent pr = new Child();

		pr.field1 = "A";
		pr.method1();
		pr.method2();
		pr.method3();
//pr.field2 = "B";
//pr.method4();

//강제 타입 변환
		Child ch = (Child) pr;

		ch.field2 = "C";
		ch.method2();
		ch.method3();
		ch.method4();
	}
}