
public class Sangil extends Student {

	public static void main(String[] args) {
		
		Student std01 = new Student();
		
		std01.setGrade(2);
		std01.setName("��¹�");
		System.out.println(std01.getGrade());
		System.out.println(std01.getName());
		std01.setName("�趯��");
		String UserNmae = std01.getName();
		
		Student std02 = new Student();
		std02.setGrade(1);
		std02.setName("ȫ�浿");
		

	}

}
