package ch01;

import java.util.Iterator;
//�ܺ� ���̺귯�� �ҷ�����
import java.util.Scanner;

public class Logical {

	public static void main(String[] args) {

		// Scanner ��ü ����
		Scanner s = new Scanner(System.in);

		System.out.println("====");
		s.nextLine();
		System.out.println("====");

		// ���̵�, ��й�ȣ ����
		System.out.println("������ ���̵� �Է��ϼ���.");
		String loginid = s.nextLine();
		System.out.println("������ ��й�ȣ�� �Է��ϼ���.");
		String loginpw = s.nextLine();
		System.out.println("��й�ȣ�� �ٽ� �� �� �Է��ϼ���.");
		String pwTest = s.nextLine(
	
				);

		if (loginpw.equals(pwTest)) {

		} else {

			while (!(loginpw.equals(pwTest))) {
				System.out.println("��й�ȣ�� �ٽ� �� �� �Է��ϼ���.");
				pwTest = s.nextLine(
						 
				);
			}
		}

		System.out.println("���̵�� ��й�ȣ ������ �Ϸ�Ǿ����ϴ�.");

		// �α���
		System.out.println("�α��� �Ͻ÷��� '�α���'�� �Է����ּ���");
		String loginb = "�α���";
		String login = s.nextLine();

		if (login.equals(loginb)) {

			System.out.println("���̵� �Է��ϼ���.");
			String id = s.nextLine();
			System.out.println("��й�ȣ�� �Է��ϼ���.");
			String pw = s.nextLine();

			if (loginid.equals(id) && loginpw.equals(pw)) {
				System.out.println("�α��� �Ǿ����ϴ�.");
			} else if (!(loginid.equals(id))) {
				
				System.out.println("�Է��Ͻ� ���̵� �������� �ʽ��ϴ�. ȸ������ �Ͻðڽ��ϱ�?");
				
			} else if (loginid.equals(id) && !(loginpw.equals(pw))) {

				while (loginid.equals(id) && !(loginpw.equals(pw))) {
				
					System.out.println("��й�ȣ�� �ٽ� �Է��ϼ���.");
					pw = s.nextLine();
					
				}
				System.out.println("�α����� �Ϸ�Ǿ����ϴ�.");
			}
		} else {
			System.out.println("====================");
		}

	}
}
