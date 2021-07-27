package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import DataBase.PostgreSQLAccess;

public class Messages {

	private int ID;
	private String Email;
	private String MSG;

	public Messages(int iD, String email, String mSG) {

		this.ID = iD;
		this.Email = email;
		this.MSG = mSG;
	}

	public Messages() {

	}

	public static boolean Insert(String Email, String MSG) throws SQLException {

		String sql = "insert into Messages (Email, MSG ) values (?,?)";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, Email);
		prep.setString(2, MSG);
		int result = prep.executeUpdate();
		if (result != 0)
			return true;
		else
			return false;
	}

	public static Vector<Messages> getAll() throws SQLException {

		Vector<Messages> VectorofContacts = new Vector<Messages>();
		String sql = "select * from Messages ";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		ResultSet dbRes = dbConn.createStatement().executeQuery(sql);
		while (dbRes.next()) {
			Messages C = new Messages(dbRes.getInt("ID"), dbRes.getString("Email"), dbRes.getString("MSG"));
			VectorofContacts.add(C);
		}
		return VectorofContacts;
	}
	


	public static boolean DeleteMessages(int ID) throws SQLException {

		String sql = "delete from Messages where ID = ?";
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);

		prep.setInt(1, ID);
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

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getMSG() {
		return MSG;
	}

	public void setMSG(String mSG) {
		MSG = mSG;
	}

}
