package ch01;

//�پ��� ��������

public class VaeExam {

	public static void main(String[] args) {
		
		int x = 1 ;
		char y = 65 ;//>>char�� ���� Ÿ���ε� ���ڷ� ��ȯ�ϱ⵵ ��.
		char z = 'A' ;//charŸ���� ���� z�� A ����.
		//char�� �����ڵ忡 ���� ��ǻ�� �˾Ƽ� ��ȯ�ؼ� �˾Ƹ���
		//�����ڵ忡�� 65�� A��.
		
		System.out.println("int x = " + x);
		System.out.println("char y = " + y);
		System.out.println("char z = " + z);
		
		
		char z1 = 'b' ;//�� ���ڴ� ', ���ڿ��� "
		
		
		//>>���� ����� �ʱ�ȭ�� �и�
		int x1 ;
		x1=10 ;
		System.out.println(x1);
		
		
		double x2 = 10 ;
		//�Ǽ� Ÿ���� �Ҽ��� ����
		System.out.println("x2 =" + x2);
		
		//>>���� �ۼ� ��Ģ���� �̾��
		
		//���� ���� ����
		int kor, eng, mat, total, avg ;
		//���� Ÿ���� �̾ �� �� ����.

		kor = 90 ;
		eng = 80 ;
		mat = 70 ;
		total=kor + eng + mat ;
		avg = total/3 ;
		//int�� �� ��� �ڵ� ���� ������ ������ �Ҽ��� �ݿ��� �� �ǰ� ���� ���� �� ������ ���� ���� ���� ����
		
		System.out.println("����: " + total);
		System.out.println("���: " + avg);
		
		
		
		//���ͷ�>> ���� �Էµ� ��
		
		int literal1 = 75 ; //10����
		int literal2 = 075 ; //8����
		int literal3 = 0b0011 ; //2����
		int literal4 = 0xA; //16����
		
		System.out.println("10���� 75: " + literal1);
		System.out.println("8���� 75: " + literal2);
		System.out.println("2���� 11: " + literal3);
		System.out.println("16���� A: " + literal4);

	}

}
