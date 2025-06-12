package boardtest.dto;

import java.util.Date;

public class MemberDTO {
	private int mno;
	private String id;
	private String pw;
	private String nick;
	private String phone;
	private Date regist;
	private Date update;
	private String ctl;
	
	
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegist() {
		return regist;
	}
	public void setRegist(Date regist) {
		this.regist = regist;
	}
	public String getCtl() {
		return ctl;
	}
	public void setCtl(String ctl) {
		this.ctl = ctl;
	}
	
	
}
