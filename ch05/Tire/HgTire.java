package ch05.Tire;

public class HgTire extends Tire {

	public HgTire(int macRotation, String location) {
		super(macRotation, location);
	}

	@Override
//자식 클래스를 이용해 객체를 교체하면 오버라이딩된다.
	public boolean roll() {
	if (accRotation < macRotation) {
			accRotation++;
			System.out.println("남은 타이어 수명: " + (macRotation - this.accRotation) + "마일리지");
			return true;
		}else {
			System.out.println(location + " 한국 타이어 펑크 경고");
			return false;
		}
	}

	
}
