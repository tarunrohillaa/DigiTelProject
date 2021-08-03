package next.xadmin.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import next.xadmin.login.bean.LoginBean;

public class LoginDao {

	private String DbUrl = "jdbc:mysql://localhost:/mydb1";
	private String DbUser ="root";
	private String DbPassword = "1@Rootpassword";
	private String DbDriver = "com.mysql.cj.jdbc.Driver";
	
	
	
	public void loadDriver(String DbDriver)
	{
		try {
			Class.forName(DbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Connection getConnection() {
		Connection con = null;
		
		try {
			con = DriverManager.getConnection(DbUrl, DbUser, DbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
		
	}
	public boolean validate(LoginBean loginBean) {
		// TODO Auto-generated method stub
		loadDriver(DbDriver);
		Connection con = getConnection();
		boolean status = false;
		
		String sql = "select EMAIL, PASSWORD from LOGIN where EMAIL = ? and PASSWORD = ?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, loginBean.getUsername());
			ps.setString(2, loginBean.getPassword());
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	public boolean validateTele(LoginBean loginBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		boolean status = false;
		
		String sql = "select TELENUMBER, PASSWORD from LOGIN where TELENUMBER = ? and PASSWORD = ?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, loginBean.getUsername());
			ps.setString(2, loginBean.getPassword());
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
	}
	public boolean userValidate(LoginBean loginBean) {

		loadDriver(DbDriver);
		Connection con = getConnection();
		
		boolean status = false;
		
		
		String sql = "select EMAIL, PASSWORD from USERLOGIN where EMAIL = ? and PASSWORD = ?";
		
		PreparedStatement ps;
		
		try {
			ps = con.prepareStatement(sql);
			
			ps.setString(1, loginBean.getUsername());
			ps.setString(2, loginBean.getPassword());
			
			ResultSet rs = ps.executeQuery();
			
			status = rs.next();
		   	
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	
	
	
	public boolean userValidateTele(LoginBean loginBean) {
		// TODO Auto-generated method stub
		loadDriver(DbDriver);
		Connection con = getConnection();
		boolean status = false;
		
		String sql = "select TELENUMBER, PASSWORD from USERLOGIN where TELENUMBER = ? and PASSWORD = ?";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, loginBean.getUsername());
			ps.setString(2, loginBean.getPassword());
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    String currentDate = dateFormat.format(date);
	
	public int lastLogin(LoginBean loginBean) {
		// TODO Auto-generated method stub
		
		loadDriver(DbDriver);
		Connection con = getConnection();
		ResultSet r1;
		int rs =0;
		PreparedStatement ps;
		PreparedStatement ps1;
		String sql2;
		String user = loginBean.getUsername();
		String data = "Select * from LASTLOGIN where USERNAME='"+user+"'";
		
		try {
			ps = con.prepareStatement(data);
			 r1= ps.executeQuery(data);
			 
			 if(r1.next()) {
					sql2= "UPDATE LASTLOGIN set LASTLOGINDATE = SYSTIMESTAMP where USERNAME=?";
				}
				else {
					
					sql2 = "INSERT INTO LASTLOGIN (USERNAME, LASTLOGINDATE) VALUES(?, SYSTIMESTAMP) ";
				}
			 ps1 = con.prepareStatement(sql2);
				ps1.setString(1, loginBean.getUsername());
				rs = ps1.executeUpdate();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
			
		return rs;
		
	
		
	}
	
	
	
	

}