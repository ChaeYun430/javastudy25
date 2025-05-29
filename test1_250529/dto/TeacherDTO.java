package test1_250529.dto;

public class TeacherDTO extends MemberDTO{
	private String subjects;

	public TeacherDTO(String name, String pw, String grade, String classRoom, String subjects) {
		super(name, pw, grade, classRoom);
		this.subjects = subjects;
	}

	public String getSubjects() {
		return subjects;
	}
	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}
	
}
