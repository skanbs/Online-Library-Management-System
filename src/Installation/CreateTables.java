package Installation;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import DataBase.PostgreSQLAccess;

public class CreateTables {
	Connection dbConn;

	public CreateTables() throws SQLException {
		this.dbConn = new PostgreSQLAccess().getConnection();

		createTableOfAdmin();
		createTableOfPlace();
		createTableOfVisitor();
		createTableOfRservation();
		createTableOfMessages();
		insertFirstAdmin();
		insertSecondAdmin();
		insertThirdAdmin();
		insertFirstPlace();
		insertFirstVisitor();
		insertFirstReservation();
		insertFirstMessages();
	}

	public void createTableOfAdmin() throws SQLException {

		String sql = "DROP TABLE IF EXISTS admin CASCADE;" + "create table admin                ("
				+ "				userid   SERIAL  PRIMARY KEY," 
				+ "				password CHAR(32) NOT NULL            ,"
				+ "				active   CHAR(1)  NOT NULL DEFAULT 'N',"
				+ "				admin    CHAR(1)  NOT NULL DEFAULT 'N',"
				+ "				username VARCHAR(256)                 ,"
				+ "				email    VARCHAR(256)                 )";
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
	}

	public void createTableOfMessages() throws SQLException {

		String sql = "DROP TABLE IF EXISTS Messages CASCADE;" + "create table Messages                ("
				+ " Id   SERIAL  PRIMARY KEY," 
				+ " email VARCHAR(256)                 ,"
				+ " MSG    VARCHAR(750)                 )";
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
	}

	public void createTableOfPlace() throws SQLException {

		String sql = "DROP TABLE IF EXISTS place CASCADE;" + "create table place                ("
				+ "				ID  Serial  PRIMARY KEY," + "				NUM INT NOT NULL UNIQUE            ,"
				+ "				Available   INT DEFAULT 1)";
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
	}

	public void createTableOfVisitor() throws SQLException {

		String sql = "DROP TABLE IF EXISTS visitor CASCADE;" + "create table visitor                ("
				+ "				ID  Serial PRIMARY KEY," + "				Imma  INT Not NUll UNIQUE,"
				+ "				Psydo CHAR(30) Default 'Anonym'," + "				Fach CHAR(100) Not NULL)";
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
	}

	public void createTableOfRservation() throws SQLException {

		String sql = "DROP TABLE IF EXISTS reservation CASCADE;" + "create table reservation                ("
				+ "				ID  Serial PRIMARY KEY," + "				place INT ,"
				+ "				visitor INT ," + "				Day date NOT NULL,"
				+ "				expired INT Default 0,"
				+ "             FOREIGN KEY (place) REFERENCES place(Num) ON DELETE CASCADE,"
				+ "             FOREIGN KEY (visitor) REFERENCES visitor(Imma) ON DELETE CASCADE)";
		Statement stmt = this.dbConn.createStatement();
		stmt.executeUpdate(sql);
	}

	public void insertFirstAdmin() throws SQLException {
		String sql = "insert into admin " + "( password, active, admin, username, email) " + "values" + "(?,?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setString(1, "1234");
		prep.setString(2, "Y");
		prep.setString(3, "Y");
		prep.setString(4, "BayremTr");
		prep.setString(5, "bayrem.trabelsi@outlook.com");
		prep.executeUpdate();
	}

	public void insertSecondAdmin() throws SQLException {
		String sql = "insert into admin " + "( password, active, admin, username, email) " + "values" + "(?,?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setString(1, "1234");
		prep.setString(2, "Y");
		prep.setString(3, "Y");
		prep.setString(4, "AhmedAyadi");
		prep.setString(5, "Ahmed19ayadi@gmail.com");
		prep.executeUpdate();
	}

	public void insertThirdAdmin() throws SQLException {
		String sql = "insert into admin " + "( password, active, admin, username, email) " + "values" + "(?,?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setString(1, "1234");
		prep.setString(2, "Y");
		prep.setString(3, "Y");
		prep.setString(4, "ShaymaRebhi");
		prep.setString(5, "ShaymaRebhi15@gmail.com");
		prep.executeUpdate();
	}

	public void insertFirstPlace() throws SQLException {
		String sql = "insert into place " + "( NUM, Available) " + "values" + "(?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setInt(1, 1);
		prep.setInt(2, 0);
		prep.executeUpdate();
	}

	public void insertFirstVisitor() throws SQLException {
		String sql = "insert into visitor " + "(Imma, Psydo, Fach) " + "values" + "(?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setInt(1, 632996);

		prep.setString(2, "Bayrem");
		prep.setString(3, "Wirtschaftsinformatik");
		prep.executeUpdate();
	}


	public void insertFirstReservation() throws SQLException {

		Date day = Date.valueOf(java.time.LocalDate.now());

		String sql = "insert into reservation " + "( place, visitor, day) " + "values" + "(?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setInt(1, 1);
		prep.setInt(2, 632996);
		prep.setDate(3, day);
		prep.executeUpdate();
	}
	
	public void insertFirstMessages() throws SQLException {

	
		String sql = "insert into Messages " + "( Email, MSG) " + "values" + "(?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);

		prep.setString(1, "ShaymaRebhi15@gmail.com");
		prep.setString(2, "Willkommen");
		prep.executeUpdate();
	}

}
