package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
		public Connection conn;
		public Statement stmt;
		public PreparedStatement psmt;
		public ResultSet rs;
		
		public DBConnPool() {
			try {
				Context initCtx = new InitialContext();
				Context ctx = (Context)initCtx.lookup("java:comp/env");
				DataSource source = (DataSource)ctx.lookup("dbcp_myoracle");
				
				conn = source.getConnection();
				
				System.out.println("DB 커넥션 풀 연결 성공!!!!!");
			} catch (Exception e) {
				System.out.println("DB 커넥션 풀 연결 실패 :(");
				e.printStackTrace();
			}
		}
		
		public void close() {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (psmt != null) psmt.close();
				if (conn != null) conn.close(); // 커넥션 풀에 자원 반납
				
				System.out.println("DB 커넥션 풀 자원 반납 성공!");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
