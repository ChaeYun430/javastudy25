package ch04.marioCart.dto;

public class MemberDTO {
	
	public int mno;
	public String id, pw, email, nick, level;
	public static CharacterDTO[] characterDTOs;
	public static CartDTO[] cartDTOs;
	public static mapDTO[] mapDTOs;
	
	//스케너용
	public MemberDTO() {
		
	}
	//게스트 기본값용
	public MemberDTO(int mno, String id, String pw, String email, String nick) {
		this.mno = mno;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.nick = nick;
	}	
}
