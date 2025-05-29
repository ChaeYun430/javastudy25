package test1_250529;

import java.util.Scanner;

import test1_250529.SV.LoginSV;
import test1_250529.SV.ScoreSV;
import test1_250529.dto.ScoreDTO;
import test1_250529.dto.StudentDTO;
import test1_250529.dto.TeacherDTO;

public class GradeProcessExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static StudentDTO[] studentDTOs = new StudentDTO[20];
	public static int studentCount;
	public static TeacherDTO[] teacherDTOs = new TeacherDTO[10];

	
	static {
		StudentDTO studentDTO0 = new StudentDTO("A", "1111", "1", "1", "1");
		StudentDTO studentDTO1 = new StudentDTO("B", "2222", "1", "2", "6");
		StudentDTO studentDTO2 = new StudentDTO("C", "3333", "1", "11", "20");
		StudentDTO studentDTO3 = new StudentDTO("D", "4444", "1", "4", "12");
		StudentDTO studentDTO4 = new StudentDTO("F", "5555", "1", "12", "4");
		StudentDTO studentDTO5 = new StudentDTO("E", "6666", "1", "11", "22");

		studentDTOs[0] = studentDTO0;
		studentDTOs[1] = studentDTO1;
		studentDTOs[2] = studentDTO2;
		studentDTOs[3] = studentDTO3;
		studentDTOs[4] = studentDTO4;
		studentDTOs[5] = studentDTO5;
		
		int i = 0;
		for (; i < studentDTOs.length; i++) {
			if (studentDTOs[i] ==null) {
				break;
			}
		}
		studentCount = i;
		
		TeacherDTO teacherDTO0 = new TeacherDTO("가", "7777", "1", "1", "국어");
		TeacherDTO teacherDTO1 = new TeacherDTO("나", "8888", "1", "2", "수학");
		TeacherDTO teacherDTO2 = new TeacherDTO("다", "9999", "1", "11", "수학");
		TeacherDTO teacherDTO3 = new TeacherDTO("라", "0000", "1", "4", "영어");
		TeacherDTO teacherDTO4 = new TeacherDTO("마", "1234", "1", "11", "과학");
		
		teacherDTOs[0] = teacherDTO0;
		teacherDTOs[1] = teacherDTO1;
		teacherDTOs[2] = teacherDTO2;
		teacherDTOs[3] = teacherDTO3;
		teacherDTOs[4] = teacherDTO4;
		
		
	}

	public static void main(String[] args) {

		boolean run1 = true;
		while (run1) {
			String[] logInMenus = { "1. 교사 로그인", "2. 학생 로그인" };
			for (int i = 0; i < logInMenus.length; i++) {
				System.out.println(logInMenus[i]);
			}
			System.out.print(">>>");

			String select1 = scStr.next();
			switch (select1) {
			case "1":
				TeacherDTO teacher = LoginSV.loginTea(scStr, teacherDTOs);
				if (teacher == null) {
					System.out.println("로그인에 실패하셨습니다.");
					System.out.println("이전 메뉴로 돌아갑니다.");
					break;
				}
				
				boolean run2 = true;
				while (run2) {
					String[] gradeMenus = { "1. 성적 입력", "2. 전체 성적 열람", "3. 개별학생 성적 열람", "4. 성적 수정", "5. 성적 삭제" , "6. 로그아웃"};
					for (int i = 0; i < gradeMenus.length; i++) {
						System.out.println(gradeMenus[i]);
					}
					System.out.print(">>>");
					String select2 = scStr.next();
					switch (select2) {
					case "1":
						ScoreSV.create(scStr, scInt, studentDTOs, teacher);
						break;
					case "2":
						ScoreSV.readAllStudent(studentDTOs, studentCount);
						break;
					case "3":
						StudentDTO student = ScoreSV.find(scStr, studentDTOs);
						ScoreSV.readEachStudent(student, studentCount);
						break;
					case "4":
						ScoreSV.update(scStr, scInt, studentDTOs, teacher);
						break;
					case "5":
						ScoreSV.delete(scStr, scInt, studentDTOs);
						break;
					case "6":
						run2 = false;
						break;
					default:
						System.out.println("이전 메뉴로 돌아갑니다.");
					}
				}
				break;
			case "2":
				StudentDTO student = LoginSV.loginStu(scStr, studentDTOs);
				if (student == null) {
					System.out.println("로그인에 실패하셨습니다.");
					System.out.println("이전 메뉴로 돌아갑니다.");
					break;
				}
				ScoreSV.readEachStudent(student, studentCount);

				break;
			case "3":
				System.out.println("프로그램 종료");
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");

			}
		}

	}

}
