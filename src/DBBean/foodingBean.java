package DBBean;

import java.sql.*;
import java.util.*;

public class foodingBean {

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
			String jdbcUrl="jdbc:mysql://localhost:3306/fooding_db";
			String dbId="foodingid";
			String dbPass="foodingpw";
			
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
	
	String nkname="";
	String id="";
	String passwd="";
	String repasswd="";
	String email="";
	String addrnum="";
	String detailaddr="";
	String select="";
	
	public void setAll(String nkname,String id,String passwd,String repasswd,String email,String addrnum,String detailaddr,String select) {
		this.nkname=nkname;
		this.id=id;
		this.passwd=passwd;
		this.repasswd=repasswd;
		this.email=email;
		this.addrnum=addrnum;
		this.detailaddr=detailaddr;
		this.select=select;
	}
	public String getNkname() {
		return nkname;
	}

	public void setNkname(String nkname) {
		this.nkname = nkname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getRepasswd() {
		return repasswd;
	}

	public void setRepasswd(String repasswd) {
		this.repasswd = repasswd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddrnum() {
		return addrnum;
	}

	public void setAddrnum(String addrnum) {
		this.addrnum = addrnum;
	}

	public String getDetailaddr() {
		return detailaddr;
	}

	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	
	public String getSelect() {
		return select;
	}

	public void setSelect(String select) {
		this.select = select;
	}

}
