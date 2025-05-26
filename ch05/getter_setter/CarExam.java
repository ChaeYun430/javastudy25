package ch05.getter_setter;

public class CarExam {

	public static void main(String[] args) {
		//속도 검증 코드(음의 정수 제외)
		Car car = new Car();
		car.setSpeed(-10);
		System.out.println("-10 입력시 현재 속도: " + car.getSpeed());
		car.setSpeed(10);
		System.out.println("10 입력시 현재 속도: " + car.getSpeed());
		
		System.out.println("==차량정지==");
		car.setStop(true);
		System.out.println(car.isStop());
		
	}

}
