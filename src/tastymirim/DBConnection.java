package tastymirim;
import java.sql.*;
import javax.naming.*;
import javax.sql.*;

public class DBConnection {
	public static Connection getConnection() 
	throws SQLException, NamingException, ClassNotFoundException{
	Context initCtx = new InitialContext();
	Context envCtx = (Context)initCtx.lookup("java:comp/env");
	DataSource ds = (DataSource)envCtx.lookup("jdbc/tastymirim");
	Connection conn = ds.getConnection();
	return conn;
	}
}
