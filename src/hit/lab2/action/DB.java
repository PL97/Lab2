package hit.lab2.action;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DB {
//	private String driver = "com.mysql.jdbc.Driver";
//	private String url = "jdbc:mysql://w.rdc.sae.sina.com.cn:3307/app_booksmanagement";
//	private Connection conn = null;
//	private PreparedStatement ps = null;
//	private String userName = "kx1n5ojj31";
//	private String password = "zk2k1yzx2w5305l54w1l2i3jxy5kikyw0h2m4xh2";
//	ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/BookDB?useUnicode=true&characterEncoding=utf-8&useSSL=false";
	private Connection conn = null;
	private PreparedStatement ps = null;
	private String userName = "root";
	private String password = "Pengle1997.";
	ResultSet rs = null;
	
	public Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, userName, password);
		return conn;
	}
	//build the connection and return it
	
	public void closeAll(){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(ps!=null){
			try {
				ps.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(conn!=null){
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	//close the database
	
	public ResultSet executeSelect(String cmd, String[] param){
		try {
			ps = conn.prepareStatement(cmd);
			if(param!=null){
				for(int i = 0;i<param.length;i++){
					ps.setString(i+1, param[i]);
				}
			}
			rs = ps.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	//execute the select query and return a result set
	
	public int executeUpdate(String cmd, String[] parameter){
		int affectRowNum = 0;
		try {
			ps = conn.prepareStatement(cmd);
			if(parameter!=null){
				for(int i = 0; i<parameter.length; i++){
					ps.setString(i+1,parameter[i]);
				}
			}
			affectRowNum = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return affectRowNum;
	}
	//execute the update command and return the affected number
}
