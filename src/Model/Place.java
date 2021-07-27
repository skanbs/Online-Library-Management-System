package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import DataBase.PostgreSQLAccess;

public class Place {

	private int ID;
	private int Num;
	private int Available;

	public Place() {

	}

	public Place(int iD, int num, int available) {

		this.ID = iD;
		this.Num = num;
		this.Available = available;
	}
	
	public Place(int num) {

		
		this.Num = num;
	}

	
	public static Place getPlace(int num) throws SQLException {

		String sql = "select * from Place where num = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, num);
		ResultSet dbRes = prep.executeQuery();
		if (dbRes.next()) {
			return new Place(dbRes.getInt("ID"), dbRes.getInt("Num"), dbRes.getInt("Available"));
		}
		else return null;
		
		
	}
	public boolean SearchPlace(int num) throws SQLException {

		String sql = "select * from Place where num = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, num);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();

	}

	public boolean DeletePlace(int num) throws SQLException {

		String sql = "delete from Place where num = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setInt(1, num);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}



	public static boolean InsertPlace(Place P) throws SQLException {

		String sql = "insert into Place (Num ) values (?)";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, P.Num);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static Vector<Place> getAll() throws SQLException {

		Vector<Place> Vectorofplaces = new Vector<Place>();
		String sql = "select * from Place ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while (dbRes.next()) {
			Place P = new Place(dbRes.getInt("ID"), dbRes.getInt("Num"), dbRes.getInt("Available"));
			Vectorofplaces.add(P);
		}
		return Vectorofplaces;
	}

	public static boolean UpdateAvailability(int Num, int Availability) throws SQLException {

		String sql = "update Place Set Available = ? where Num = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, Availability);
		prep.setInt(2, Num);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getNum() {
		return Num;
	}

	public void setNum(int num) {
		Num = num;
	}

	public int getAvailable() {
		return Available;
	}

	public void setAvailable(int available) {
		Available = available;
	}

}
