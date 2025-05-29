package ch05.Tire;

public class GhTire extends Tire{


	public GhTire(int macRotation, String location) {
		super(macRotation, location);
	}

	@Override
	public boolean roll() {
		if (accRotation < macRotation) {
			accRotation++;
			System.out.println("남은 회전 수" + (macRotation - this.accRotation));
			return true;
		}else {
			System.out.println(location + " 금호타이어가 펑크 경고");
			return false;
		}
		
	}
	
}
