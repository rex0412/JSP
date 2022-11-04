package common;

// DAO = Data Access Object : DB의 데이터에 접근하는 객체. CRUD 작업 수행
public class MemberDAO extends JDBConnect {
	
	// DB에 연결이 완료된 상태의 DAO 객체가 생성
	public MemberDAO(String drv, String url, String id, String  pw) {
		super(drv, url, id, pw);
	}
	
	// 로그인 처리 (id, pw값과 일치하는 회원 정보 반환)
	public MemberDTO2 getMemberDTO(String uid, String upass) {
		MemberDTO2 dto = new MemberDTO2();
		
		String sql = "SELECT * FROM member where id=? AND pass=?";
		
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
}
