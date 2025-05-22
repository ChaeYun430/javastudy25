package ch03;

import java.util.Scanner;

public class VendingMachineChaeYun {

	public static void main(String[] args) {

		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);
		int price = 0, cash = 100000, count = 0;
		int[] selled = new int[10000];
		int stockPlus = 0, deleteitem = 0, cashInOut = 0;
		String[] preitems = null;
		int[][] preiteminfos = null;

		// 초기값
		System.out.println("==========음료 자판기========");
		System.out.println("메뉴를 선택해 주세요.");
		String[] items = { "사이다", "제로 사이다", "콜라", "제로 콜라" };
		int[][] iteminfos = { { 800, 900, 1000, 1100 }, { 10, 12, 31, 26 } };
		printItem(items, iteminfos);

		String[] basketStr = new String[99];
		int[][] basketInt = new int[2][99];

		boolean run2 = false;
		boolean run1 = true;
		while (run1) {
			if (run2 == true) {
				System.out.println("==========음료 자판기========");

				System.out.println("메뉴를 선택해 주세요.");
				printItem(items, iteminfos);
			} // if
			run2 = false;

			System.out.print(">>>>>");
			int menu = scInt.nextInt();
			if (menu == 1234) {
				System.out.println("=============관리자 모드============.");
				String[] manages = { "1. 상품관리", "2. 정산", "3. 시스템 관리" };
				printmenu(manages);
				System.out.print(">>>>>");
				int select = scInt.nextInt();
				switch (select) {
				case 1:
					System.out.println("==========상품 관리=========");
					String[] itemManages = { "1. 상품 추가", "2. 재고 현황", "3. 가격 수정", "4. 재고 수정", "5. 상품 삭제" };
					printmenu(itemManages);

					System.out.println("메뉴를 선택하세요.");
					System.out.print(">>>>>");
					select = scInt.nextInt();
					switch (select) {
					case 1:
						printItem(items, iteminfos);
						System.out.println("추가하실 상품 종류의 수를 입력해주세요.");
						stockPlus = scInt.nextInt();
						preitems = new String[items.length];
						preiteminfos = new int[2][items.length];
						for (int i = 0; i < items.length; i++) {
							preitems[i] = items[i];
							preiteminfos[0][i] = iteminfos[0][i];
							preiteminfos[0][i] = iteminfos[0][i];
						}
						items = new String[stockPlus];
						items = inputItems(preitems, stockPlus);
						iteminfos = new int[2][stockPlus];
						iteminfos = inputinfos(preiteminfos, stockPlus);
						break;
					case 2:
						printItem(items, iteminfos);
						break;
					case 3:
						printItem(items, iteminfos);
						iteminfos = changePrice(iteminfos);
						break;
					case 4:
						printItem(items, iteminfos);
						iteminfos = changePrice(iteminfos);
						break;
					case 5:
						printItem(items, iteminfos);
						deleteitem();
						break;

					}// switch (select)-1. 상품관리
					break;
				case 2:
					System.out.println("==========자금 관리=========");
					String[] cashManages = { "1. 정산내역", "2. 현금 입금", "3. 현금 출금" };
					printmenu(cashManages);

					System.out.println("메뉴를 선택하세요.");
					select = scInt.nextInt();
					switch (select) {
					case 1 -> profit(selled, count);
					case 2 -> cash = cashIn(cash, cashInOut);
					case 3 -> cash = cashOut(cash, cashInOut);
					}
					break;

				case 3:
					System.out.println("==========시스템 관리=========");
					String[] systemManages = { "1. 전원 off", "2. 전원 off & on" };
					printmenu(systemManages);

					System.out.println("메뉴를 선택하세요.");
					select = scInt.nextInt();
					switch (select) {
					case 1:
						System.out.println("자판기 전원이 꺼집니다.");
						run1 = false;
					case 2:
						System.out.println("자판기 전원이 꺼집니다.");
						System.out.println("=================");
						System.out.println("=================");
						System.out.println("자판기 전원이 켜집니다.");
						break;
					}
					break;

				default:
					System.out.println("사용자 모드로 돌아갑니다.");
					continue;
				}// switch 관리자 모드

				run1 = true;
			} else if (1 <= menu && menu <= items.length) {
				sell(menu, items, iteminfos, basketStr, basketInt, cash, selled, count);
				run1 = true;
			} else {
				System.out.println("오류가 발생했습니다.\n메뉴를 다시 한 번 선택해주세요.");
				System.out.println("관리자 전화번호:031-0000-0000");
				run1 = true;
			}

		} // while(run1)

	} // main method

//다용도 메서드============================================================================

	static void printItem(String[] items, int[][] iteminfos) {
		for (int i = 0; i < items.length; i++) {
			System.out.println((i + 1) + ". " + items[i] + " " + iteminfos[0][i] + "원");
		}
	}// printItem method

	static void printmenu(String[] menus) {
		for (int i = 0; i < menus.length; i++) {
			System.out.println(menus[i]);
		}
	}// printmenu method

	static void deleteitem(String[] items, int[][] iteminfos) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("삭제하실 상품 번호를 입력해주세요.");
		int deleteitem = scInt.nextInt();

		String[] preitems = new String[items.length];
		int[][] preiteminfos = new int[2][items.length];
		for (int i = 0; i < items.length; i++) {
			preitems[i] = items[i];
			preiteminfos[0][i] = iteminfos[0][i];
			preiteminfos[0][i] = iteminfos[0][i];
		}
		items = new String[preitems.length - 1];
		items = deleteItems(preitems, deleteitem);
		iteminfos = new int[2][preiteminfos.length - 1];
		iteminfos = deleteinfos(preiteminfos, deleteitem);
	}// deleteitem method

//관리자 모드용 메서드(case1)======================================================================

	static String[] inputItems(String[] preitems, int stockPlus) {

		Scanner scStr = new Scanner(System.in);
		String[] newitems = new String[preitems.length + stockPlus];

		System.out.println("추가하실 상품명을 입력해주세요.");
		for (int i = 0; i < preitems.length - stockPlus; i++) {
			newitems[i] = preitems[i];
		}
		for (int i = preitems.length; i < preitems.length + stockPlus; i++) {
			System.out.print((i + 1) + ". ");
			newitems[i] = scStr.nextLine();
		}
		return newitems;
	}// inputItems method

	static int[][] inputinfos(int[][] preiteminfos, int stockPlus) {
		Scanner scInt = new Scanner(System.in);
		int[][] newiteminfos = new int[2][preiteminfos[0].length + stockPlus];
		for (int i = 0; i < preiteminfos[0].length; i++) {
			newiteminfos[0][i] = preiteminfos[0][i];
			newiteminfos[1][i] = preiteminfos[1][i];
		}
		System.out.println("추가하실 상품의 가격, 재고를 입력해주세요.");
		for (int i = preiteminfos[0].length; i < preiteminfos[0].length + stockPlus; i++) {
			System.out.print("가격: ");
			newiteminfos[0][i] = scInt.nextInt();
			System.out.print("재고: ");
			newiteminfos[1][i] = scInt.nextInt();
		}
		return newiteminfos;
	}// inputinfos method

	static int[][] changePrice(int[][] iteminfos) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("변경할 상품을 선택해주세요.");
		int select = scInt.nextInt();
		System.out.println("변경하실 상품의 가격을 입력해주세요.");
		iteminfos[0][select - 1] = scInt.nextInt();
		return iteminfos;
	}// changePrice method

	static int[][] changestock(int[][] iteminfos) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("변경할 상품을 선택해주세요.");
		int select = scInt.nextInt();
		System.out.println("변경하실 상품의 수량을 입력해주세요.");
		iteminfos[1][select - 1] = scInt.nextInt();
		return iteminfos;
	}// changestock method

	static String[] deleteItems(String[] items, int deleteitem) {
		Scanner scInt = new Scanner(System.in);
		Scanner scStr = new Scanner(System.in);

		items[deleteitem - 1] = null;

		for (int i = deleteitem - 1; i < items.length - 1; i++) {
			items[i] = items[i + 1];
		}

		return items;
	}// deleteItems method

	static int[][] deleteinfos(int[][] iteminfos, int deleteitem) {

		iteminfos[0][deleteitem - 1] = 0;
		iteminfos[1][deleteitem - 1] = 0;

		for (int i = deleteitem - 1; i < iteminfos.length; i++) {
			iteminfos[0][i] = iteminfos[0][i + 1];
			iteminfos[1][i] = iteminfos[0][i + 1];
		}
		return iteminfos;
	}// deleteinfos method

//관리자 모드용 메서드(case2)======================================================================

	static void profit(int[] selled, int count) {
		for (int i = 0; i < count; i++) {
			System.out.println((i + 1) + ". " + selled[i]);
		}
	}// profit method

	static int cashIn(int cash, int cashInOut) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("현재 자판기 내 잔액: " + cash);
		System.out.println("현금 얼마를 충전하시겠습니까?");
		cashInOut = scInt.nextInt();
		cash += cashInOut;
		System.out.println("현재 자판기 내 잔액: " + cash);
		return cash;
	}// cashIn method

	static int cashOut(int cash, int cashInOut) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("현재 자판기 내 잔액: " + cash);
		System.out.println("현금 얼마를 충전하시겠습니까?");
		cashInOut = scInt.nextInt();
		cash -= cashInOut;
		System.out.println("현재 자판기 내 잔액: " + cash);
		return cash;
	}// cashOut method

//사용자 모드용 메서드 ======================================================================================

	static boolean printbasket(String[] basketStr, int[][] basketInt) {
		Scanner scInt = new Scanner(System.in);

		System.out.println("===============장바구니 목록==============");
		for (int j = 0; j < basketStr.length; j++) {
			int eachTotalPrice = basketInt[1][j] * basketInt[0][j];
			System.out.println((j + 1) + ". " + basketStr[j] + "  수량: " + basketInt[1][j] + "  총액: " + eachTotalPrice);
		}

		String[] basketManages = { "1. 상품 삭제", "2. 상품 추가", "3. 구매하기", "4. 처음으로" };
		printmenu(basketManages);
		System.out.println("메뉴를 선택하세요.");
		System.out.print(">>>>>");
		int select = scInt.nextInt();
		switch (select) {
		case 1:
			deleteitem(basketStr, basketInt);
			return false;
		case 2:
			System.out.println("상품 선택화면으로 돌아갑니다.");
			return false;
		case 3:
			return true;
		case 4:

			return false;
		}

	}// printbasket method

	static int[] sell(int menu, String[] items, int[][] iteminfos, String[] basketStr, int[][] basketInt, int cash,
			int[] selled, int count) {
		Scanner scInt = new Scanner(System.in);
		System.out.println(items[menu - 1] + "를 선택하셨습니다.");
		System.out.println(iteminfos[0][menu - 1] + "원 입니다.");
		System.out.println("장바구니에 담으시겠습니까?");
		System.out.println("1.예\n2.아니오");
		int select = scInt.nextInt();
		if (select == 1) {
			basketStr[menu - 1] = items[menu - 1];
			basketInt[0][menu - 1] = iteminfos[0][menu - 1];
			basketInt[1][menu - 1] = 0;
			System.out.println("수량 선택: 1. +1\t2. -1\n3. 그대로");

			boolean run4 = true;
			while (run4) {
				switch (select) {
				case 1 -> basketInt[1][menu - 1]++;
				case 2 -> basketInt[1][menu - 1]--;
				case 3 -> run4 = false;
				}
			} // while (run4)
			System.out.println("1. 계속 상품 선택하기");
			System.out.println("2. 장바구니 보기");
			System.out.print(">>>>>");
			select = scInt.nextInt();
			cash=0;
			switch (select) {
			case 1:
				return cash;
			case 2:

				if (printbasket(basketStr, basketInt) == true) {

					if (pay(menu, items, iteminfos, cash, selled, count) == true) {
						System.out.println("상품을 수령해주세요. <" + items[menu - 1] + ">");
						return cash;

					} else {
						System.out.println("결제 중 오류가 발생했습니다.\n처음으로 돌아갑니다.");
						return cash;
					}
				} else {
					return cash;
				}

			}// switch
		} else {
			return cash;
		} // if (select)

	}// sell method

	static boolean pay(int menu, String[] items, int[][] iteminfos, int cash, int[] selled, int count) {
		Scanner scInt = new Scanner(System.in);
		System.out.println("지불 방식을 선택해주세요.");
		System.out.println("1. 현금 \n2. 체크카드");

		System.out.print(">>>>");
		int key = scInt.nextInt();
		switch (key) {
		case 1:
			System.out.println("현금을 넣어주세요.");
			return cash(menu, items, iteminfos, cash, selled, count);// cash method 호출
		case 2:
			System.out.println("카드를 넣어주세요.");
			return card(menu, items, iteminfos, cash, selled, count);// card method 호출
		default:
			System.out.println("지불 방식을 다시 한 번 확인해주세요.");
			System.out.println("관리자 전화번호:031-0000-0000");
			return false;
		}// switch (key)
	}// pay method

	static boolean cash(int menu, String[] items, int[][] iteminfos, int cash, int[] selled, int count) {
		System.out.println("========현금 투입구=======");
		Scanner scInt = new Scanner(System.in);
		int incash = scInt.nextInt();
		if (incash >= iteminfos[0][menu - 1]) {
			cash = cash + iteminfos[0][menu - 1];
			selled[count] = iteminfos[0][menu - 1];
			count++;
			System.out.println("계산이 완료되었습니다.");
			System.out.println("반환 : " + (incash - iteminfos[0][menu - 1]));
			return true;
		} else {
			System.out.println("지불하신 금액이 부족합니다.");
			System.out.println("반환 : " + incash + "원");
			return false;
		}
	}// cash method

	static boolean card(int menu, String[] items, int[][] iteminfos, int cash, int[] selled, int count) {
		System.out.println("========체크카드 투입구=======");
		System.out.println("현재 잔액을 입력해 주세요.");
		Scanner scInt = new Scanner(System.in);
		int incash = scInt.nextInt();
		if (incash >= iteminfos[0][menu - 1]) {
			cash = cash + iteminfos[0][menu - 1];
			selled[count] = iteminfos[0][menu - 1];
			count++;
			System.out.println("계산이 완료되었습니다. 카드를 빼주세요.");
			System.out.println("영수증을 출력하시겠습니까?");
			System.out.println("1. 예 \n2. 아니오");
			System.out.print(">>>>>");
			int key = scInt.nextInt();
			switch (key) {
			case 1:
				System.out.println("===========음료 자판기 영수증=========");
				System.out.println("상품명: " + items[menu - 1]);
				// 수량은 추후에
				System.out.println("결제액: " + iteminfos[0][menu - 1] + "원");
				System.out.println("=================================");
				return true;
			default:
				return true;
			}
		} else {
			System.out.println("오류가 발생했습니다.");
			System.out.println("결제를 취소합니다.");
			cash = cash - iteminfos[0][menu - 1];
			return false;
		}
	}// card method
}// class
