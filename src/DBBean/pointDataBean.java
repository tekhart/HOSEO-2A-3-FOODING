package DBBean;

import java.sql.Timestamp;

public class pointDataBean {
	int num;
	String owner;
	int pointadjest;
	String adjestreason;
	Timestamp reg_date;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public int getPointadjest() {
		return pointadjest;
	}
	public void setPointadjest(int pointadjest) {
		this.pointadjest = pointadjest;
	}
	public String getAdjestreason() {
		return adjestreason;
	}
	public void setAdjestreason(String adjestreason) {
		this.adjestreason = adjestreason;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
