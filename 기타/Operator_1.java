import java.util.Scanner;

public class Operator_1 {

	public static void main(String[] args) {
		System.out.println("�ڿ����� �Է��ϼ���.");
		
		Scanner s = new Scanner(System.in);
		
		int i1 = s.nextInt();
		int i2 = i1 % 2;
		String x = (i2 == 1) ? "Ȧ��" : "¦��";
		
		System.out.println("�Է��� ���� " + x + "�Դϴ�.");

	}

}
