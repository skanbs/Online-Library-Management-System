package DataBase;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.PreparedStatement;
import java.sql.SQLException;

public abstract class JDBCAccess {

	Connection dbConn;
	String dbDrivername;
	String dbURL;
	String dbUser;
	String dbPassword;
	String dbSchema;
	
	public JDBCAccess() throws NoConnectionException{
		this.setDBParms();
		this.createConnection();
		this.setSchema();
	}
	public abstract void setDBParms();
	public void setSchema() throws NoConnectionException {
		try{	
			String sql = "SET SCHEMA '" + dbSchema + "'";
			dbConn.createStatement().executeUpdate(sql);
		}catch(SQLException se){
			se.printStackTrace();
			throw new NoConnectionException();
		}
	}
	public void createConnection() throws NoConnectionException{
		try{
			Class.forName(dbDrivername);
		
			dbConn = DriverManager.getConnection(
												dbURL,
												dbUser,
												dbPassword
												);
		}catch(Exception e){
			e.printStackTrace();
			throw new NoConnectionException();
		}
	}
	public Connection getConnection() throws NoConnectionException {
		try{
			this.setSchema();
			return dbConn;
		}catch(SQLException se){
			se.printStackTrace();
			throw new NoConnectionException();
		}
	}

}
