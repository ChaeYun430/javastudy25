package boardtest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

import boardtest.dto.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pstmt  =  null;
	ResultSet resultSet =  null;
	int  result = 0;
	
	//constructor
	public MemberDAO() {
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
	
	//insert method
	public void insert(MemberDTO memberDTO) {
		try {
			String sql = "INSERT INTO BMEMBER (MNO, ID, PW, NICK, PHONE)"
					+ "VALUES(BOARD_SEQ, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getPw());
			pstmt.setString(3, memberDTO.getNick());
			pstmt.setString(4, memberDTO.getPhone());
			System.out.println("다음과 같이 회원가입이 완료되었습니다.");
		} catch (SQLException e) {
			System.out.println("check insert method of MemberDAO");
			e.printStackTrace();
		}
	}//insert method

	
	//readAll method
	public void readAll() throws SQLException {
		try {
			String sql = "SELECT MNO, NICK, PHONE, REGIST, CTL, ACTIVE FROM BMEMBER ORGER BY REGIST";
			pstmt = conn.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			System.out.println("회원번호\t 닉네임\t 전화번호\t 가입일\t 회원분류\t 활성화 상태");
			while (resultSet.next()) {
				System.out.print(resultSet.getString("MNO")+"\t");
				System.out.print(resultSet.getString("NICK")+"\t");
				System.out.print(resultSet.getString("PHONE")+"\t");
				System.out.print(resultSet.getDate("REGIST")+"\t");
				System.out.print(resultSet.getString("CTL")+"\t");
				System.out.print(resultSet.getBoolean("ACTIVE"));
			}
		} catch (SQLException e) {
			System.out.println("check readAll method of MemberDAO");
			e.getStackTrace();
		}finally {
			pstmt.close();
			resultSet.close();
		}
	}//readAll method
	
	
	//readOne
	
	
}
