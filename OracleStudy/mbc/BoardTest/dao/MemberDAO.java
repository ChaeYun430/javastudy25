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
	
	
	//login method
		public MemberDTO login(MemberDTO session) throws SQLException {
			try {
				String sql = "SELECT * FROM BMEMBER WHERE ID = ? AND PW = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, session.getId());
				pstmt.setString(2, session.getPw());
				resultSet = pstmt.executeQuery();
				if (resultSet.next()) {
					session.setMno(resultSet.getInt("MNO"));
					session.setNick(resultSet.getString("NICK"));
					session.setPhone(resultSet.getString("PHONE"));
					session.setRegist(resultSet.getDate("regist"));
					session.setCtg(resultSet.getString("CTG"));
					return session;
				}
			} catch (SQLException e) {
				System.out.println("check login method of MemberDAO");
				e.printStackTrace();
			}finally {
				pstmt.close();
				resultSet.close();
			}
			System.out.println("id 또는 pw가 일치하지 않습니다.");
			return null;
		}//login method
	
	
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
			result = pstmt.executeUpdate();
			if (result>0) {
				System.out.println("다음과 같이 회원가입이 완료되었습니다.");
			}else {
				System.out.println("회원가입을 완료하지 못했습니다.");
			}

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
			e.printStackTrace();
		}finally {
			pstmt.close();
			resultSet.close();
		}
	}//readAll method
	
	//readOne method
	public void readOne(int detail) throws SQLException {
		try {
			String sql = "SELECT MNO, NICK, PHONE, REGIST, CTsL, ACTIVE FROM BMEMBER ORGER BY REGIST";
			pstmt = conn.prepareStatement(sql);
			resultSet = pstmt.executeQuery();
			System.out.println("회원번호\t 닉네임\t 전화번호\t 가입일\t 회원분류\t 활성화 상태");
			if (resultSet.next()) {
				System.out.print(resultSet.getString("MNO")+"\t");
				System.out.print(resultSet.getString("NICK")+"\t");
				System.out.print(resultSet.getString("PHONE")+"\t");
				System.out.print(resultSet.getDate("REGIST")+"\t");
				System.out.print(resultSet.getString("CTL")+"\t");
				System.out.print(resultSet.getBoolean("ACTIVE"));
			}
		} catch (SQLException e) {
			System.out.println("check readAll method of MemberDAO");
			e.printStackTrace();
		}finally {
			pstmt.close();
			resultSet.close();
		}
	}//readOne method

	public void update(MemberDTO session) throws SQLException {
		try {
			String sql = "UPDATE BMEMBER SET  WHERE ID = ?, PW =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setBoolean(1, false);
			pstmt.setString(2, session.getId());
			pstmt.setString(3, session.getPw());
			result = pstmt.executeUpdate();
			if (result>0) {
				System.out.println("휴면 계정으로 전환하였습니다.");
			}else {
				System.out.println("계정의 비활성화에 실패했습니다.");
			}
		} catch (SQLException e) {
			System.out.println("check accountLock method of MemberDAO");
			e.printStackTrace();
		}finally {
			pstmt.close();
		}
		
	}
	

	
	//accountLock method
	public void accountLock(MemberDTO session) throws SQLException {
		try {
			String sql = "UPDATE BMEMBER SET ACTIVE = ? WHERE ID = ?, PW =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setBoolean(1, false);
			pstmt.setString(2, session.getId());
			pstmt.setString(3, session.getPw());
			result = pstmt.executeUpdate();
			if (result>0) {
				System.out.println("휴면 계정으로 전환하였습니다.");
			}else {
				System.out.println("계정의 비활성화에 실패했습니다.");
			}
		} catch (SQLException e) {
			System.out.println("check accountLock method of MemberDAO");
			e.printStackTrace();
		}finally {
			pstmt.close();
		}
	}//accountLock method



	
}
