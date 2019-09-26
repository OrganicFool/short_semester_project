package bean;


import java.util.ArrayList;
import java.util.Map;

import Database.Connecter;;

public class CommodityDao {
public ArrayList<Commodity> filter(String statment)  {
	try(Connecter cnn=new Connecter()){
	ArrayList<Commodity> ans=new ArrayList<Commodity>();
	ArrayList<Map<String,Object>> result =cnn.query(statment);
	String Id;
	float price;
	String name;
	String category;
	if(result!=null) 
	{
		for(Map<String,Object> map:result) {
			Id=(String)map.get("categoryId");
			price=(Float)map.get("price");
			name=(String)map.get("productName");
			category=(String)map.get("category");
			ans.add(new Commodity(Id,price,name,category));
		}
	}
	return ans;
	}
}

public Commodity getCommodityById(String id) {
	ArrayList<Commodity> ans =new CommodityDao().filter("select * from product where categoryId = '"+id+"';");
	return ans.get(0);
}

public Commodity getCommodityByName(String name) {
	ArrayList<Commodity> ans =new CommodityDao().filter("select * from product where productName = '"+name+"';");
	return ans.get(0);
}

public String changeToSql(String priceLow,String priceHigh,String category,String order) {
	StringBuffer statment=new StringBuffer("select * from product ");
	if(!(priceLow.contentEquals("none")&&priceHigh.contentEquals("none"))){
		if(priceLow.contentEquals("none")) {
			statment.append("where price <"+priceHigh);
		}
		else if(priceHigh.contentEquals("none")) {
			statment.append("where price >"+priceLow+"");
		}
		else {
			statment.append("where price < "+priceHigh+" and price > "+priceLow+"");
		}
		
	}
	else {
		statment.append("where price >0 ");
	}
	if(!category.contentEquals("all")) statment.append(" and category ='"+category+"'");
	if(!order.contentEquals("none"))statment.append(" order by price "+order+";");
	System.out.println(statment);
	return statment.toString();
}
}
