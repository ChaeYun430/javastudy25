package ch05.Tire;

public class Car {
	Tire leftFront;
	Tire leftBack;
	Tire rightFront;
	Tire rightBack;
	
	Car(){
		leftFront = new Tire(5, "좌측 앞");
		leftBack = new Tire(10, "좌측 뒤");
		rightFront = new Tire(15, "우측 앞");
		rightBack = new Tire(20, "우측 뒤");
	}
	
	void change(Car myCar) {
		myCar.leftBack = new GhTire(5, null);
		
	}
}
