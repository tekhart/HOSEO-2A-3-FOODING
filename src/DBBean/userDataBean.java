package DBBean;

import java.sql.Timestamp;

public class userDataBean {
	String nkname;
	String id;
	String passwd;
	String email;
	String addrnum;
	String address;
	String detailaddr;
	String gender;
	Timestamp reg_date;
	int mileage;
	int isAdmin;
	String userface;
	int isLeft;
	
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
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getUserface() {
		return userface;
	}
	public void setUserface(String userface) {
		this.userface = userface;
	}
	public int getIsLeft() {
		return isLeft;
	}
	public void setIsLeft(int isLeft) {
		this.isLeft = isLeft;
	}
}
