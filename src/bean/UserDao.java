package bean;
import java.util.ArrayList;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

import Database.Connecter;

public class UserDao {
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int Login(String username,String password) {
		String statment="select * from user where username='"+username+"' and password='"+password+"';";
		try(Connecter cnn=new Connecter()){
		int flag=-1;
		ArrayList<Map<String,Object>> ans=cnn.query(statment);
		if(ans.isEmpty()) {
			flag=0;
		}
		else {
			flag=1;
		}
		return flag;//成功为1，用户名或密码错误为0，error为-1
		}
	}
	public int register(String username,String password,String phone,String address,String email) {
		String usernameUnique="select * from user where username='"+username+"';";
		String phoneUnique="select * from user where telephone='"+phone+"';";
		String emailUnique="select * from user where email='"+email+"';";
		String statment="insert into user values('"+username+"','"+password+"','"+phone+"','"+email+"','"+address+"');";
		int flag=0;
		try(Connecter cnn=new Connecter()){
			if(cnn.query(usernameUnique).isEmpty()) {
				if(cnn.query(phoneUnique).isEmpty()) {
					if(cnn.query(emailUnique).isEmpty()) {
						
					flag=cnn.insert(statment);
					return flag;
					}
					else {
						flag=-3;//邮箱重复
						return flag;
					}
				}
				else {
					flag=-1;//电话重复
					return flag;
				}
			}
			else flag=-2;//用户名重复
			return flag;
		}
	}
	public String[] getUserInfo(String username) {
		String[] ans=new String[4];
		String statment="select * from user where username='"+username+"';";
		try(Connecter cnn=new Connecter()){
			ArrayList<Map<String,Object>> result =cnn.query(statment);
			ans[0]=(String)result.get(0).get("telephone");
			ans[1]=(String)result.get(0).get("email");
			ans[2]=(String)result.get(0).get("currentAddress");
			ans[3]=(String)result.get(0).get("password");
		}
		return ans;
	}
	public ArrayList<String> selectAllAddress(String username) {
		try(Connecter connecter=new Connecter()){
			String statment ="select address from address where username = '"+username+"' ;";
			ArrayList<Map<String, Object>> ans=connecter.query(statment);
			ArrayList<String> returnValue =new ArrayList<String>();
			
			for(Map<String, Object> temp: ans) {
				returnValue.add((String)temp.get("address"));
			}
			return returnValue;
		}
		
	}
	public int update(String username, String password, String address, String email, String phone) {
		try(Connecter connecter=new Connecter()){
			String statment ="update user set currentAddress = '"+address +"', password='"+password+"', email='"+email+"', telephone= '"+phone+"' where username='"+
					username+"' ;";
			int flag=connecter.update(statment);
			return flag;
		}
	}
	public int insert(String username,String address) {
		address=address.trim();
		
		try(Connecter connecter=new Connecter()){
			/*验证这个地址是否已存在*/
			String verify ="select * from address where username ='"+username+"' and  address ='"+address+"';";
			ArrayList<Map<String, Object>> ans =connecter.query(verify);
			if (!ans.isEmpty()) {
				return -2;
			}
			
			String statment ="insert into address values('"+username+"','"+address+"');";
			int flag=connecter.update(statment);
			return flag;
		}
	}
	public int delete(String username,String address) {
		address=address.trim();
		try (Connecter connecter=new Connecter()){
			String statment="delete from address where username ='"+username+"' and address='"+address+"' ;";
			int flag=connecter.delete(statment);
			return flag;
		}
	}
}
