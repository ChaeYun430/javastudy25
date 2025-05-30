package test1_250529.dto;

public class ScoreDTO {
	private int kor;
	private int math;
	private int eng;
	private int sci;
	private int total;
	private double avg;
	private int rank;
	
	public ScoreDTO(int kor, int math, int eng, int sci) {
		super();
		this.kor = kor;
		this.math = math;
		this.eng = eng;
		this.sci = sci;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getSci() {
		return sci;
	}

	public void setSci(int sci) {
		this.sci = sci;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal() {
		this.total = kor + math + eng + sci;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg() {
		
		this.avg = total/4;
	}
	
	
	
	
	
}
