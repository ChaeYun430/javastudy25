package ch04;

import java.util.Scanner;

public class Member {

	//필드
	public int mno;
	public String name, id, pw, email;
	
	//생성자
	public Member() {
	}
	
	//메서드
	public Member memberAdd(int i, int bound) {
		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);
		
		Member member = new Member();
		member.mno = i+bound+1;
		System.out.print("회원번호: "+ mno);
		System.out.print("이름: ");
		member.name = scStr.next();
		System.out.print("id: ");
		member.id = scStr.next();
		System.out.print("pw: ");
		member.pw = scStr.next();
		System.out.println("email: ");
		member.email = scStr.next();
		//이메일 뒷주소 검증도 하고 싶음...미뤄
		System.out.println("========================회원가입 완료========================");
		System.out.println("회원번호 "+ mno + "번 " + name + "님의 회원 정보입니다." );
		System.out.println("id: "+ id + " | pw: " + pw + " | email: " + email);
		return member;
	}//memberAdd method
	
	public void memberReadAll(Member[] members) {
		for (int i = 0; i < members.length; i++) {
			System.out.println("===================" + (i+1) + "번 회원====================");
			System.out.println("성명: " + members[i].name + " | id: "+ members[i].id + " | email: " + members[i].email);
		}
	}//memberReadAll method
	
	public Member memberLogin() {
	
	}
	
	public Member memberUpdate() {
	
	}
	
	public 	Member memberdelete() {
	
	}

	public int idToMno(Member[] members) {
		
		
	}
	
}
