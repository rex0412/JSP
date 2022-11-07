package common;

import javax.servlet.ServletContext;

// DAO = Data Access Object : DB의 데이터에 접근하는 객체. CRUD 작업 수행
public class MemberDAO extends JDBConnect {

	// DB에 연결이 완료된 상태의 DAO 객체가 생성
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	public MemberDAO(ServletContext application) {
		super(application);
	}


	// 로그인 처리 (id, pw값과 일치하는 회원 정보 반환)
	public MemberDTO2 login(String uid, String upass) {

		String sql = "SELECT * FROM member where id=? AND pass=?";

		MemberDTO2 dto = new MemberDTO2();
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setRegidate(rs.getString("regidate"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;

	}

	public int deleteUser(String uid, String upass) {
		String sql = "DELETE FROM member where id=? AND pass=?";
		int result = 0;

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, uid);
			psmt.setString(2, upass);

			result = psmt.executeUpdate();
			System.out.println(result + "개의 데이터가 삭제되었습니다");

			
			/*
			 * if (result == 0) {
			 * [값(아이디 비밀번호)이 틀림 (삭제가 안됨)]
			 * return 0;
			 * }
			 * 
			 * if (result == 1) {
			 * [값(아이디 비밀번호)이 맞으면 삭제 (삭제 됨)]
			 * return 1;
			 * }
			 */
			 

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;

	}
}