package boardtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Board_binDAO {
	
	Connection conn = null;
	Statement stmt =  null;
	PreparedStatement pstmt  =  null;
	ResultSet resultSet =  null;
	int  result = 0;
	
	public Board_binDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn  = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "BOARDTEST", "BOARDTEST");
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
	
	public void insert() {
		try {
			String sql = "INSERT INTO BOARD_BIN (BNUM, BTITLE, BCONTNET, BWRITER, BID, BDATE, BCUTDATE)"+
						"VALUES ("
		} catch (SQLException e) {
			
		}
	}
	
}
