package DBBean;

import java.sql.*;
import java.util.*;

public class foodingBean {

	Connection con=null;
	Statement stmt=null;
	ResultSet rs=null;
	String str=null;
	
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
	
	public void nonResultQuery(String sql) {
		try {
			stmt=con.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
		}catch(Exception e) {
			System.out.println("notResultQuery Error 2");
		}
	}
	
	public String findnkname(String id) {
		try {
			stmt=con.createStatement();
			rs=stmt.executeQuery("select nkname from user where id='"+id+"';");
			if(rs.next()) {
				str=rs.getString("nkname");
			}
		}catch(Exception e) {
			System.out.println("Result Error");
			rs=null;
			str="";
		}
		return str;
	}
	public void DBclose() {
		stmtClosing();
		resultclosing();
		DBClosing();
	}
	public void stmtClosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
	public void resultclosing() {
		try {
			rs.close();
		}catch(Exception e) {}
	}
	
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
	String address="";
	String detailaddr="";
	String slct="";
	
	public void setAll(String nkname,String id,String passwd,String repasswd,String email,String addrnum,String address,String detailaddr,String slct) {
		this.nkname=nkname;
		this.id=id;
		this.passwd=passwd;
		this.repasswd=repasswd;
		this.email=email;
		this.addrnum=addrnum;
		this.address=address;
		this.detailaddr=detailaddr;
		this.slct=slct;
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
	
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetailaddr() {
		return detailaddr;
	}

	public void setDetailaddr(String detailaddr) {
		this.detailaddr = detailaddr;
	}
	
	public String getSlct() {
		return slct;
	}

	public void setSlct(String slct) {
		this.slct = slct;
	}

}
