package next.xadmin.requestuser.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
//import java.sql.*;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import next.xadmin.adduser.bean.AddUserBean;
//import next.xadmin.login.bean.LoginBean;
import next.xadmin.requestuser.bean.RequestUserBean;
public class RequestUserDao {
	private String DbUrl = "jdbc:mysql://localhost:/mydb1";
	private String DbUser ="root";
	private String DbPassword = "1@Rootpassword";
	private String DbDriver = "com.mysql.cj.jdbc.Driver";
	
	
	Date date = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
    String currentDate = dateFormat.format(date);
	
	
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
	public int AddRequest(RequestUserBean requestUserBean) {
		loadDriver(DbDriver);
		Connection con = getConnection();
		

		String sql = " INSERT INTO userrequest " + " (NAME, TELENUMBER, STAGE, OWNER) VALUES " + " (?, ?, ?, ?) ";

		int rs = 0;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, requestUserBean.getName());
			ps.setString(2, requestUserBean.getTelenumber());
			ps.setString(3, requestUserBean.getStage());
			ps.setString(4, requestUserBean.getUsername());
			rs = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;

}
	
	public boolean ValidateTele(RequestUserBean requestUserBean)
	{
		loadDriver(DbDriver);
		Connection con = getConnection();
		String sql = "select * from USERREQUEST where TELENUMBER=?";
		boolean status = false;
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, requestUserBean.getTelenumber());
			
		ResultSet rs = ps.executeQuery();
		status = rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;
		
	}

}
