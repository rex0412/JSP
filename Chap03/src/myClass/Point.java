package myClass;

public class Point {
	
	public int x; // X��ǥ
	public int y; // Y��ǥ
	
	public Point(){ // �Է� �Ķ���Ͱ� ���� ������ ����
		this.x = 0;
		this.y = 0;
	} // ������ ����
	
	public Point (int x, int y) { // �Է� �Ķ���Ͱ� �����ϴ� ������  ����
		this.x = x;
		this.y = y;
	} // ������ ����
	
	public int getX() { // getX �޼��� ����
		return x;
	} // �޼��� ����
	
	public void setX(int x) { // setX �޼��� ����
		this.x = x;
	} // �޼��� ����
	
	public int getY() { // getY �޼��� ����
		return y;
	} // �޼��� ����
	
	public void setY(int y) { // setY �޼��� ����
		this.y = y;
	} // �޼��� ����
	
} // Point Ŭ���� ����
