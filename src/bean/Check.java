package bean;

import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.sun.org.apache.bcel.internal.generic.NEW;

import Database.Connecter;

public class Check {
	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public float getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getDateString() {
		return dateString;
	}
	public void setDateString(String dateString) {
		this.dateString = dateString;
	}
	private String orderID;
	private String username;
	private float totalPrice;
	private String dateString;
	public Check(String username,Cart cart){
		this.username=username;
		
		CheckDao checkDao=new CheckDao();
		orderID=checkDao.getNewId();
		
		Date currentTime = new Date(); 
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
		dateString = formatter.format(currentTime); 
		
		totalPrice=cart.getTotalPrice();
	}
	
	public Check(String orderID, String username, float totalPrice, String dateString) {
		super();
		this.orderID = orderID;
		this.username = username;
		this.totalPrice = totalPrice;
		this.dateString = dateString;
	}
	public static void main(String[] args) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println(df.format(new Date()));
//		Cart cart=new Cart();
//		cart.add(new Commodity("1", 123f, "dog", "e"), 2);
//		cart.add(new Commodity("2", 123f, "cat", "e"), 2);
//		
//		int flag=cart.remove(new Commodity("2", 123f, "cat", "e"),2);
//		cart.remove(new Commodity("2", 123f, "cat", "e"), 2);
//		
//		Gson gson=new Gson();
//		System.out.println(gson.toJson(cart.getCart()));
//		System.out.println(flag);
		
//		CommodityDao commodityDao=new CommodityDao();
//		ArrayList<Commodity> ans=commodityDao.filter("select * from product ;");
//		
//		Gson gson=new Gson();
//		String returnValue=gson.toJson(ans);
//		
//		System.out.println(returnValue);
		
//		String productId = "2";
//		CommodityDao commodityDao=new CommodityDao();
//		ArrayList<Commodity> ans=commodityDao.filter("select * from product where categoryId= '"+productId+"' ;");
		
//		Gson gson=new Gson();
//		System.out.println(gson.toJson(ans.get(0)));
		
//		Gson gson2=new Gson();
//		System.out.println(gson2.toJson(new CartElement("1", 10f, "dog", "fuck", 1)));
		
//		Gson gson1=new Gson();
//		System.out.println(gson1.toJson(new Commodity("1",123f,"electronic_dog","dog")));
//		
//
//		Cart cart=new Cart();
//		cart.add(new Commodity("1",123f,"electronic_dog","dog"), 1);
//		cart.add(new Commodity("2",110f,"electronic_cat","cat"), 1);
//		Iterator <Commodity> it = cart.getCart().keySet().iterator();
//		while (it.hasNext()) {
//			System.out.println(it.next());
//			
//		}
		
//		Gson gson = new GsonBuilder().enableComplexMapKeySerialization().create();
//		Type type = new TypeToken<Map<Commodity, Integer>>() {}.getType();
//		HashMap<Commodity, Integer> testHashMap=new HashMap<Commodity, Integer>();
//		testHashMap.put(new Commodity("1",123f,"electronic_dog","dog"), 1);
//		testHashMap.put(new Commodity("2",123f,"electronic_cat","cat"), 1);
//		String ans=gson.toJson(testHashMap,type);
//		System.out.println(ans);
		
		
//		String newAddress="shanghai";
//		String oldAddress="beijing";
//		String username="xhd";
//		
//		String statment ="update address set address = '"+newAddress+"' where username='"+
//				username+"' and address= '"+oldAddress +"' ;";
//		System.out.println(statment);
		
		
		
		
//		ArrayList<Check> checks=new ArrayList<Check>();
//		checks.add(new Check("1", "xhd", 100.0f, "2017"));
//		checks.add(new Check("2", "zzj", 100.0f, "2018"));
//		Gson gson=new Gson();
//		String string=gson.toJson(checks);
//		System.out.println(string);
//		
//		List<Check> ansChecks=gson.fromJson(string,  new TypeToken<List<Check>>() {}.getType());
//		System.out.println(ansChecks.get(0).getUsername());
		
//		String id="1";
//		String username="xiahandong";
//		String priceString="255.0";
//		String dateString="2019-09-01";
//		System.out.println("insert into order values ('"+id+"', '"+username+"', "+priceString+", '"+dateString+"');");
	}

}
