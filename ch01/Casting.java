package ch01;

public class Casting {

	public static void main(String[] args) {
		
	//�ڷ��� ���� �ٱ��� ������ ����Ÿ�Ժ�ȯ
		//IntToByte
		int i1 = 128;
		byte b1 = (byte)i1;
		System.out.println(b1);
						
		//IntToShort
		int i2 = 32768;
		short s1 = (short)i2;
		System.out.println(s1);
		
		i2 = 32769; //��ȯ��??
		short s2 = (short)i2;
		System.out.println(s2);
		//���ְ� �þ�ǰ�
		
	// ���� ���� ���� �ڵ�(int->byte)
		int i = 128;
		
		if (i>Byte.MAX_VALUE || i<Byte.MIN_VALUE) {
			System.out.println("byte Ÿ������ ���� ��ȯ�� �� �����ϴ�.");
			System.out.print(Byte.MAX_VALUE + "���� ũ�ų� ");
			System.out.println(Byte.MIN_VALUE + "���� �۽��ϴ�.");
		}
		else {
			byte b = (byte)i;
			System.out.println("byte Ÿ������ ���� ��ȯ �Ǿ����ϴ�.");
			System.out.println(b);
			
			}
			
 
		

	}

}
