package Database;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
 
public class Connecter implements AutoCloseable {
	Connection conn = null;
	private final String URL = "";
	public Connecter() {
        String user="";
        String password="";
        Properties p=new Properties();
        p.setProperty("user",user);
        p.setProperty("password",password);
        p.setProperty("useSSL","false");
        p.setProperty("serverTimezone", "UTC");
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("driver success");
            conn = DriverManager.getConnection(URL,p);
            String sql_statment = "show tables;";
            PreparedStatement stmt = conn.prepareStatement(sql_statment);
            boolean result = stmt.execute(sql_statment);
            if (!result) {
				System.out.println("操作错误");
			}
            else {
				System.out.println("操作正确");
			}
            stmt.close();
        }
        catch (SQLException e) {
            System.out.println("MySQL错误");
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
        	System.out.println("环境没装对");
            e.printStackTrace();
        } 
	}
	public ArrayList<Map<String,Object>> query(String statment){
		try {
			ArrayList<Map<String,Object>> list=new ArrayList<Map<String, Object>>();
			PreparedStatement stmt = conn.prepareStatement(statment);
			ResultSet rs = stmt.executeQuery();
			ResultSetMetaData md = rs.getMetaData();//获取键名
			int columnCount = md.getColumnCount();//获取行的数量
			while (rs.next()) {
			Map<String, Object> rowData = new HashMap<String, Object>();//声明Map
			for (int i = 1; i <= columnCount; i++) {
			rowData.put(md.getColumnName(i), rs.getObject(i));//获取键名及值
			}
			list.add(rowData);
			}
			rs.close();
			stmt.close();
			System.out.println("query correct");
			return list;
		} catch (Exception e) {
			System.out.println("query错误");
			return null;
		}
	}
	public int update(String statment) {
		try {
			PreparedStatement stmt=conn.prepareStatement(statment);
			int flag=stmt.executeUpdate();
			return flag;
			}
			catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
		
	}
	public int delete(String statment) {
		try {
			PreparedStatement stmt=conn.prepareStatement(statment);
			int flag=stmt.executeUpdate();
			return flag;
			}
			catch(Exception e) {
				e.printStackTrace();
				return -1;
			}
	}
	public int insert(String statment) {
		try {
		PreparedStatement stmt=conn.prepareStatement(statment);
		int flag=stmt.executeUpdate();
		return flag;
		}
		catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	@Override
	public void close(){
		// TODO Auto-generated method stub
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		Integer test= new Integer(1);
		System.out.println(test==1);
	}
	

}
