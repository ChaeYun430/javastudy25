package ch05.casting;

public class InstanceofExam {

	public static void main(String[] args) {

		Parent instance1 = new Child();
		verifyType(instance1);
		Parent instance2 = new Parent();
		verifyType(instance2);
		Child instance3 = new Child();
		verifyType(instance3);
	}

	static void verifyType(Parent parent) {
		if (parent instanceof Child) {
			Child child = (Child) parent;
			System.out.println("강제 타입 변환 성공");
		} else {
			System.out.println("강제 타입 변환 실패");
		}
	}
}