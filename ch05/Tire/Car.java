package ch05.tire;

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
	
void run(Car myCar){

}
	void changeTire(Car myCar) {

	}
}
