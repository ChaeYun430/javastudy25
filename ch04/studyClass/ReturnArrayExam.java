package ch04.studyClass;

public class ReturnArrayExam {

	public static void main(String[] args) {
		
		ReturnArray get = new ReturnArray();
		
		int[] values1 = {1, 2, 3};
		int result1 = get.sum1(values1);
		System.out.println(result1);
		
		int result2 =get.sum2(new int[] {1, 2, 3, 4});
		System.out.println(result2);
		
		//sum2로 배열도 가능함
		int[] values3 = {1, 2, 3};
		int result3 = get.sum2(values3);
		System.out.println(result3);
		
		int result4 =get.sum2(new int[] {1, 2, 3, 4});
		System.out.println(result4);
		
		//sum2로 숫자 그냥 넣어도 배열로 만들어서 메서드 실행함.
		System.out.println(get.sum2(1,2,3,4));
	}

}
