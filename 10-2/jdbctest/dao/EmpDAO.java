package jdbctest.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.lang.model.element.ExecutableElement;

public class EmpDAO {

	public void insert(String name, String dept, double score) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		int result = 0;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC", "JDBC");
			stmt = conn.createStatement();
			String sql = "INSERT INTP EMP (NUM, NAME, DEPT, SCORE) VALUES (EMP_SEQ.NEXTVAL, '" + name + "', '" + dept
					+ "', '" + score + "'";
			System.out.println("sql문  검증: " + sql);
			result = stmt.executeUpdate(sql);

			if (result > 0) {
				System.out.println(result + "행의  데이터를  추가했습니다.");
				conn.commit();

			} else {
				System.out.println("입력 실패오 rollback됩니다.");
				conn.rollback();

			}
			// 드라이브를 불러옴
			// conn 객체에서 연결
			// stmt에 conn의 연결 상태 전달
			// sql을 받아 stmt의 상태 업데이트 실행
			// 그 결과를 result에 담음
		} catch (ClassNotFoundException e) {
			System.out.println("ojdbc6.jar가 없거나 forName의 문자열이 잘못되었습니다.");
			e.getStackTrace();

		} catch (SQLException e) {
			System.out.println("URL이나  ID, PW, QUERY문을 확인해주세요");
			e.getStackTrace();

		} finally {
			System.out.println("연결 해제");
			conn.close();
			System.out.println("실행 상태 정지");
			stmt.close();

		}
	}

	public void searchEach(String inputName) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet resultSet = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC", "JDBC");
			stmt = conn.createStatement();
			String sql = "SELECT NUM, NAME, DEPT, SCORE FROM EMP WHERE NAME  = '" + inputName + "' ORDER BY  NUM";
			System.out.println("sql문  검증: " + sql);
			resultSet = stmt.executeQuery(sql);

			while (resultSet.next()) {
				// 표에 행이 있으면 참, 행이 없으면 거짓
				System.out.println("NUM\t NAME\t DEPT\t SCORE");
				System.out.print(resultSet.getInt("NUM") + "\t");
				System.out.print(resultSet.getString("NAME") + "\t");
				System.out.print(resultSet.getString("DEPT") + "\t");
				System.out.println(resultSet.getDouble("SCORE") + "\t");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("ojdbc6.jar가 없거나 forName의 문자열이 잘못되었습니다.");
			e.getStackTrace();

		} catch (SQLException e) {
			System.out.println("URL이나  ID, PW, QUERY문을 확인해주세요");
			e.getStackTrace();

		} finally {
			System.out.println("로그  초기화");
			resultSet.close();
			System.out.println("연결 해제");
			conn.close();
			System.out.println("실행 상태 정지");
			stmt.close();

		}
	}

	public void searchAll() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet resultSet = null;

		try {
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "JDBC", "JDBC");
			stmt = conn.createStatement();
			String sql = "SELECT NUM, NAME, DEPT, SCORE FROM EMP ORDER BY  NUM";
			System.out.println("sql문  검증: " + sql);
			resultSet = stmt.executeQuery(sql);

			while (resultSet.next()) {
				// 표에 행이 있으면 참, 행이 없으면 거짓
				System.out.println("NUM\t NAME\t DEPT\t SCORE");
				System.out.print(resultSet.getInt("NUM") + "\t");
				System.out.print(resultSet.getString("NAME") + "\t");
				System.out.print(resultSet.getString("DEPT") + "\t");
				System.out.println(resultSet.getDouble("SCORE") + "\t");
			}
		} catch (ClassNotFoundException e) {
			System.out.println("ojdbc6.jar가 없거나 forName의 문자열이 잘못되었습니다.");
			e.getStackTrace();

		} catch (SQLException e) {
			System.out.println("URL이나  ID, PW, QUERY문을 확인해주세요");
			e.getStackTrace();

		} finally {
			System.out.println("로그  초기화");
			resultSet.close();
			System.out.println("연결 해제");
			conn.close();
			System.out.println("실행 상태 정지");
			stmt.close();

		}
	}

	public void update(String dept, double score) {
		// TODO Auto-generated method stub
		
	}

	public void delete() {
		// TODO Auto-generated method stub
		
	}
	

}
