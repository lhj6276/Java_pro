package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
	String url = "jdbc:mysql://54.180.225.111:3306/user";
	String id = "lhj6276"; /*db name*/
	String pw = "1234"; /*db pw*/
	String driver = "com.mysql.jdbc.Driver";
	
	public int login(String userid, String userpw) {
		System.out.println("ID - " + userid);
		System.out.println("PW - " + userpw);
		String sql = "select pw from member where id = ?";
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1,userid);
			System.out.println(psmt);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userpw)) {
					return 1; //로그인 성공
				}else {
					return 0; //pw 틀림
				}
			}
			
			return -1; //가입되지 않음
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -2; //db 오류
	}
	
	
	public int join(userDTO ut) {
		String sql = "insert into member (id, pw, name, email) values (?,?,?,?)";
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, ut.getUserid());
			psmt.setString(2, ut.getUserpw());
			psmt.setString(3, ut.getUsername());
			psmt.setString(4, ut.getUseremail());
			
			return psmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return -1; //db 오류

	}
	
	
	public String getSecurity(String userid) {
		System.out.println("getSecurity"+userid );
		String security = "";
		System.out.println("ID - " + userid);
		String sql = "select security from member where id = ?";
		
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url,id,pw);
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, userid);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()) {
				security = rs.getString("security");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return security;
	}
	
	
}
