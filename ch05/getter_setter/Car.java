package ch05.getter_setter;

public class Car {
	private boolean stop;
	private int speed;
	
	
	public String isStop() {
		return "차량이 정지되었습니다.";
	}
	public void setStop(boolean stop) {
		if (stop) {
			this.stop = stop;
			this.speed = 0;
		}
	}
	
	public String getSpeed() {
		return speed + "km/h";
	}
	public void setSpeed(int speed) {
		if (speed<0) {
			this.speed = 0;
		}else {
			this.speed = speed;
		}
	}
	
	
}
