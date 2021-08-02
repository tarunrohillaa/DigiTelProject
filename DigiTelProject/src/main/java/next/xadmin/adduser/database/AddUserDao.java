package next.xadmin.adduser.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import next.xadmin.adduser.bean.AddUserBean;

public class AddUserDao {

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
	
	public int AddUser(AddUserBean AddUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = " INSERT INTO userlogin " + " (NAME, TELENUMBER, EMAIL, PASSWORD) VALUES " + " (?, ?, ?, ?) ";

		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, AddUserBean.getName());
			ps.setString(2, AddUserBean.getTelenumber());
			ps.setString(3, AddUserBean.getEmail());
			ps.setString(4, AddUserBean.getPassword());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public int AddAdmin(AddUserBean addUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		
		String sql = " INSERT INTO login " + " (NAME, TELENUMBER, EMAIL, PASSWORD) VALUES " + " (?, ?, ?, ?) ";
		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getName());
			ps.setString(2, addUserBean.getTelenumber());
			ps.setString(3, addUserBean.getEmail());
			ps.setString(4, addUserBean.getPassword());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	public boolean UpdateUser(AddUserBean addUserBean) throws SQLException
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "update userlogin set NAME = ?, TELENUMBER = ?, EMAIL = ?, PASSWORD = ?  where EMAIL = ? and PASSWORD = ? ";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getName());
			ps.setString(2, addUserBean.getTelenumber());
			ps.setString(3, addUserBean.getEmail());
			ps.setString(4, addUserBean.getPassword());
			status = ps.executeUpdate() > 0;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	
	public boolean ValidateEmail(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from userlogin where EMAIL=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getEmail());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	public boolean ValidateTele(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from userlogin where TELENUMBER=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getTelenumber());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

	public boolean ValidateAdminEmail(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from login where EMAIL=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getEmail());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}
	public boolean ValidateAdminTele(AddUserBean addUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from login where TELENUMBER = ?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, addUserBean.getTelenumber());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

}
