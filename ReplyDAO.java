package model1.board;

import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class ReplyDAO extends JDBConnect {
	public ReplyDAO(ServletContext application) {
		super (application);
	}
	
	public List<ReplyDTO> selectReplies(String num){
		List<ReplyDTO> rList = new Vector<ReplyDTO>();
		String query = "SELECT * FROM reply";
		try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		while (rs.next()) {
		ReplyDTO dto = new ReplyDTO();
		dto.setR_num(rs.getString("r_num"));
		dto.setContent(rs.getString("content"));
		dto.setId(rs.getString("id"));
		dto.setNum(rs.getString("num"));
		dto.setPostdate(rs.getDate("postdate"));
		rList.add(dto);
		}
		}catch(Exception e) {
		e.printStackTrace();
		}
		return rList;
		}
	
	public int insertReply(ReplyDTO dto) {
		int result = 0;
		String sql = "INSERT INTO reply VALUES(seq_reply_rnum.nextval, ?, ?, sysdate, ?)";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getContent());
		psmt.setString(2, dto.getId());
		psmt.setString(3, dto.getNum());
		result = psmt.executeUpdate();
		}
		catch(Exception e) {
		e.printStackTrace();
		}
		return result;
		}
	
	public ReplyDTO selectReply(String r_num) {
		ReplyDTO dto = new ReplyDTO();
		String sql = "SELECT * FROM reply WHERE r_num=?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,r_num);
		rs = psmt.executeQuery();
		if(rs.next()) {
		dto.setR_num(rs.getString("r_num"));
		dto.setContent(rs.getString("content"));
		dto.setId(rs.getString("id"));
		dto.setNum(rs.getString("num"));
		dto.setPostdate(rs.getDate("postdate"));
		}
		} catch(Exception e) {
		e.printStackTrace();
		}
		return dto;
		}
	
	public int updateReply(ReplyDTO dto) {
		int result = 0;
		String sql = "UPDATE reply SET content=? WHERE r_num=?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1,dto.getContent());
		psmt.setString(2, dto.getR_num());
		result = psmt.executeUpdate();
		}catch(Exception e) {
		e.printStackTrace();
		}
		return result;
		}
	
	public int deleteReply(ReplyDTO dto) {
		int result = 0;
		String sql = "DELETE FROM reply WHERE r_num=?";
		try {
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, dto.getR_num());
		result = psmt.executeUpdate();
		}catch(Exception e) {
		e.printStackTrace();
		}
		return result;
		}

}
