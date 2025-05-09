package ch01;

//if문 학습

public class LocalVariableExam {
	
	public static void main(String[] args) {
	
		int v1 = 15 ;
				
		int v2 = 0 ;//변수 선언은 위에 하세요
		
		if(v1>10) {//if는 비교문으로 ()안이 참일 때에만 실행됨
			v2 = v1 + 10 ;
		}			
		
		int v3 = v1 + v2 + 5 ;
		
		System.out.println("v1 = " + v1);
		System.out.println("v2 = " + v2);
		System.out.println("v3 = " + v3);
	}
}
