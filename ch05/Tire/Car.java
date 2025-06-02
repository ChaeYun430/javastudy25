package ch05.tire;

public class Car {

Tire[] tire = {new Tire(5, "좌측 앞"), new Tire(10, "좌측 뒤"), new Tire(15, "우측 앞"), new Tire(20, "우측 뒤")}
	// 배열을 만들어 관리하면 인덱스로 표현이 되기 때문에 대입이나 제어문에서 활용하기 매우 쉽다.

int run(){
 	if(tire[0].roll == flase){
 	return 0;
 }	else if (tire[1].roll == flase){
 	return 1;
 }else if(tire[2].roll == flase){
 	return 2;
 }else if(tire[3].roll == flase){
 return 3;
 }
}

}
