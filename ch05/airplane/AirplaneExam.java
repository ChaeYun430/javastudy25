package ch05.airplane;

public class AirplaneExam{

public static void main(String[] args){

SuperSonicAirplane sonic = new SuperSonicAirplane();

sonic.takeOff();

sonic.fly(sonic.flyMode);

sonic.flyMode = sonic.SUPERSONIC;

sonic.fly(sonic.flyMode);

sonic.flyMode = sonic.NORMAL;

sonic.fly(sonic.flyMode);

sonic.land();

}
}