package ch04.studyClass;

public class Earth {
	
	static final double PI = Math.PI;
	static final double EARTH_RADIUS =6400;
	static final double EARTH_SUPER_AREA;
	
	static {
		EARTH_SUPER_AREA = 4 * PI * EARTH_RADIUS * EARTH_RADIUS;
	}
}
