import java.util.Scanner;

public class If {

	public static void main(String[] args) {
		
	//��ǥ�� ������ ���� �Ǻ��ϱ� if
	System.out.println("����� ���̸� �Է��ϼ���.");
	
	Scanner a = new Scanner(System.in);
	int age = a. nextInt();
	
	if (age >= 18) {
		System.out.println("����� ���̴� 18�� �̻��Դϴ�.");
		System.out.println("����� ��ǥ�� �ڰ��� �ֽ��ϴ�.");
	}
	System.out.println("�� ������ if�� �ܺο� �ֽ��ϴ�.");

		
	
	
	//¦��, Ȧ�� �Ǻ��ϱ� if~else
	System.out.println("���ڸ� �Է��ϼ���.");
	
	Scanner b = new Scanner(System.in);
	int num = b.nextInt();
	
	if (num % 2 == 0) {
		System.out.println(num + "�� ¦���Դϴ�.");
	}
	else {
		System.out.println(num + "�� Ȧ���Դϴ�.");	
	}
	
	System.out.println("�� ������ if�� �ܺο� �ֽ��ϴ�.");
	
	//���� ������
	int age_ = 20;
	String message = (age_ > 18) ? "��ǥ�� �ڰ��� �ֽ��ϴ�." : "��ǥ�� �ڰ��� �����ϴ�.";
	System.out.println(message);
	
	//������ ���� ���� �ο��ϱ� if~else if
	System.out.println("������ �Է��ϼ���.");
	
	Scanner c = new Scanner(System.in);
	int grade = c.nextInt();
	
	if (grade >= 90) {
		System.out.println("A ����");
	}
	else if (grade >= 80) {
		System.out.println("B ����");
	}
	else if (grade >= 70) {
		System.out.println("C ����");		
	}
	else if (grade >= 60) {
		System.out.println("D ����");		
	}
	else {
		System.out.println("F ����");
	}
	
	
	//ù ��°�� �Էµ� ���� �ִ����� �Ǻ��ϱ� ��øif~else
	 System.out.println("3���� ���ڸ� �Է��ϼ���.");
	 
	 Scanner d = new Scanner(System.in);
	 int x = d.nextInt();
	 int y = d.nextInt();
	 int z = d.nextInt();
	 
	 if (x > y) {
		if (x > z) {
			System.out.println(x + "�� ���� ū �����Դϴ�.");
		}
		else {
			System.out.println(x + "�� ���� ū ������ �ƴմϴ�.");
		}
	 }
	 else {
		System.out.println(x + "�� ���� ū ������ �ƴմϴ�.");
	 }
	 
	 
	 //
	
  }
}
