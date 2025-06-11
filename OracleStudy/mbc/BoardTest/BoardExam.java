package boardtest;

import java.sql.SQLException;
import java.util.Scanner;

import boardtest.dao.BoardDAO;
import boardtest.dao.MemberDAO;
import boardtest.dto.MemberDTO;
import boardtest.dto.boardDTO;
import boardtest.sv.MemberSV;
import boardtest.sv.boardSV;

public class BoardExam {

	public static MemberDTO session = null;
	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static Scanner scLine = new Scanner(System.in);
	public static BoardDAO boardDAO = new BoardDAO();

	public static void main(String[] args) throws SQLException {

		boolean run1 = true;
		while (run1) {
			System.out.println("===================게시판==================");
			String[] menu = { "1. 게시물 목록", "2. 게시물 조회", "3. 로그인", "4. 회원가입" };
			for (int i = 0; i < menu.length; i++) {
				System.out.println(menu[i]);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				boardDAO.readAll();
				break;
			case "2":
				boardDTO boardDTO = new boardDTO();
				System.out.println("게시물의 제목 또는 작성자를 입력하세요.");
				System.out.print(">>>");
				String input = scStr.next();
				boardDAO.searchBoard(input);

				System.out.print("게시물 번호를 입력하세요");
				System.out.print(">>>");
				int detail = scInt.nextInt();
				boardDAO.searchOne(detail, boardDTO);
				break;
			case "3":
				MemberSV.login();
				break;
			case "4":
				MemberSV.insert();
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}
	}
}
