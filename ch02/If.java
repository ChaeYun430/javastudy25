package ch02;

import java.util.Scanner;

public class If {

	public static void main(String[] args) {
		Scanner s = new Scanner(System.in);

		// if
		System.out.println("����� ���̸� �Է��ϼ���.");
		int age = s.nextInt();
		
		if (age >= 18) {
			System.out.println("����� ���̴� 18�� �̻��Դϴ�.");
			System.out.println("����� ��ǥ�� �ڰ��� �ֽ��ϴ�.");
		}
		
		System.out.println("========================");
		//if �߰�ȣ ����
		System.out.println("if������ �߰�ȣ�� ���� ��� �ɱ��??");
		String answer = s.nextLine();
		String result = "ù ��° �ุ ����";
		
		if (result == answer) 
			System.out.println("����!!!");
			System.out.println("���� ������ ��µ���.");
			
		System.out.println("========================");	
		//if~else(¦Ȧ ����)
		System.out.println("�ϳ��� �ڿ����� �Է��ϼ���.");
		int value = s.nextInt();
		
		if (value % 2 == 1) {
			System.out.println("�Է��Ͻ� ���� Ȧ���Դϴ�.");
		}else {
			System.out.println("�Է��Ͻ� ���� ¦���Դϴ�.");
		}
		
		System.out.println("========================");
		//���� �����ڿ� ����
		System.out.println("�ϳ��� �ڿ����� �Է��ϼ���.");
		int a = s.nextInt();
		String b = a % 13 == 0?"13�� ����Դϴ�.":"13�� ����� �ƴմϴ�.";
		System.out.print("�Է��Ͻ� ���� " + b);
		
		System.out.println("========================");
		//if~else if (������ ���� ���� �ο��ϱ�)
		System.out.println("������ �Է��ϼ���.");
		double score = s.nextDouble();
		System.out.print("����� ������ : ");
		
		if (score <=100 && score >= 0) {
			if (score >= 90) { //���������� ���̸� ���� ���õ�.
				System.out.println("A");
			} else if (score >= 80) { //�ڵ����� ���� ���ǿ� ���� ����� ����
				System.out.println("B");
			} else if (score >= 70) {
				System.out.println("C");
			} else if (score >= 60) {
				System.out.println("D");
			} else {
				System.out.println("F");
			} 
		}else {
			System.out.println("������ �߸� �Է��ϼ̽��ϴ�.");
		}
		
		System.out.println("========================");
		//��ø if~else��(�� ���� ��� ��)
		System.out.println("���� �ٸ� �� ���� �Է����ּ���.");
		int x = s.nextInt();
		int y = s.nextInt();
		int z = s.nextInt();
		
		if (x > y) {
			if (y > z) {
				System.out.println("x > y > z");
			}else if (x > z) {
				System.out.println("x > z > y");
			}else {
				System.out.println("z > x > y");
			}
		}else {
			if (x > z) {
				System.out.println("y > x > z");
			}else if (y > z) {
				System.out.println("y > z > x");
			}else {
				System.out.println("z > y > x");
			}
		}
		
		System.out.println("========================");
		//
		
		
	}

}
