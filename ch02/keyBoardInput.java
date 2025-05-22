package ch02;

public class keyBoardInput {

	public static void main(String[] args) throws Exception{
		//<키보드의 입력을 받아 제어하는 실행문>
		boolean run = true;
		int speed = 100;
		int keyCode = 0;
		
		while (run) {
			if (keyCode !=13 && keyCode != 10) {
				System.out.println("==================");
				System.out.println("1. 엑셀 | 2. 브레이크 | 3. 중지 ");
				System.out.println("==================");
				System.out.println("선택 : ");
			}//if(keyCode)
			keyCode = System.in.read();
			
			if (keyCode == 49) {
				speed += 5;
				System.out.println("현재 속도 : " + speed);
			}else if (keyCode == 50) {
				speed -= 5;
				System.out.println("현재 속도 : " + speed);
			}else if (keyCode == 51) {
				run = false;
				System.out.println("크루즈 기능이 종료 됩니다.");
				System.out.println("현재 속도 : " + speed);
				System.out.println("안전운전하세요!!");
			}//if(keyCode)
		}//while (run)
		System.out.println("프로그램 종료");
	}//main
}
//end