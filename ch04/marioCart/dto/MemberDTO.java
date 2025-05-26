package ch04.marioCart.dto;

public class MemberDTO {
	
	public int mno;
	public String id, pw, email, nick, level;
	public static CharacterDTO[] characterDTOs;
	public static CartDTO[] cartDTOs;
	public static mapDTO[] mapDTOs;
	
	
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public static CharacterDTO[] getCharacterDTOs() {
		return characterDTOs;
	}
	public static void setCharacterDTOs(CharacterDTO[] characterDTOs) {
		MemberDTO.characterDTOs = characterDTOs;
	}
	public static CartDTO[] getCartDTOs() {
		return cartDTOs;
	}
	public static void setCartDTOs(CartDTO[] cartDTOs) {
		MemberDTO.cartDTOs = cartDTOs;
	}
	public static mapDTO[] getMapDTOs() {
		return mapDTOs;
	}
	public static void setMapDTOs(mapDTO[] mapDTOs) {
		MemberDTO.mapDTOs = mapDTOs;
	}
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
