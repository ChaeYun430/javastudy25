package ch04.studyClass;

public class Getter_Setter {
	
	//필드
	private String name; 
	
	//Getter : 내부의 필드에 저장된 값을 외부로 리턴...출구만 있다!!
	public String getname() {
		return name;
	}
	
	//Setter : 외부로부터 데이터를 전달 받아 필드에 저장...입구만 있다.
	public void setname(String name) {
		this.name = name;
	}
	
}
