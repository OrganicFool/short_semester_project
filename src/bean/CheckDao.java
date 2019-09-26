package bean;

import java.util.ArrayList;
import java.util.Map;
import Database.Connecter;

public class CheckDao {
	/*业务1：将订单存入数据库*/
	public int checkToSql(Check check) {
		int flag=0;
		
		String id=check.getOrderID();
		String dateString=check.getDateString();
		String username=check.getUsername();
		String priceString=Float.toString(check.getTotalPrice());
		
		String statment="insert into checkorder values ('"+id+"', '"+username+"', "+priceString+", '"+dateString+"');";
		
		try(Connecter connecter=new Connecter()){
		
		flag=connecter.insert(statment);
		return flag;
		}
	}
	public String getNewId() {
		/*从当前数据库中获取ID（最大）*/
		try(Connecter connecter=new Connecter()){
		String statment= "select max(orderId) as orderId from checkorder;";
		ArrayList<Map<String,Object>> ans=connecter.query(statment);
		
		String largestString=(String)ans.get(0).get("orderId");
		if(largestString==null) {
			/*如果数据库为空，增加id为1*/
			return "1";
		}
		else {
			/*如果非空，取最大id+1，返回给主程序*/
			int largestInt=Integer.parseInt(largestString);
			return Integer.toString(largestInt+1);
		}
		}
	}
	public ArrayList<Check> checkHistoryByUsername(String username) {
		try(Connecter connecter=new Connecter()){
			String statment="select * from checkorder where username = '"+username+"' ;";
			System.out.println(statment);
			
			ArrayList<Check> history= new ArrayList<Check>();
			ArrayList<Map<String, Object>> ans=connecter.query(statment);
			
			String orderId="";
			Float totalPrice=0f;
			String time="";
			
			for(Map<String, Object> temp:ans) {
				orderId=(String)temp.get("orderId");
				totalPrice=(Float)(temp.get("totalPrice"));
				time=(String)temp.get("time");
				history.add(new Check(orderId,username,totalPrice,time));
			}
			
			return history;
		}
		
		
	}
	public Cart checkHistoryByOrderId(String OrderId) {
		try(Connecter connecter=new Connecter()){
			String statment="select * from cart_has_order c,product p where c.categoryId=p.categoryId and c.orderid = \""+OrderId+"\"";
			
			Cart cart=new Cart();
			
			ArrayList<Map<String, Object>> ans=connecter.query(statment);
			Commodity commodity=null;
			
			String id="";
			float price=0f;
			String name="";
			String categoey="";
			int num=0;
			
			for(Map<String, Object> temp:ans) {
				/*此处尚不确定，可能用p. 可能不用*/
				id=(String)temp.get("p.categoryId");
				price=(Float)(temp.get("p.price"));
				name=(String)temp.get("p.productName");
				categoey=(String)temp.get("c.category");
				num=(Integer)temp.get("c.amount");
				cart.add(new Commodity(id,price,name,categoey), num);
			}
			return cart;
		}
	}
}
