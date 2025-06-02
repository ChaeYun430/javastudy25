package ch05.tire;

public class Tire {
	public int macRotation;
	public int accRotation;
	public String location;
	
	public Tire(int macRotation, String location) {
		this.macRotation = macRotation;
		this.location = location;
	}
	
	public boolean roll() {
		if (accRotation < macRotation) {
			accRotation++;
			System.out.println("남은 타이어 수명: " + (macRotation - this.accRotation) + "마일리지");
			return true;
		}else {
			System.out.println(location + " 타이어 펑크 경고");
			return false;
		}
	}
	
}
