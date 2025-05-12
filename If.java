import java.util.Scanner;

public class If {

	public static void main(String[] args) {
		
	//투표가 가능한 나이 판별하기 if
	System.out.println("당신의 나이를 입력하세요.");
	
	Scanner a = new Scanner(System.in);
	int age = a. nextInt();
	
	if (age >= 18) {
		System.out.println("당신의 나이는 18세 이상입니다.");
		System.out.println("당신은 투표할 자격이 있습니다.");
	}
	System.out.println("이 문장은 if문 외부에 있습니다.");

		
	
	
	//짝수, 홀수 판별하기 if~else
	System.out.println("숫자를 입력하세요.");
	
	Scanner b = new Scanner(System.in);
	int num = b.nextInt();
	
	if (num % 2 == 0) {
		System.out.println(num + "은 짝수입니다.");
	}
	else {
		System.out.println(num + "은 홀수입니다.");	
	}
	
	System.out.println("이 문장은 if문 외부에 있습니다.");
	
	//삼항 연산자
	int age_ = 20;
	String message = (age_ > 18) ? "투표할 자격이 있습니다." : "투표할 자격이 없습니다.";
	System.out.println(message);
	
	//점수에 따라 학점 부여하기 if~else if
	System.out.println("점수를 입력하세요.");
	
	Scanner c = new Scanner(System.in);
	int grade = c.nextInt();
	
	if (grade >= 90) {
		System.out.println("A 학점");
	}
	else if (grade >= 80) {
		System.out.println("B 학점");
	}
	else if (grade >= 70) {
		System.out.println("C 학점");		
	}
	else if (grade >= 60) {
		System.out.println("D 학점");		
	}
	else {
		System.out.println("F 학점");
	}
	
	
	//첫 번째로 입력된 값이 최댓값인지 판별하기 중첩if~else
	 System.out.println("3개의 숫자를 입력하세요.");
	 
	 Scanner d = new Scanner(System.in);
	 int x = d.nextInt();
	 int y = d.nextInt();
	 int z = d.nextInt();
	 
	 if (x > y) {
		if (x > z) {
			System.out.println(x + "는 가장 큰 정수입니다.");
		}
		else {
			System.out.println(x + "는 가장 큰 정수가 아닙니다.");
		}
	 }
	 else {
		System.out.println(x + "는 가장 큰 정수가 아닙니다.");
	 }
	 
	 
	 //
	
  }
}
