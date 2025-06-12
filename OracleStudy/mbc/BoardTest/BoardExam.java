package boardtest;

import java.sql.SQLException;
import java.util.Scanner;

import boardtest.dao.BoardDAO;
import boardtest.dto.BoardDTO;
import boardtest.dto.MemberDTO;
import boardtest.sv.BoardSV;
import boardtest.sv.MemberSV;

public class BoardExam {

	public static MemberDTO session = null;
	public static Scanner scInt = new Scanner(System.in);
	public static Scanner scStr = new Scanner(System.in);
	public static Scanner scLine = new Scanner(System.in);
	public static BoardDAO boardDAO = new BoardDAO();

	public static void main(String[] args) throws SQLException {

		boolean run = true;
		while (run) {
			System.out.println("===================비회원용 게시판==================");
			String[] menu = { "1. 게시물 목록", "2. 게시물 조회", "3. 로그인", "4. 회원가입", "5. 프로그램 종료" };
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
				BoardDTO boardDTO = new BoardDTO();
				System.out.println("게시물의 제목 또는 작성자를 입력하세요.");
				System.out.print(">>>");
				String input = scStr.next();
				boardDAO.searchBoards(input);

				System.out.print("게시물 번호를 입력하세요");
				System.out.print(">>>");
				int detail = scInt.nextInt();
				boardDAO.searchOne(detail);
				break;
			case "3":
				session = MemberSV.login(session);
				BoardSV.menu(session);
				break;
			case "4":
				MemberSV.insert();
				break;
			case "5":
				run = false;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}
	}
}
