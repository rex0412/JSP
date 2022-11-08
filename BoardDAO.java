package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

/*
 * Map : {키key : 값Value} 쌍
 * 유저가 선택한 필드 : 제목 / 작성자
 * 유저가 입력한 키워드 : ______
 * Map<키 데이터 형식, 값 데이터형식> 자료 이름
 * 
 * 
 * 자료이름.put(키) = 값;
 * 자료이름.get(키) != null;
 */

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}

	// 1. board 테이블에 저장된 게시물의 개수를 반환 : selectCount()
	// 유저가 검색을 희망하는 필드 searchField(제목 / 작성자)에 어떤 데이터 searchWord(검색 키워드)가 저장되어있는지 전달을
	// 받아야함
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board";
		// 만약 유저가 검색 키워드를 무언가라도 입력했다면
		if (map.get("searchWord") != null) {
			// "WHERE 컬럼명 LIKE 조건"
			// "WHERE searchField LIKE searchWord를 포함하는가 '%searchField%'"
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord" + "%'");
		}

		// LIKE 구문 : 부분적으로 일치하는 요소
		// select * from board where like[조건]

		// 제목이 A로 시작하는 요소 찾기
		// select * from board where title LIKE 'A%'

		// 제목이 A로 끝나는 요소 찾기
		// select * from board where title LIKE '%A'

		// 제목에 A를 포함하는 요소 찾기
		// select * from board where title LIKE '%A%A'

		// 제목이 A로 시작하지 않는 요소 찾기
		// select * from board where title LIKE '[^A]'

		// 제목이 A로 시작하며, 제목이 2글자인 요소 찾기
		// select * from board where title LIKE 'A_'

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			rs.next();
			totalCount = rs.getInt(1); // 인덱스 값

		} catch (Exception e) {
			e.printStackTrace();
		}

		return totalCount;
	}
	// 2. board 테이블의 레코드(저장된 데이터)를 가져와서 반환 : selectList()

	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "SELECT * FROM board";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " " + " LIKE '%" + map.get("searchWord" + "%'");
		}

		query += " ORDER BY num DESC ";

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);

			while (rs.next()) {
				// BoardDTO안에 데이터를 넣은 뒤, 그 객체를 bbs에 넣기
				BoardDTO dto = new BoardDTO();

				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("Content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회 중 예외 발생");
		}

		return bbs;
	}
}
