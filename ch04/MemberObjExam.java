package ch04;

import java.util.Scanner;

import ch02.ForChaeYun;

public class MemberObjExam {

	public static void main(String[] args) {
		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);
		
		Member member = new Member(); //객체의 메서드 호출용
		Member[] members = new Member[0]; //데이터 저장용
		//객체 생성...보류
		//P:기존 배열과 추가, 삭제 시 배열 교체 작업 안 꼬이게.............
	
		
		boolean run1 = true;
		while (run1) {
			System.out.println("=========회원관리 메뉴=========");
			String[] membership = { "1. 회원 가입", "2. 전체 회원 보기", "3. 로그인", "4. 회원 정보 수정", "5. 회원 탈퇴", "그외는 시스템 종료" };
			printmenu(membership);
			int select = scInt.nextInt();
			switch (select) {
			case 1:
				System.out.println("가입하실 회원 수를 선택해주세요.");
				System.out.print(">>>");
				int count = scInt.nextInt();
				int bound = members.length;
				Member[] temp1 = new Member[bound];
				Member[] add = new Member[count]; 
				for(int i= 0; i < count; i++) {
					add[i] = member.memberAdd(i, bound);
				}
				members = new Member[bound+count];
				for (int i = 0; i < bound; i++) {
					members[i]= temp1[i];
				}
				for (int i = 0; i < count; i++) {
					members[bound]=add[i];
				}
				System.out.println();
				break;
			case 2:
				System.out.println("<<<전체 회원 정보 열람>>>");
				member.memberReadAll(members);
				System.out.println();
				break;
			case 3:
				
				break;
			case 4:

				break;
			case 5:
				System.out.println("탈퇴하실 회원 번호 또는 id를 입력해주세요.");
				int delete = scInt.nextInt();
				members[delete] = null;
				member.idToMno(members);
				Member[] temp2 = new Member[members.length-1];
				for (int i = 0; i < temp2.length; i++) {
					
				}
				break;
			default:
				System.out.println("시스템을 종료합니다.");
				run1 = false;
			}//switch
		}//while
	
		
	}//main method



	static void printmenu(String[] menu) {
		for(String i : menu) {
			System.out.println(i);
		}
		System.out.print(">>>");
	}//printmenu method

}
