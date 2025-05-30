package test1_250529.dto;

public class StudentDTO extends MemberDTO{
	
	private String stuNum;
	private ScoreDTO scoreDTO;
	private String studentId;
	
	public StudentDTO(String name, String pw, String grade, String classRoom, String stuNum) {
		super(name, pw, grade, classRoom);
		this.stuNum = stuNum;
		this.scoreDTO = new ScoreDTO(0, 0, 0, 0);
	}
	
	
	public String getStudentId() {
		return studentId;
	}
	public void setStudentId(String grade, String classRoom, String stuNum) {
		if (stuNum.length()<2) {
			stuNum = "0" + stuNum;
		}
		if (classRoom.length()<2) {
			classRoom = "0" + classRoom;
		}
		
		this.studentId = grade + classRoom + stuNum;
	}
	public String getStuNum() {
		
		return stuNum;
	}
	public void setStuNum(String stuNum) {
		this.stuNum = stuNum;
	}
	public ScoreDTO getScoreDTO() {
		return scoreDTO;
	}
	public void setScoreDTO(ScoreDTO scoreDTO) {
		this.scoreDTO = scoreDTO;
	}
}
