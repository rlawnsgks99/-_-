package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


public class Test {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public Test() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/musthave?useSSL=false&characterEncoding=UTF-8&serverTimezone=UTC";
			String user = "root";   // 대체로 root
			String pwd = "qwer1234";     // 설치할 때 설정했던 비밀번호
			con = DriverManager.getConnection(url, user, pwd);
			
			System.out.println("DB Connection Success");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if (rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC Disconnection!");
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}