package ch05.Tire;

public class GhTire extends Tire{


	public GhTire(int macRotation, String location) {
		super(macRotation, location);
	}

	@Override
	public boolean roll() {
		if (accRotation < macRotation) {
			accRotation++;
			System.out.println("남은 타이어 수명: " + (macRotation - this.accRotation) + "마일리지");
			return true;
		}else {
			System.out.println(location + " 금호 타이어 펑크 경고");
			return false;
		}
		
	}
	
}
