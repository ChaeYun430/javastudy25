package ch04.studyClass;

public class ReturnArray {
	
	//배열로 리턴
	public int sum1(int[] values){
		int sum1 = 0;
		for (int i = 0; i < values.length; i++) {
			sum1 += sum1;
		}
		return sum1;
	}
	
	//...으로 호출되면 메소드 호출시 넘겨준 값의 수에 따라 자동으로 배열이 생성

	public int sum2(int ...values) {
		int sum2 = 0;
		for (int i = 0; i < values.length; i++) {
			sum2 += sum2;
		}
		return sum2;
	}
	
}
