package ch01;

import java.util.Scanner;

public class LogicalAnd_Or {

	public static void main(String[] args) {

		Scanner s = new Scanner(System.in);

		// ����(�����ڵ� ǥ���� ���� ��ҹ���, ���� ã��)
		System.out.println("���� �Է��Ͻø� �����ڵ�ǥ�� �̿��Ͽ� �����ڿ� ���ڸ� ã�Ƶ帮�ڽ��ϴ�. ");

		// ����(2�� ��� �Ǵ� 3�� ������� �Ǵ��ϱ�)
		System.out.println("2�� ��� �Ǵ� 3�� ����� ã�� �����??");
		System.out.print("���� �Է��ϼ���. : ");
		int value = s.nextInt();

		if ((value % 2 ==0) || (value % 3 ==0) ) {
			System.out.println("");
		}else {
			System.out.println("");
			
		}

	}

}
