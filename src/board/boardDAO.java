//DAO 쿼리 처리

package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class boardDAO {
	String url = "jdbc:mysql://54.180.225.111:3306/user";
	String id = "lhj6276"; /*db name*/
	String pw = "1234"; /*db pw*/
	String driver = "com.mysql.jdbc.Driver";
	
	
	//게시글 목록 조회
	public ArrayList<boardDTO> getlist(int page, String field, String query) {
		System.out.println("page : " + page);
		System.out.println("field : " + field);
		System.out.println("query : " + query);
		int start = 1 + (page - 1) * 10;
		int end = 10 * page;
		String sql = "select *  "
				+ 		"from (select @rownum:=@rownum+1 as p_num, n.*  "
				+ "			from (select * from board"
				+ "			where available = 1 "
				+ "			and "+field+" like ? "
				+ "			order by regdate desc) n, "
				+ "		 (select @rownum:=0)row) t "
				+ "	where t.p_num between ? and ?";
		ArrayList<boardDTO> list = new ArrayList<boardDTO>();
		
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+query+"%");
			psmt.setInt(2, start);
			psmt.setInt(3, end);
			System.out.println("sql : " + psmt);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				boardDTO bt = new boardDTO();
				bt.setNum(rs.getInt("num"));
				bt.setTitle(rs.getString("title"));
				bt.setUserid(rs.getString("userid"));
				bt.setRegdate(rs.getDate("regdate"));
				bt.setHit(rs.getInt("hit"));
				list.add(bt);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//총 페이지 수
	public int getCount(String field, String query) {
		int count = 0;
		
		String sql = "select count(t.num) as cnt  "
				+ 		"from (select @rownum:=@rownum+1 as p_num, n.*  "
				+ "			from (select * from board "
				+ "			where available = 1 "
				+ "			and "+field+" like ? "
				+ "			order by regdate desc) n, "
				+ "		 (select @rownum:=0)row) t ";
		ArrayList<boardDTO> list = new ArrayList<boardDTO>();
		
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, "%"+query+"%");
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt("cnt");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
	
	//게시글 조회
	public boardDTO getContent(int num) {
			String sql = "select * from board where num = ?";
			boardDTO bt = null;
			
			try {
				Class.forName(driver);
				Connection con = DriverManager.getConnection(url,id,pw);
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, num);
				System.out.println(psmt);
				ResultSet rs = psmt.executeQuery();
				
				if(rs.next()) {		
					bt = new boardDTO();
					bt.setNum(rs.getInt("num"));
					bt.setTitle(rs.getString("title"));
					bt.setUserid(rs.getString("userid"));
					bt.setRegdate(rs.getDate("regdate"));
					bt.setContent(rs.getString("content"));
					bt.setHit(rs.getInt("hit"));
					System.out.println(rs.getInt("num"));
					System.out.println(rs.getString("userid"));
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return bt;
		}
	
	
	//게시글 조회수
	public void addHit(int hit, int num) {
		String sql = "update board set hit = ? 	where num = ?";
		int result = 0;
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setInt(1, hit+1);
			psmt.setInt(2, num);
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<boardDTO> getrelist(String proID) {
		String sql = "select b.title as title, b.userid as userid, b.regdate as regdate, b.star as star, b.content as content,  p.proTitle as proTitle"
				+ "		from board b, "
				+ "	 	(select proID, proTitle "
				+ "       from product "
				+ "	  	  where proID = ? )p "
				+ "	    where b.proID = p.proID ";

		ArrayList<boardDTO> list = new ArrayList<boardDTO>();
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, proID);
			System.out.println(psmt);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {		
				boardDTO bt = new boardDTO();
				bt.setTitle(rs.getString("title"));
				bt.setUserid(rs.getString("userid"));
				bt.setRegdate(rs.getDate("regdate"));
				bt.setStar(rs.getInt("star"));
				bt.setContent(rs.getString("content"));
				bt.setProTitle(rs.getString("proTitle"));
				list.add(bt);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	//게시글 작성
	public int writeContent(String userid, String title, String content) {
		String sql = "insert into board (title,userid,content) values(?,?,?);";
		int result = 0;
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1,title);
			psmt.setString(2,userid);
			psmt.setString(3,content);
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//게시글 수정
	public int updateContent(int num, String title, String content) {
		String sql = "update board set title = ?, content = ? where num = ?";
		int result = 0;
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, title);
			psmt.setString(2, content);
			psmt.setInt(3, num);
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	//게시글 삭제
	public int delContent(int num) {
		String sql = "update board set available = 2 where num = ?";
		int result = 0;
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setInt(1, num);
			result = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
}
