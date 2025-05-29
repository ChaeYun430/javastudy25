package test1_250529.dto;

public class MemberDTO {
	private String name; 
	private String pw;
	private String grade;
	private String classRoom;
	
	public MemberDTO(String name, String pw, String grade, String classRoom) {
		super();
		this.name = name;
		this.pw = pw;
		this.grade = grade;
		this.classRoom = classRoom;
	}
	
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getClassRoom() {
		
		return classRoom;
	}
	public void setClassRoom(String classRoom) {
		if (classRoom.length()<2) {
			this.classRoom = "0" + classRoom;
		}
		
		this.classRoom = classRoom;
	}


}
