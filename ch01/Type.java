package ch01;

public class Type {

	public static void main(String[] args) {
		//byteŸ���� �������� �׽�Ʈ
		byte x = 125;
		int y = 125;
		
		for (int i = 0; i < 5; i++) {//i = 0~4 �ʱ�ȭ�� �ڵ� ������ ���ǽ�_ �ڵ� ������ ���ǽ�_
			x++;
			y++;			
			System.out.println("x : " + x + "           " + "y : " + y);
		}
		
		//�����ڵ�� char
		char charVar1 = 'A';
		char charVar2 = 44032;
		char charVar3 = '\uac00'; //���� ����ǥ 
		
		System.out.println(charVar1);
		System.out.println(charVar2);
		System.out.println(charVar3);
		
		//intŸ���� ������ ��� �� longŸ������ ǥ��
		long longvar1 = 2147483647;
		//long longvar2 = 2147483648;
		long longvar2 = 2147483648L;
		

	}
}
