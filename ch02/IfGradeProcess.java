package ch02;

import java.util.Scanner;
import java.util.concurrent.atomic.DoubleAdder;

public class IfGradeProcess {
	
	public static void main(String[] args) {

		Scanner a = new Scanner(System.in);
		System.out.println("���û� ���� �Է��ϼ���.");
		int x = a.nextInt();
		int i;
		double kor=0, korbe, korsum=0;
		double math=0, mathbe, mathsum=0;
		double eng=0, engbe, engsum=0;
		double soc=0, socbe, socsum=0;
		double sci=0, scibe, scisum=0;
		double his=0, hisbe, hissum=0;
		
		// ���� ���� �Է�
		for (i = 0; i < x; i++) {

			Scanner s = new Scanner(System.in);

			System.out.println("�л��� �̸��� �Է��ϼ���.");
			String name = s.nextLine();

			System.out.println("���� ������ �Է��ϼ���.");
			korbe = kor;
			kor = s.nextDouble();
			korsum = kor + korbe;

			System.out.println("���� ������ �Է��ϼ���.");
			mathbe = math;
			math = s.nextDouble();
			mathsum = math + mathbe;

			System.out.println("���� ������ �Է��ϼ���.");
			engbe = eng;
			eng = s.nextDouble();
			engsum = engbe + eng;
			
			System.out.println("��ȸ ������ �Է��ϼ���.");
			socbe = soc;
			soc = s.nextDouble();
			socsum = soc + socbe;

			System.out.println("���� ������ �Է��ϼ���.");
			scibe = sci;
			sci = s.nextDouble();
			scisum = sci + scibe;
			
			System.out.println("�ѱ��� ������ �Է��ϼ���.");
			hisbe = his;
			his = s.nextDouble();
			hissum = his + hisbe;
			
			double pertotal = kor + math + eng + soc + sci + his;
			double peravg = pertotal / 6;

			System.out.println("��� ���� �ջ� ��� ����: " + peravg);
			System.out.println(name + " �л��� ���� �Է��� �Ϸ�Ǿ����ϴ�.");
			System.out.println("===================================");
		}
		
		double koravg = korsum/x;
		double mathavg = mathsum/x;
		double engavg = engsum/x;
		double socavg = socsum/x;
		double sciavg = scisum/x;
		double hisavg = hissum/x;
		
		


			if (eng >= 90) { 
				System.out.println("���� : " + eng + " (1���)"); 
			} else if (eng>= 80) { 
				System.out.println("���� : " + eng + " (2���)"); 
			} else if (eng >= 70) { 
				System.out.println("���� : " + eng + " (3���)"); 
			} else if (eng >= 60) {
				System.out.println("���� : " + eng + " (4���)"); 
			}else {
				System.out.println("���� : " + eng + " (5���)"); 
			}
		 


	}

}//ing
