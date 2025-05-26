package ch04.car;

public class Num {
	public String[] numks	= {"가","나","다","라","마","거","너","더","머","버","서","어","저","고","노","도","로","모","보","소","오","조","구","누","두","루","무","부","수","우","주"};
	public int num1;
	public String num2;
	public int num3;
	
	public Num() {
		num1= (int)Math.random()*900 + 100 ;
		num2 = numks[(int)Math.random()*29+1];
		num3= (int)Math.random()*9900 + 1000;
	}
	
	public Num make() {
		Num num = new Num();
		num.num1= (int)(Math.random()*99) + 100 ;
		num.num2 = numks[(int)(Math.random()*29)+1];
		num.num3= (int)(Math.random()*9900) + 1000;
		return num;
	}
	public void numPrint(Num num) {
		System.out.println(num.num1+num.num2+" "+num.num3);
	}

}
