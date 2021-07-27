package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import DataBase.PostgreSQLAccess;

public class Visitor {

	private int ID;
	private int Imma;
	private String Psydo;
	private String Fach;

	public Visitor() {

	}

	public Visitor(int ID, int Imma, String Psydo, String Fach) {

		this.ID = ID;
		this.Imma = Imma;
		this.Psydo = Psydo;
		this.Fach = Fach;
	}

	public Visitor getVisitor(String Psydo) throws SQLException {

		String sql = "select * from Place where Psydo = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, Psydo);
		ResultSet dbRes = prep.executeQuery();
		return new Visitor(dbRes.getInt("ID"), dbRes.getInt("Imma"), dbRes.getString("Psydo"), dbRes.getString("Fach"));

	}

	public static boolean SearchVisitor(int Imma) throws SQLException {

		String sql = "select * from Visitor where Imma = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, Imma);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();

	}

	public static boolean DeleteVisitor(int Id) throws SQLException {

		String sql = "delete from Visitor where Id = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setInt(1, Id);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static boolean InsertVisitor(int Imma, String Psydo, String Fach) throws SQLException {

		String sql = "insert into Visitor (Imma, Psydo, Fach) values (?,?,?)";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, Imma);
		prep.setString(2, Psydo);
		prep.setString(3, Fach);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static Vector<Visitor> getAll() throws SQLException {

		Vector<Visitor> Vectorofvisitors = new Vector<Visitor>();
		String sql = "select * from Visitor ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while (dbRes.next()) {
			Visitor V = new Visitor(dbRes.getInt("ID"), dbRes.getInt("Imma"), dbRes.getString("Psydo"),
					dbRes.getString("Fach"));
			Vectorofvisitors.add(V);
		}
		return Vectorofvisitors;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getImma() {
		return Imma;
	}

	public void setImma(int imma) {
		Imma = imma;
	}

	public String getPsydo() {
		return Psydo;
	}

	public void setPsydo(String psydo) {
		Psydo = psydo;
	}

	public String getFach() {
		return Fach;
	}

	public void setFach(String fach) {
		Fach = fach;
	}

}
