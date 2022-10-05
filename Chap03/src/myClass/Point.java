package myClass;

public class Point {
	
	public int x; // X좌표
	public int y; // Y좌표
	
	public Point(){ // 입력 파라미터가 없는 생성자 시작
		this.x = 0;
		this.y = 0;
	} // 생성자 종료
	
	public Point (int x, int y) { // 입력 파라미터가 존재하는 생성자  시작
		this.x = x;
		this.y = y;
	} // 생성자 종료
	
	public int getX() { // getX 메서드 시작
		return x;
	} // 메서드 종료
	
	public void setX(int x) { // setX 메서드 시작
		this.x = x;
	} // 메서드 종료
	
	public int getY() { // getY 메서드 시작
		return y;
	} // 메서드 종료
	
	public void setY(int y) { // setY 메서드 시작
		this.y = y;
	} // 메서드 종료
	
} // Point 클래스 종료
