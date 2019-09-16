package DBBean;

import java.sql.*;
import java.util.*;

import ch13.board.BoardDBBean;
import ch13.board.BoardDataBean;

public class foodingDataBean {
	
	String nkname="";
	String id="";
	String passwd="";
	String repasswd="";
	String email="";
	String addrnum="";
	String address="";
	String detailaddr="";
	
	String nknamecheck="";
	String idcheck="";
	String passwdcheck="";
	String repasswdcheck="";
	String emailcheck="";
	
	int num;
	String title;
	String contury;
	String foodtype;
	String ingredients;
	String tools;
	String writerid;
	Timestamp reg_date;
	int readcount;
	String content;
	
	public void setAll(String nkname,String id,String passwd,String repasswd,String email,
			String addrnum,String address,String detailaddr,String nknamecheck,String idcheck,
			String passwdcheck,String repasswdcheck,String emailcheck) {
		this.nkname=nkname;
		this.id=id;
		this.passwd=passwd;
		this.repasswd=repasswd;
		this.email=email;
		this.addrnum=addrnum;
		this.address=address;
		this.detailaddr=detailaddr;
		this.nknamecheck=nknamecheck;
		this.idcheck=idcheck;
		this.passwdcheck=passwdcheck;
		this.repasswdcheck=repasswdcheck;
		this.emailcheck=emailcheck;
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

	public String getNknamecheck() {
		return nknamecheck;
	}

	public void setNknamecheck(String nknamecheck) {
		this.nknamecheck = nknamecheck;
	}

	public String getIdcheck() {
		return idcheck;
	}

	public void setIdcheck(String idcheck) {
		this.idcheck = idcheck;
	}

	public String getPasswdcheck() {
		return passwdcheck;
	}

	public void setPasswdcheck(String passwdcheck) {
		this.passwdcheck = passwdcheck;
	}

	public String getRepasswdcheck() {
		return repasswdcheck;
	}

	public void setRepasswdcheck(String repasswdcheck) {
		this.repasswdcheck = repasswdcheck;
	}

	public String getEmailcheck() {
		return emailcheck;
	}

	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}

	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContury() {
		return contury;
	}
	public void setContury(String contury) {
		this.contury = contury;
	}
	public String getFoodtype() {
		return foodtype;
	}
	public void setFoodtype(String foodtype) {
		this.foodtype = foodtype;
	}
	public String getIngredients() {
		return ingredients;
	}
	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}
	public String getTools() {
		return tools;
	}
	public void setTools(String tools) {
		this.tools = tools;
	}
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	
}
