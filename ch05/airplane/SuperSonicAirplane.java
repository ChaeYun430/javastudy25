package ch05.airplane;

public class SuperSonicAirplane extends Airplane{

//상수 선언
public static final int NORMAL = 1;
public static final int SUPERSONIC = 2;
//final 필드는 상속 불가하므로 위치 주의할 것

public int flyMode = NORMAL;


//컴파일러에게 메서드를 오버라이딩하는 것이라고 알린다.
public void fly(int flyMode) {
		if (flyMode == SUPERSONIC) {
			System.out.println("초음속 비행합니다.");
		} else {
			super.fly();
		}

	}

}