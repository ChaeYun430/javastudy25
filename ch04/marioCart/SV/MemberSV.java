package ch04.marioCart.SV;

import java.util.Scanner;

import ch04.marioCart.dto.MemberDTO;
import ch04.member.Member;

public class MemberSV {
	
	
	//MemberSV 타입의 객체를 만들지 않아도 호출 가능한 메서드
	public static MemberDTO[] memberMenu(Scanner scInt, Scanner scStr, MemberDTO[] memberDTOs) {
		boolean run2 = true;
		while (run2) {
			System.out.println("=========회원관리 메뉴=========");
			String[] membership = { "1. 회원 가입", "2. 로그인", "3. 회원 정보 수정", "4. 회원 탈퇴", "시스템 종료" };
			for (String i : membership) {
				System.out.println(i);
			}
			System.out.print(">>>");
			String select = scStr.next();
			switch (select) {
			case "1":
				System.out.println("=======회원가입======");
				// 새로운 MemberDTO타입의 객체를 만들어 필드를 불러오고 값을 입력 받음
				MemberDTO memberDTO = new MemberDTO();
				System.out.print("id: ");
				memberDTO.id = scStr.next();
				System.out.print("pw: ");
				memberDTO.pw = scStr.next();
				System.out.print("email: ");
				memberDTO.email = scStr.next();
				System.out.print("nick: ");
				memberDTO.nick = scStr.next();

				for (int i = 1; i < memberDTOs.length; i++) {
					if (memberDTOs[i] == null) {
						memberDTOs[i] = memberDTO;
						return memberDTOs;
					}
				}

			case "2":
				String inputID = scStr.next();
				String inputPW = scStr.next();
				for (int i = 0; i < memberDTOs.length; i++) {
					if (inputID == memberDTOs[i].id && inputPW == memberDTOs[i].pw) {
						System.out.println("로그인이 완료되었습니다.");
						break;
					} 
				}
				System.out.println("입력하신 회원 정보가 없습니다.");
				break;
				
			case "3":
				System.out.println("정보를 수정하실 계정의 닉네임 또는 id를 입력해주세요.");
				String update = scStr.next();
				int i;
				for (i=0; i < memberDTOs.length; i++) {
					if (memberDTOs[i].id == update) {
						break;
					} else if (memberDTOs[i].nick == update) {
						break;
					}
				}
				System.out.println("해당 계정의 비밀 번호를 입력해주세요.");
				inputPW = scStr.next();
				if (memberDTOs[i].pw == inputPW) {
					System.out.println("=========회원 정보 수정=======");
					System.out.print("id: ");
					memberDTOs[i].id = scStr.next();
					System.out.print("pw: ");
					memberDTOs[i].pw = scStr.next();
					if (run2) {
						
					}else {
						System.out.println("설정하신 비밀번호와 일치하지 않습니다.");
						
					}
					System.out.print("email: ");
					memberDTOs[i].email = scStr.next();
					System.out.print("nick: ");
					memberDTOs[i].nick = scStr.next();
					System.out.println("========="+ memberDTOs[i].nick + "님의 회원 정보=======");
					System.out.println("id: "+ memberDTOs[i].id);
					System.out.println("email: "+ memberDTOs[i].email);
					
				}else {
					System.out.println("비밀번호가 일치하지 않습니다.");
					break;
				}
			case "4":
				System.out.println("탈퇴하실 계정의 닉네임 또는 id를 입력해주세요.");
				String delete = scStr.next();
				for (int j = 0; j < memberDTOs.length; j++) {
					if (memberDTOs[j].id == delete) {
						memberDTOs[j].id = null;
						break;
					} else if (memberDTOs[j].nick == delete) {
						memberDTOs[j].nick = null;
						break;
					}
				}

			default:
				System.out.println("시스템을 종료합니다.");
				run2 = false;
			}// switch
		} // while
		return memberDTOs;
	}//memberSV method
}