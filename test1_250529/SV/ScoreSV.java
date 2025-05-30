package test1_250529.SV;

import java.util.Scanner;

import test1_250529.dto.ScoreDTO;
import test1_250529.dto.StudentDTO;
import test1_250529.dto.TeacherDTO;

public class ScoreSV {

	// create
	public static void create(Scanner scStr, Scanner scInt, StudentDTO[] students, TeacherDTO teacher) {
		System.out.println("==========성적 입력=============");
		int i = 0;
		for (; i < students.length; i++) {
			if (students[i]==null) {
				break;
			}
			
			System.out.print(students[i].getName()+" 학생의 ");
			switch (teacher.getSubjects()) {
			case "국어":
				System.out.print("국어점수: ");
				students[i].getScoreDTO().setKor(scInt.nextInt());
				break;
			case "수학":
				System.out.print("수학점수: ");
				students[i].getScoreDTO().setMath(scInt.nextInt());
				break;
			case "영어":
				System.out.print("영어점수: ");
				students[i].getScoreDTO().setEng(scInt.nextInt());
				break;
			case "과학":
				System.out.print("과학점수: ");
				students[i].getScoreDTO().setSci(scInt.nextInt());
				break;

			default:
				System.out.println("점수 입력이 불가합니다.");
			}	

		}
		System.out.println(teacher.getSubjects()+ "과 성적입력이 완료되었습니다.");
		
		
		//성적 입력과 합계의 연결부 보수 필요
		if (students[i-1].getScoreDTO().getKor()!=0&&students[i-1].getScoreDTO().getMath()!=0&&students[i-1].getScoreDTO().getEng()!=0&&students[i-1].getScoreDTO().getSci()!=0) {
		
			for (int j = 0; j < i; j++) {
				students[j].getScoreDTO().setTotal();
				students[j].getScoreDTO().setAvg();
				
			}
			
			for (int j = 0; j < i-2; j++) {
				for (int k = 0; k < i-1; k++) {
					if (students[k].getScoreDTO().getAvg() < students[k+1].getScoreDTO().getAvg()) {
						StudentDTO temp = students[k];
						students[k] = students[k + 1];
						students[k+1] = temp;
					}
				} 
			}
			for (int j = 0; j < i; j++) {
				students[j].getScoreDTO().setRank(j+1);
			}
		}
		
	}
	

	// readAll
	public static void readAllStudent(Scanner scStr,StudentDTO[] students, int studentCount) {
		System.out.println("==========전교생 성적 열람=============");
		System.out.println();
		for (int i = 0; i < students.length; i++) {
			if (students[i] == null) {
				continue;
			}
			ScoreSV.readEachStudent(scStr, students[i], studentCount);
		}
		
	}

	// readEachStudent
	public static void readEachStudent(Scanner scStr, StudentDTO student, int studentCount) {
		System.out.println("========" + student.getName() + " 학생의 개인 성적 열람===============" );
		System.out.println("국어: " + student.getScoreDTO().getKor() + "점");
		System.out.println("수학: " + student.getScoreDTO().getMath() + "점");
		System.out.println("영어: " + student.getScoreDTO().getEng() + "점");
		System.out.println("과학: " + student.getScoreDTO().getSci() + "점");
		System.out.println("총점: " + student.getScoreDTO().getTotal() + "점");
		System.out.println("평균: " + student.getScoreDTO().getAvg() + "점");
		System.out.println("전체석차: " + student.getScoreDTO().getRank() + "/" + studentCount);
		
	}

	// update
	public static void update(Scanner scStr, Scanner scInt, StudentDTO[] students, TeacherDTO teacher) {
		System.out.println("===========개별학생 성적 수정=============");
		StudentDTO student = find(scStr, students);
		if (student == null) {
			System.out.println("찾으시는 학생이 존재하지 않습니다.");
		}
		switch (teacher.getSubjects()) {
		case "국어":
			System.out.print("국어점수: ");
			student.getScoreDTO().setKor(scInt.nextInt());
			break;
		case "수학":
			System.out.print("수학점수: ");
			student.getScoreDTO().setMath(scInt.nextInt());
			break;
		case "영어":
			System.out.print("영어점수: ");
			student.getScoreDTO().setEng(scInt.nextInt());
			break;
		case "과학":
			System.out.print("영어점수: ");
			student.getScoreDTO().setSci(scInt.nextInt());
			break;

		default:
			System.out.println("점수 수정이 불가합니다.");
		}
		System.out.println(student.getName() + " 학생의 성적수정이 완료되었습니다.");
	}

	// delete
	public static void delete(Scanner scStr, Scanner scInt, StudentDTO[] students) {
		System.out.println("===========개별학생 성적 전체 0점처리=============");
		StudentDTO student = find(scStr, students);
		if (student == null) {
			System.out.println("찾으시는 학생이 존재하지 않습니다.");
		}
		student.getScoreDTO().setKor(0);
		student.getScoreDTO().setMath(0);
		student.getScoreDTO().setEng(0);
		student.getScoreDTO().setSci(0);

	}

	// find
	public static StudentDTO find(Scanner scStr, StudentDTO[] students) {
		System.out.println("찾으시는 학생의 학번을 입력해 주세요.");
		String input = scStr.next();

		for (int i = 0; i < students.length; i++) {
			if (students[i] == null) {
				continue;
		}else if (students[i].getStudentId().equals(input)) {
				return students[i];
			}
		}
		return null;
	}
}
