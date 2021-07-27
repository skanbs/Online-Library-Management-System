package Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.text.ParseException;
import java.util.Vector;
import DataBase.PostgreSQLAccess;

public class Reservation {

	private int ID;
	private int Place;
	private int Visitor;
	private Date day;

	public Reservation() {

	}

	public Reservation(int iD, int place, int visitor, Date day, int expired) {

		this.ID = iD;
		this.Place = place;
		this.Visitor = visitor;
		this.day = day;

	}

	public Reservation getReservation(int ID) throws SQLException {

		String sql = "select * from Place where ID = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setInt(1, ID);
		ResultSet dbRes = prep.executeQuery();
		if (dbRes.next()) {
			return new Reservation(dbRes.getInt("ID"), dbRes.getInt("place"), dbRes.getInt("visitor"),
					dbRes.getDate("Day"), dbRes.getInt("expired"));
		} else
			return null;
	}

	public static boolean DeleteReservation(int ID) throws SQLException {

		String sql = "delete from reservation where ID = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setInt(1, ID);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static boolean InsertReservation(int Num, int Imma, Date day) throws SQLException, ParseException {

		String sql = "insert into reservation (place, visitor, day) values (?,?,?)";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setInt(1, Num);
		prep.setInt(2, Imma);
		prep.setDate(3, day);
		int result = prep.executeUpdate();

		if (result != 0)
			return true;
		else
			return false;
	}

	public Vector<Reservation> getAll() throws SQLException {

		Vector<Reservation> Vectorofreservation = new Vector<Reservation>();
		String sql = "select * from Reservation ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while (dbRes.next()) {
			Reservation R = new Reservation(dbRes.getInt("ID"), dbRes.getInt("place"), dbRes.getInt("visitor"),
					dbRes.getDate("Day"), dbRes.getInt("expired"));

			Vectorofreservation.add(R);
		}
		return Vectorofreservation;
	}

	public static Vector<Integer> getAlldayplaces(Date Day) throws SQLException {

		Vector<Integer> VectorAlldayplaces = new Vector<Integer>();
		String sql = "select place from Reservation where Day = ? ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setDate(1, Day);

		ResultSet dbRes = prep.executeQuery();
		while (dbRes.next()) {
			int Place = dbRes.getInt("place");

			VectorAlldayplaces.add(Place);
		}
		return VectorAlldayplaces;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public int getPlace() {
		return Place;
	}

	public void setPlace(int place) {
		Place = place;
	}

	public int getVisitor() {
		return Visitor;
	}

	public void setVisitor(int visitor) {
		Visitor = visitor;
	}

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

}