package ch04.marioCart.SV;

public class TimeSV {
	public int beforeTime;
	public int afterTime;
	
	public int before() {
		beforeTime = (int)System.currentTimeMillis()/1000;
		return beforeTime;
	}
	
	public int after() {
		afterTime = (int)System.currentTimeMillis()/1000;
		return afterTime;
	}
	
	public int timeDifference(int beforeTime, int afterTime) {
		
		int diff = afterTime - beforeTime;
		
		return diff;
	}
	
	public boolean deleteItem(int diff) {
		if (diff>=5) {
			return true;
		}else {
			return false;
		}
	}
}
