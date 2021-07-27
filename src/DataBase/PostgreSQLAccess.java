package DataBase;

public class PostgreSQLAccess extends JDBCAccess {

	public PostgreSQLAccess() throws NoConnectionException {
		super();
	}
	public void setDBParms(){
		dbDrivername = "org.postgresql.Driver";
		dbURL        = "jdbc:postgresql://143.93.200.243:5432/BWUEBDB";
		dbUser       = "user1";
		dbPassword   = "pgusers";
		dbSchema     = "BiBViSiT";
		
		///waaaaaaaaaaaab,dbgskdgadkngsöldrdgsdtz
		
	}

}