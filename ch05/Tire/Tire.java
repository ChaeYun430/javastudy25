package ch05.Tire;

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
			System.out.println("남은 회전 수" + (macRotation - this.accRotation));
			return true;
		}else {
			System.out.println(location + " 타이어가 펑크 경고");
			return false;
		}
	}
	
}
