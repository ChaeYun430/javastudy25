package ch01;

public class OperatorCompare {

	public static void main(String[] args) {
		//char Ÿ�� �񱳿���
		char charval1 = 'A';
		char charval2 = 65;
		char charval3 = 'B';
		char charval4 = 1;
		char charval5 = '1';
		
		System.out.println(charval1 == charval2); 
		System.out.println(charval1 < charval3);
		System.out.println(charval4 != charval5);
		System.out.println(charval2 < charval4); //char�� ���� Ÿ���ε� ���ڷ� ��ȯ�ϱ⵵ ��.
		
		boolean result1 = charval1 == charval2 ; //boolean���� ���� �� ���
		System.out.println(result1);
		
		System.out.println("=====================");
		//������ �Ǽ��� �񱳿���
		int intval1 = 1;
		double douval1 = 1.0;
		float floatval1 = 1.0F;
		double douval2 = 0.1;
		float floatval2 = 0.1F;
		
		System.out.println(intval1 == douval1);
		System.out.println(douval1 == floatval1); 
		System.out.println(douval2 == floatval2);
		System.out.println(douval2 == (double)floatval2); //double��
		System.out.println((float)douval2 == floatval2); //float����
		System.out.println((douval2*10) == (double)(floatval2*10));
		
		System.out.println("=====================");
		//String Ÿ�� ���ڿ� ���� ��
		String strval1 = "�ƾ�";
		String strval2 = "�ƾ�";
		String strval3 = new String ("�ƾ�"); //���ο� ��ü ����
		String strval4 = new String ("�ƾ�"); //��ü �� ����
		
		System.out.println(strval1 == strval2); //���Ⱚ�� Ÿ��(��&��)
		System.out.println(strval1 != strval2);
		
		System.out.println(strval1 == strval3); //��ü�� �ٸ��� ������
		System.out.println(strval3 == strval4); //�ٸ� ��ü
		
		boolean result = strval1.equals(strval3);
		System.out.println(result);
		
		
	}

}
