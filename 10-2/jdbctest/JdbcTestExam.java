package jdbctest;

import java.util.Iterator;
import java.util.Scanner;

import jdbctest.dao.EmpDAO;

public class JdbcTestExam {

	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);

	public static void main(String[] args) {
		
		boolean run = true;
		while (run) {
			EmpDAO  empDAO = new EmpDAO();
		
			String[] menu= {"1. 데이터 입력", "2. 데이터 각각 조회", "3. 데이터 전체 조회", "4. 데이터 수정", "5. 데이터 삭제"}
			for (int i = 0; i < menu.length; i++) {
				System.out.println(menu[i]);				
			}
			String select =scStr.next();
			switch (select) {
			case "1":
				System.out.println("=========데이터 입력==========");
				System.out.print("이름: ");
				String name =  scStr.next();
				System.out.print("부서: ");
				String dept = scStr.next();
				System.out.print("점수:");
				double score = scInt.nextInt();
				empDAO.insert(name, dept, score);
				break;
			case "2":
				System.out.println("=========데이터 각각 조회==========");
				System.out.print("이름: ");
				name =  scStr.next();
				empDAO.searchEach(name);
				break;
			case "3":
				System.out.println("=========데이터 전체 조회==========");
				empDAO.searchAll();
				break;
			case "4":
				System.out.println("==========데이터 수정==========");
				empDAO.update(dept, score);
				break;
			case "5":
				empDAO.delete();
				break;
			default:
				break;
			}
		}
		
		}

}
