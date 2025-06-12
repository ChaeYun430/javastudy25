package boardtest.sv;

import java.sql.SQLException;
import java.util.Scanner;

import boardtest.dao.BoardDAO;
import boardtest.dto.BoardDTO;
import boardtest.dto.MemberDTO;
import boardtest.dto.boardDTO;

public class BoardSV {
	static Scanner scStr = new Scanner(System.in);
	static Scanner scLine = new Scanner(System.in);
	static Scanner scInt = new Scanner(System.in);
	static BoardDAO boardDAO = new BoardDAO();

	// menu method
	public static void menu(MemberDTO session) throws SQLException {
		boolean run = true;
		while (run) {
			System.out.println("===============회원용 게시판=============");
			String[] menu = { "1. 게시물 목록", "2. 게시물 조회", "3. 내 게시물 관리", "4. 내 회원 관리", "5. 로그아웃" };
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
				BoardDTO boardDTO = new BoardDTO ();
				System.out.println("게시물의 제목 또는 작성자를 입력하세요.");
				System.out.print(">>>");
				String input = scStr.next();
				boardDAO.searchBoards(input);

				System.out.print("게시물 번호를 입력하세요");
				System.out.print(">>>");
				int detail = scInt.nextInt();
				boardDAO.searchOne(detail);

				// 게시물 하나를 특정한다.
				// 그 게시물에 대한 댓글을 작성한다.

				System.out.println("댓글 작성하기");
				System.out.print(">>>");
				String comt = scLine.nextLine();
				break;
			case "3":
				if (session == null) {
					System.out.println("접근 권한이 없습니다.");
					System.out.println("로그인 메뉴로 이동합니다.");
				}
				myBoard(session);
				break;
			case "4":
				MemberSV.userMenu(session);
				break;
			case "5":
				session = null;
				System.out.println("로그아웃되었습니다.");
				run = false;
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
				break;
			}
		}
	}// menu method

	// myBoard method //수정 삭제 세션 처리 검토 필요
	private static void myBoard(MemberDTO session) throws SQLException {
		boolean run = true;
		while (run) {
			System.out.println("==============" + session.getNick() + "님의 게시판=============== ");
			boardDAO.searchBoards(session.getNick()); // 사용자 작성 게시물 전체 조회
			String[] myBoard = { "1. 게시물 작성", "2. 게시물 상세 조회", "3. 게시물 수정", "4. 게시물 삭제", "5. 내 게시물 관리 종료" };
			for (int i = 0; i < myBoard.length; i++) {
				System.out.println(myBoard[i]);
			}
			String select = scStr.next();
			switch (select) {
			case "1":
				insert(session);
				break;
			case "2":
				System.out.print("게시물 번호를 입력하세요");
				System.out.print(">>>");
				int detail = scInt.nextInt();
				boardDAO.searchOne(detail);
				break;
			case "3":
				System.out.print("수정할 게시물의 번호를 입력하세요");
				System.out.print(">>>");
				int choose = scInt.nextInt();
				update(boardDAO.searchOne(choose));
				break;
			case "4":
				System.out.print("삭제할 게시물의 번호를 입력하세요");
				System.out.print(">>>");
				choose = scInt.nextInt();
				boardDAO.delete(choose, session);
				break;
			case "5":
				System.out.println("내 게시물 관리를 종료합니다.");
				run = false;
				break;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}
		}
	}// myBoard method


	// insert method
	private static void insert(MemberDTO session) throws SQLException {
		BoardDTO boardDTO = new BoardDTO();

		System.out.println("게시글의 제목을 입력해주세요. ");
		System.out.print(">>>");
		boardDTO.setbTitle(scStr.next());

		System.out.println("게시글의 내용을 입력해주세요.");
		System.out.print(">>>");
		boardDTO.setbContent(scLine.nextLine());

		boardDTO.setMno(session.getMno());

		boardDAO.insert(boardDTO, session);
	}// insert method
	
	
	// update method
	private static void update(BoardDTO searchOne) throws SQLException {
		boolean run = true;
		while (run) {
			String[] menu = {"1. 제목 변경", "2. 내용 추가", "3. 내용 변경", "4. 수정 완료", "5. 수정 취소"};
			for (int i = 0; i < menu.length; i++) {
				System.out.println(menu[i]);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				System.out.println("게시글의 제목을 입력해주세요. ");
				System.out.print(">>>");
				searchOne.setbTitle(scStr.next());
				break;
			case "2":
				System.out.println("추가할 게시글의 내용을 입력해주세요.");
				System.out.print(">>>");
				searchOne.setbContent(searchOne.getbContent()+scLine.nextLine());
				break;
			case "3":
				System.out.println("게시글의 내용을 입력해주세요.");
				System.out.print(">>>");
				searchOne.setbContent(scLine.nextLine());
				break;
			case "4":
				run = false;
			case "5":
				return;
			default:
				System.out.println("이전 메뉴로 돌아갑니다.");
			}//switch
		}//while
		boardDAO.update(searchOne);
	}// update method

	

}
