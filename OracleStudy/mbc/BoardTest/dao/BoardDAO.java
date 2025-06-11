package boardtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Scanner;

import boardtest.dto.MemberDTO;
import boardtest.dto.boardDTO;

public class BoardDAO {
	Board_binDAO binDAO = new Board_binDAO();

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet resultSet = null;
	int result = 0;
	
	
	//constructor
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "BOARDTEST", "BOARDTEST");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 또는 ojdbc6.jar를 확인하세요");
			e.printStackTrace();
			System.exit(0);
		} catch (SQLException e) {
			System.out.println("연결 URL 또는 ID / PW를 확인하세요.");
			e.printStackTrace();
			System.exit(0);
		}
	}

	// readAll  method
	public void readAll() throws SQLException {// sql문 예외 처리를 위해서 BAO내에서 DB 활용
		try {
			String sql = "SELECT BNO, BTITLE, BWRITER, BDATE, BUPDATE FROM BOARD ORDER BY BDATE DESC";
			System.out.println("sql 확인 코드: " + sql);
			pstmt = conn.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			readOne(resultSet);
		} catch (SQLException e) {
			System.out.println("check readAll method");
			e.printStackTrace();
		} finally {
			pstmt.close();
			resultSet.close();
		}
	}

	
	//searchBoard method
	public void searchBoard(String input) throws SQLException {
		try {
			String sql1 = "SELECT * FROM BOARD WHERE BWRITER = ? ORDER BY BDATE DESC";
			String sql2 = "SELECT * FROM BOARD WHERE BTITLE = ? ORDER BY BDATE DESC";
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, input);
			resultSet = pstmt.executeQuery();
			if (resultSet.first()) {
				readOne(resultSet);
				return;
			}
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, input);
			resultSet = pstmt.executeQuery();
			if (resultSet.first()) {
				readOne(resultSet);
				return;
			}
		} catch (SQLException e) {
			System.out.println("check searchBoard method of BoardDAO");
			e.printStackTrace();
		}finally {
			pstmt.close();
			resultSet.close();
		}
	}//searchBoard method

	
	//searchOne method
	public boardDTO searchOne(int detail, boardDTO boardDTO) throws SQLException {
		try {
			String sql = "SELECT * FROM BOARD WHERE BNO = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, detail);
			resultSet = pstmt.executeQuery();
			if (resultSet.next()) {
				System.out.print(resultSet.getInt("BNO") + "\t");
				System.out.print(resultSet.getString("BTITLE") + "\t");
				System.out.print(resultSet.getString("BWRITER") + "\t");
				System.out.print(resultSet.getDate("BDATE") + "\t");
				if (resultSet.getDate("BUPDATE") != null) {
					System.out.print(resultSet.getDate("BUPDATE") + "\t");
				}
				System.out.print(resultSet.getString("BCONTENT"));
				return boardDTO;
			}
		} catch (SQLException e) {
			System.out.println("check searchOne method of BoardDAO");
			e.printStackTrace();
		}finally {
			pstmt.close();
			resultSet.close();
		}
		return null;
	}//searchOne method

	
	//readOne method
	private void readOne(ResultSet resultSet) throws SQLException {
		System.out.println("번호\t 제목\t 작성자\t 작성일\t 수정일");
		while (resultSet.next()) {
			System.out.print(resultSet.getInt("BNO") + "\t");
			System.out.print(resultSet.getString("BTITLE") + "\t");
			System.out.print(resultSet.getString("BWRITER") + "\t");
			System.out.print(resultSet.getDate("BDATE") + "\t");
			System.out.print(resultSet.getDate("BUPDATE") + "\t");
		}
	}//readOne method

	
	
	public void commment() {

	}

	public void delete() {
		System.out.println("삭제가 완료되었습니다.");
		binDAO.insert();
	}

	public void reply() {
		// TODO Auto-generated method stub

	}
	
	
	//insert method
	public void insert(boardDTO boardDTO, MemberDTO session) throws SQLException {
		try {
			String sql = "INSERT INTO BOARD (BNO, BTITLE, BCONTENT, MNO)"
					+ "VALUES (BOARD_SEQ.NEXTVAL, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getbTitle());
			pstmt.setString(2, boardDTO.getbContent());
			pstmt.setInt(3, boardDTO.getMno());
			result = pstmt.executeUpdate();
			if (result > 0) {
				System.out.println("게시글 입력이 완료되었습니다.");
				System.out.println("========="+ session.getNick()+"님의 게시물 목록=========");
				searchBoard(session.getNick());
			}else {
				System.out.println("게시물을 올리지 못했습니다.");
			}
		} catch (SQLException e) {
			System.out.println("check insert method of BoardDAO");
		}finally {
			pstmt.close();
		}
	}//insert method

	public void update(boardDTO boardDTO, MemberDTO session) {
		
		
	}
}
