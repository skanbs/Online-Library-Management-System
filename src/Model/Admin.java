package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import DataBase.PostgreSQLAccess;

public class Admin {


	private int Userid; 

	private String password;
	private String active ;
	private String admin  ;
	private String username;
	private String email;


	public Admin() {
	
	}

	public Admin(int Userid, String password, String active, String admin, String username, String email) {
		this.Userid = Userid;
		this.password = password;
		this.active = active;
		this.admin = admin;
		this.username = username;
		this.email = email;
		
	}
	

	
	public static Admin AdminperEmailPassword(String email, String password) throws SQLException {

		String sql = "select * from admin where email = ? and password = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, email);
		prep.setString(2, password);
		ResultSet dbRes = prep.executeQuery();
		if (dbRes.next()) {
			return new Admin(dbRes.getInt("userid"),dbRes.getString("password"),dbRes.getString("active"),dbRes.getString("admin"), dbRes.getString("username"), dbRes.getString("email"));
		}
		else return null;
		
		
	}
	
	public static boolean SearchAdminperEmail(String email, String password) throws SQLException {

		String sql = "select * from admin where email= ? and password = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, email);
		prep.setString(2, password);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();
	

	}


	public static boolean DeleteAdmin(String email) throws SQLException {

		String sql = "delete from admin where email = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setString(1, email);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}


	public static boolean InsertAdmin(String password, String username, String email) throws SQLException {

		String sql = "insert into admin (password, username, email) values (?,?,?)";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, password);
		prep.setString(2, username);
		prep.setString(3, email);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static Vector<Admin> getAll() throws SQLException {

		Vector<Admin> Vectoradmin = new Vector<Admin>();
		Vectoradmin.clear(); // ??
		String sql = "select * from admin ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while (dbRes.next()) {
			Admin A = new Admin(dbRes.getInt("userid"),
					 			dbRes.getString("password"),
								dbRes.getString("active"),
								dbRes.getString("admin"),
								dbRes.getString("username"),
								dbRes.getString("email"));
			Vectoradmin.add(A);
		}
		return Vectoradmin;
	}

	public static boolean updateAdmin(String email, String admin ) throws SQLException {

		String sql = "update admin Set admin = ? where  email = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, admin);
		prep.setString(2, email);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}
	public static boolean updateActive(String email, String activ ) throws SQLException {

		String sql = "update admin Set active = ? where  email = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, activ);
		prep.setString(2, email);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getUserid() {
		return Userid;
	}

	public void setUserid(int userid) {
		Userid = userid;
	}
	

	
}
