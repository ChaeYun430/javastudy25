package boardtest.dto;

import java.util.Date;

public class BoardDTO {
	private int bno;
	private String bTitle;
	private String bContent;
	private int mno;
	private Date bDate;
	private Date bUpDate;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public Date getbUpDate() {
		return bUpDate;
	}
	public void setbUpDate(Date bUpDate) {
		this.bUpDate = bUpDate;
	}
	
	
}
