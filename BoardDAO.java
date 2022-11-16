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
 * 자료이름.get(키) => 값이 존재하면 값 / 값이 없으면 null;
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

		String query = "SELECT board.*, (SELECT count(*) from reply where num=board.num) rCount FROM board";

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
				dto.setReplyCnt(rs.getInt("rCount"));

				bbs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("게시물 조회 중 예외 발생");
		}

		return bbs;
	}

	// 3. 게시물 데이터(title, content -> BoardDTO)를 전달받아 DB에 연결
	public int InsertWrite(BoardDTO dto) {
		int result = 0;
		String sql = "INSERT INTO BOARD VALUES (seq_board_num.nextval, ?, ?, ?, sysdate, 0)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			result = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			return result;
		}
		return result;

	}

	// 4. 게시물 제목 클릭 시 해당 게시물의 상세 내용을 보여주는, 즉 게시물의 내용을 반환하는 함수 selectView()
	// 게시물 구분방법 : 전달받은 num을 기준으로 board에서 검색 & id값을 기준으로 member table에서 name값을 함께
	// 가져와야 함!!!!!

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		String sql = "SELECT board.*, member.name FROM member INNER JOIN board ON board.id = member.id WHERE num=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				dto.setName(rs.getString("name"));

				return dto;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	// 5. 유저가 게시물을 클릭 시, 해당 게시물의 조회수(visitcount)를 1 증가시키는 updateVisitCount() 함수

	public void updateVisitCount(String num) {

		/* "UPDATE 테이블명 SET 컬럼 = 변결할 값 WHERE 조건"; */
		String sql = "UPDATE board SET visitcount = visitcount + 1 WHERE num=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, num);
			psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 6. 유저가 수정하고자 하는 게시물을 업데이트! (num을 기준으로 데이터를 조회, title, content값을 업데이트)
    // int updateEdit(BoardDTO)
    public int updateEdit(BoardDTO dto) {
        int result = 0;
        
        // num을 기준으로 title, content값 수정
        // "UPDATE 테이블명 SET 컬럼1 = 변경할값1, 컬럼2=변경할값2 WHERE 조건"
        String sql = "UPDATE board SET title=?, content=? WHERE num=?"; 
        
        try {
            psmt = conn.prepareStatement(sql);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());
            
            result = psmt.executeUpdate(); // 1 : update 성공, 0 : update 실패 (실행결과 -> DB에서 영향받은 줄 수)
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    // 7. 유저가 삭제하고자 하는 게시물 삭제! (num을 기준으로 삭제)
    public int deletePost(BoardDTO dto) {
    	int result = 0;
    	
    	// DELETE FROM 테이블명 WHERE 조건
    	String sql="DELETE FROM board WHERE num=? AND id=?";
    	
    	try {
    		
    		 psmt = conn.prepareStatement(sql); 
             psmt.setString(1, dto.getNum());
             psmt.setString(2, dto.getId());
             
            result = psmt.executeUpdate();
            
            return result;
    		
    	} catch (Exception e) {
    		e.printStackTrace();
    	}
		return result;
    }
    
    // 8. 각 페이지에서 출력할 게시물 데이터를 반환 : selectListPage()
 	// example. 1페이지 : 1~10번 게시물, 2페이지 : 11~20번 게시물
 	// "rownum" -> 가상의 컬럼, select 쿼리문으로 수출된 데이터(resultSet. 테이블) 내에서 순차적으로 부여되는 순번(num)
 	public List<BoardDTO> selectListPage(Map<String, Object> map) {
 		List<BoardDTO> bbs = new Vector<BoardDTO>();
 		
 		// 현재 선택된 페이지가 "1페이지" -> 1~10번 게시물을 가져와야 하는 상황!
 		// "SELECT * FROM (SELECT Tb.*, rownum rNum FROM (SELECT * FROM (SELECT * FROM board ORDER BY num DESC) Tb) WHERE rNum BETWEEN 1 and 10"
 		String sql = "SELECT * FROM (" + "SELECT Tb.*, rownum rNum FROM (SELECT * FROM board ";
 		
 		if (map.get("searchWord") != null) {
 			sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%'";
 		}
 		
 		sql += "ORDER BY num DESC) Tb) WHERE rNum BETWEEN ? and ?";
 		
 		// "SELECT * from (SELECT Tb.*, rownum rNum FROM board WHERE title/content LIKE '%검색키워드%' ORDER BY num DESC) Tb) WHERE rNum BETWEEN ? and ?"
 		
 		try {
 			
 			psmt = conn.prepareStatement(sql);
 			psmt.setString(1, map.get("start").toString());
 			psmt.setString(2, map.get("end").toString());
 			
 			rs = psmt.executeQuery();
 			
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
 		}
 		
 		return bbs;
 	}

}
