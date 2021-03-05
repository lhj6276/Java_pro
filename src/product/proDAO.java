package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class proDAO {
	String url = "jdbc:mysql://54.180.225.111:3306/user";
	String id = "lhj6276"; /*db name*/
	String pw = "1234"; /*db pw*/
	String driver = "com.mysql.jdbc.Driver";
	
	
	public ArrayList<proDTO> getProlist() {
		String sql = "select * from product";
		ArrayList<proDTO> list = new ArrayList<proDTO>();
		
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				proDTO pt = new proDTO();
				pt.setProID(rs.getString("proID"));
				pt.setProTitle(rs.getString("proTitle"));
				pt.setStar(rs.getInt("star"));
				pt.setImg(rs.getString("img"));
				pt.setWirter(rs.getString("writer"));
				pt.setRegdate(rs.getDate("regdate"));
				pt.setContent(rs.getString("content"));
				pt.setSub_content(rs.getString("sub_content"));
				list.add(pt);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	
	
	public proDTO getDetail(String proID) {
		String sql = "select * from product where proID = ?";
		proDTO pt = null;
		
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, proID);
			ResultSet rs = psmt.executeQuery();
			
			while(rs.next()) {
				 pt = new proDTO();
				pt.setProID(rs.getString("proID"));
				pt.setProTitle(rs.getString("proTitle"));
				pt.setStar(rs.getInt("star"));
				pt.setImg(rs.getString("img"));
				pt.setWirter(rs.getString("writer"));
				pt.setRegdate(rs.getDate("regdate"));
				pt.setContent(rs.getString("content"));
				pt.setSub_content(rs.getString("sub_content"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pt; 
	}
}
