package test1_250529.SV;

import java.util.Scanner;

import test1_250529.dto.StudentDTO;
import test1_250529.dto.TeacherDTO;

public class LoginSV {
	
	public static TeacherDTO loginTea(Scanner scStr, TeacherDTO[] teacherDTOs) {

		System.out.println("========교사 로그인========");

		System.out.print("성명: ");
		String name = scStr.next();
		int i = 0;
		for (; i < teacherDTOs.length; i++) {
			if (teacherDTOs[i].getName().equals(name)) {
				break;
			}
		}
		TeacherDTO teacher = teacherDTOs[i];
		
		System.out.print("비밀번호: ");
		String pw = scStr.next();
		if (teacher.getPw().equals(pw)) {
			return teacher;
		}
		return null;
	}

	public static StudentDTO loginStu(Scanner scStr, StudentDTO[] studentDTOs) {

		System.out.println("========학생 로그인========");

		System.out.print("학번: ");
		String StuId = scStr.next();
		int i = 0;
		for (; i < studentDTOs.length; i++) {
			if (studentDTOs[i].getStudentId().equals(StuId)) {
				break;
			}
		}
		StudentDTO student = studentDTOs[i];
		
		System.out.print("비밀번호: ");
		String pw = scStr.next();
		if (student.getPw().equals(pw)) {
			return student;
		}
		return null;
	}
	
	
}
