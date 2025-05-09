package ch01;

public class Casting {

	public static void main(String[] args) {
		
	//자료형 범위 바깥의 값으로 강제타입변환
		//IntToByte
		int i1 = 128;
		byte b1 = (byte)i1;
		System.out.println(b1);
						
		//IntToShort
		int i2 = 32768;
		short s1 = (short)i2;
		System.out.println(s1);
		
		i2 = 32769; //변환됨??
		short s2 = (short)i2;
		System.out.println(s2);
		//원주가 늘어난건가
		
	// 값의 범위 검증 코드(int->byte)
		int i = 128;
		
		if (i>Byte.MAX_VALUE || i<Byte.MIN_VALUE) {
			System.out.println("byte 타입으로 강제 변환할 수 없습니다.");
			System.out.print(Byte.MAX_VALUE + "보다 크거나 ");
			System.out.println(Byte.MIN_VALUE + "보다 작습니다.");
		}
		else {
			byte b = (byte)i;
			System.out.println("byte 타입으로 강제 변환 되었습니다.");
			System.out.println(b);
			
			}
			
 
		

	}

}
