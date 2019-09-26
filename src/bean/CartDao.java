package bean;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import Database.Connecter;


public class CartDao {
	public Cart getCartFromSql(String username) {
	    try(Connecter connecter=new Connecter()){
	    String statment="select * from cart where username = '"+username +"' ;";
	    ArrayList<Map<String, Object>> ans=connecter.query(statment);
	    Cart cart=new Cart();
	    int amount=0;
	    CommodityDao cDao=new CommodityDao();
	    if(!ans.isEmpty()) {
	    	for(Map<String, Object> map :ans) {
	    	amount=(Integer)map.get("amount");
	    	cart.add(cDao.getCommodityById((String)map.get("categoryId")), amount);
	    	}
	    }
	    return cart;
	    }
	    
	}
	public int addToCart(String username,Commodity commodity,int num) {
		try(Connecter connecter=new Connecter()){
		int flag=0;
		List<Map<String, Object>> ans =connecter.query("select * from cart where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
		if(!ans.isEmpty())
		{	/*购物车中已有商品x，x数量加上num个*/
			int amount= (Integer)ans.get(0).get("amount");
			flag=connecter.update("update cart set amount = "+Integer.toString(amount+num)+" where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
		}
		else {
			/*购物车中没有该商品，新加入到购物车中*/
			flag=connecter.insert("insert into cart values ('"+username+"', '"+commodity.getId()+"', "+Integer.toString(num)+");");
		}
		return flag;
		}
	}
	public int removeFromCart(String username, Commodity commodity ,int num) {
		try(Connecter connecter=new Connecter()){
		int flag=0;
		List<Map<String, Object>> ans =connecter.query("select * from cart where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
		if(!ans.isEmpty())
		{	
			int amount= (Integer)ans.get(0).get("amount");
			if(amount==1) {
				/*购物车中只剩最后一件商品，直接删除*/
				flag=connecter.delete("delete from cart where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
			}
			else {
				/*购物车中剩下不止一件商品，删去一件*/
				flag=connecter.update("update cart set amount = "+Integer.toString(amount-num)+" where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
			}
		}
		else {
			/*购物车中没有该商品，无法删除*/
			flag=-2;
		}
		return flag;
		}
	}
	public int removeAllFromCart(String username,Commodity commodity) {
		try(Connecter connecter=new Connecter()){
			int flag=0;
			List<Map<String, Object>> ans =connecter.query("select * from cart where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
			if(!ans.isEmpty())	{
				flag=connecter.delete("delete from cart where username= '"+username+"' and categoryid = '"+commodity.getId()+"' ;");
			}
			else {
				flag=-2;
			}
			return flag;
		}
		
	}
	public void orderCart(Cart cart,String username,String order) {
		
		try(Connecter connecter=new Connecter()){
			Iterator<Commodity> iterator=cart.cartHashMap.keySet().iterator();
			while (iterator.hasNext() ){
				Commodity commodity=iterator.next();
				String statment = "insert into cart_has_order values ('"+username+"', "+order+", "+cart.cartHashMap.get(commodity)+", "+commodity.getId()+");";
				connecter.insert(statment);
			}
		}
			/*任务：生成将改购物车存到数据库中的sql语句*/
		
//		Iterator<Commodity> iterator=cart.getCart().keySet().iterator();
		/*最终形成一个字符串数组，每句话都是insert表达*/
		/*
		 * 先开个字符串数组
		 * 遍历cart：
		 * 		对每个（商品：数量）键值对，还有usernmae，order，写一个insert语句，加入到字符串数组中
		 *       insert  into cart_has_order value(c.get.....)*/
	}
	public Cart getCartFromOrder(String order) {
		try(Connecter connecter =new Connecter()){
			String statment = "select * from cart_has_order where orderId = '"+order+"' ;";
			List<Map<String, Object>> ans =connecter.query(statment);
			
			Cart cart=new Cart();
			CommodityDao commodityDao=new CommodityDao();
			
			for(Map<String, Object> map: ans) {
				String categoryId=(String)map.get("categoryId");
				Integer amount=(Integer)map.get("amount");
				cart.add(commodityDao.getCommodityById(categoryId), amount);
				
			}
			return cart;
		}
	}
	
	public void clean(String username) {
		String statment="delete from cart where username='"+username+"' ;";
		try(Connecter connecter=new Connecter()){
			connecter.delete(statment);
		}
		
	}

}
