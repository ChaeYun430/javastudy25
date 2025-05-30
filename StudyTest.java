import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;

public class StudyTest {

	public static void main(String[] args) {
		int beforeTime = (int) System.currentTimeMillis() / 1000;
		System.out.println(beforeTime);
		Scanner input = new Scanner(System.in);
		int whilewhilewhile = input.nextInt();
		int afterTime = (int) System.currentTimeMillis() / 1000;
		System.out.println(afterTime);
		
		Date date = new Date();
		System.out.println(date.getYear()+1900);
		System.out.println(date.getMonth()+1);
		System.out.println(date.getDate());
	}

}
