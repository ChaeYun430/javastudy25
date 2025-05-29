package test1_250529.dto;

public class StudentDTO extends MemberDTO{
	
	private String stuNum;
	private ScoreDTO scoreDTO;
	private String studentId = this.getGrade()+ this.getClassRoom()+ stuNum;
	
	public StudentDTO(String name, String pw, String grade, String classRoom, String stuNum) {
		super(name, pw, grade, classRoom);
		this.stuNum = stuNum;
		this.scoreDTO = new ScoreDTO(0, 0, 0, 0);
	}
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}
	public String getStuNum() {
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		stuNum = stuNum;
	}
	public ScoreDTO getScoreDTO() {
		return scoreDTO;
	}
	public void setScoreDTO(ScoreDTO scoreDTO) {
		this.scoreDTO = scoreDTO;
	}
}
