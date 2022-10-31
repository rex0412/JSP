package common;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

public class JDBConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {
		try {
			// DB연결! -> JDBC 드라이버 사용
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521";
			String id = "yeji";
			String pw = "1234";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 완료!!!!!!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (psmt != null) psmt.close();
			if (conn != null) conn.close();
			
			System.out.println("JDBC 자원 반납 완료~");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
