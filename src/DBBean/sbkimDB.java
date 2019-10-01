package DBBean;

import java.sql.*;
import java.util.*;

public class sbkimDB {

	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	//데이터베이스 접속 기능
	public void connect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch(Exception e) {
			System.out.println("Driver Loading Error");
		}
	
		try {
			String jdbcUrl="jdbc:mysql://localhost:3306/basicjsp";
			String dbId="jspid";
			String dbPass="jsppass";
			
			con=DriverManager.getConnection(jdbcUrl,dbId,dbPass);
		}catch (Exception e) {
			System.out.println("Connection Error");
		}
	}
	
	//결과를 가져와야할 질의 실행
	public ResultSet resultQuery(String sql) {
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery(sql);
		}catch(Exception e) {
			System.out.println("Result Error");
			rs=null;
		}
		return rs;
	}
	
	//결과가 필요없는 질의 실행
	public void nonResultQuery(String sql) {
		try {
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e) {
			System.out.println("notResultQuery Error 2");
		}
	}
	
	//stmt 닫기
	public void stmtClosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
	//rs 닫기
	public void resultclosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
	//db접속 끊기
	public void DBClosing() {
		try {
			con.close();
		}catch(Exception e) {}
	}
	}

