package common;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection conn;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBConnect() {
		try {
			// DB연결! -> JDBC 드라이버 사용
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pw = "1234";
			
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 완료!!!!!!(생성자 버전 1)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(String Driver, String url, String id, String pw) {
		try {
			Class.forName(Driver);
			conn = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 완료(생성자 버전2)"); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("OracleDriver");
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, id, pw);
			
			System.out.println("DB 연결 완료! (생성자 버전 3)");
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
