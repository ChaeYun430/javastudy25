import java.util.Scanner;

public class Operator_2 {

	public static void main(String[] args) {
		System.out.println("�ڿ����� �Է��ϼ���.");

		Scanner s = new Scanner(System.in);

		int i1 = s.nextInt();
		int i2 = i1 % 2;

		if (i2 == 1) {
			System.out.println("�Է��� ���� Ȧ���Դϴ�.");
		} else {
			System.out.println("�Է��� ���� ¦���Դϴ�.");
		} // ���ǹ��� ��¸� ����


	}
}
