package DBBean;

import java.sql.Timestamp;

public class askDataBean {
	int id;
	String title;
	String writerid;
	String asktype;
	String content;
	String atteched;
	Timestamp reg_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	public String getAsktype() {
		return asktype;
	}
	public void setAsktype(String asktype) {
		this.asktype = asktype;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAtteched() {
		return atteched;
	}
	public void setAtteched(String atteched) {
		this.atteched = atteched;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
