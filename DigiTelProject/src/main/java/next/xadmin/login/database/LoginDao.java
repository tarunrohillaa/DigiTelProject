package next.xadmin.login.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import next.xadmin.login.bean.LoginBean;

public class LoginDao {

	private String dbUrl = "jdbc:mysql://localhost:/mydb1";
	private String dbUname = "root";
	private String dbPassword = "1@Rootpassword";
	private String dbDriver = "com.mysql.cj.jdbc.Driver";
	public void loadDriver(String dbDriver)
	{
		try {
			Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public Connection getConnection()
	{
		Connection con = null;
		try {
			con = (Connection) DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	public boolean validate(LoginBean loginBean) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		boolean status = false;
		
		String sql= "select * from login where username = ? and password=?";
		
		PreparedStatement ps;
		try {
			ps =((java.sql.Connection) con).prepareStatement(sql);
			ps.setString(1, loginBean.getUsername());
			ps.setString(2, loginBean.getPassword());
			
		ResultSet rs = ps.executeQuery();
		status= rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	
	public boolean validate1(LoginBean loginBean) {
		loadDriver(dbDriver);
		Connection con = getConnection();
		boolean status = false;
		
		String sql= "select * from userlogin where email = ? and password=?";
		
		PreparedStatement ps;
		try {
			ps =((java.sql.Connection) con).prepareStatement(sql);
			ps.setString(1, loginBean.getEmail());
			ps.setString(2, loginBean.getPassword());
			
		ResultSet rs = ps.executeQuery();
		status= rs.next();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return status;
		
	}
	
	
}
