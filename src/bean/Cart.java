package bean;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import sun.nio.cs.ext.ISCII91;

public class Cart {
	public HashMap<Commodity, Integer> cartHashMap=new HashMap<Commodity, Integer>();
    public Cart() {
    	
	}
    public Cart(ArrayList<CartElement> cartElements) {
    	for(CartElement cartElement:cartElements) cartHashMap.put(new Commodity(cartElement.getId(),cartElement.getPrice(),cartElement.getName(),cartElement.getCategory()), cartElement.getNum());
    }
    public void add(Commodity c,int num) {
//    	int truenum=0 ;
//        if(cartHashMap.equals(c)) {
//      	  Iterator iter = cartHashMap.entrySet().iterator(); 
//      	  while (iter.hasNext()) {
//      	      Map.Entry entry = (Map.Entry) iter.next(); 
//      	      Commodity key =(Commodity) entry.getKey(); 
//      	      int val =(int) entry.getValue(); 
//      	      if(c==key) {
//      	    	  truenum = val+num;
//      	      }else {
//      	    	  truenum = num;
//      	      }
//      	  } 
//
//      	   cartHashMap.put(c,truenum);
//
//        }else {  
//      	   cartHashMap.put(c,num);
//        }
    	
    	Iterator <Commodity> it = cartHashMap.keySet().iterator();
		Commodity temp;
		Boolean hasElementBoolean=false;
		while(it.hasNext()) {
			temp=it.next();
			if(temp.equals(c)) {
    		int a = cartHashMap.get(temp);
    		a = a + num;
    		cartHashMap.replace(temp, a);
    		hasElementBoolean=true;
    	}
    	

		}
		if(hasElementBoolean==false) {
    		cartHashMap.put(c,num);
    	}
    	
    }
    public List<CartElement> getCart() {
    	ArrayList<CartElement> ans=new ArrayList<CartElement>();
    	Iterator <Commodity> it = cartHashMap.keySet().iterator();
    	while (it.hasNext()) {
    		Commodity temp=it.next();
			ans.add(new CartElement(temp,cartHashMap.get(temp)));
			
		}
    	return ans;
	}
	
	public int remove(Commodity c,int num) {
		/*flag=-1: 没有该商品在购物车中*/
		
		
		int truenum ;
//   	 if(cartHashMap.equals(c)) {
//   		 Iterator iter =  cartHashMap.entrySet().iterator(); 
//   		 while(iter.hasNext()) {
//   	      Map.Entry entry = (Map.Entry) iter.next(); 
//   	      Commodity key =(Commodity) entry.getKey(); 
//   	      int val =(int) entry.getValue();
//   	      
//   	      if(c==key) {
//   	    	  int total = val - num;
//   	    	   if(total < 0) {
//   	    	    	System.out.println("ERROR! YOU DONNOT HAVE¡¡ENOUGH¡¡STOCK");//¿â´æÐ¡ÓÚ0
//   	    	    }else if(total == 0){
//   	    	    	cartHashMap.remove(key);  //0 ¿â´æ£¬ÒÆ³ýÉÌÆ·
//   	    	    }else{
//   	    	    	cartHashMap.put(c,total);
//   	    	    }//end inside if
//   	    	}else{
//	    	    	System.out.println("ERROR! DONNOT HAVE¡¡THIS¡¡PROCDUCT¡¡IN CART");//²»´æÔÚ´ËÉÌÆ·
//   	    	}
//   		 }//end while
//   	 }
		int flag = 0;
		Iterator <Commodity> it = cartHashMap.keySet().iterator();
		Commodity temp;
		boolean hasElement=false;
		while(it.hasNext()) {
			temp=it.next();
			if(temp.equals(c)) {
			int a = cartHashMap.get(temp);
			if(a==1){
				cartHashMap.remove(temp);
			}
			else {
				a = a - 1;
				cartHashMap.replace(temp, a);
			}
			hasElement=true;
			flag=1;
		}

		}
		assert hasElement;
		
		return flag;
		
    }
	public int removeAll(Commodity commodity) {
		int count=0;
		int flag=0;
		outer :while(true) {
			flag=0;
			Iterator <Commodity> it = cartHashMap.keySet().iterator();
			inner:while(it.hasNext()) {
				if(it.next().equals(commodity)) 
					flag=1;
				    remove(commodity, 1);
			}
			if(flag==0) break outer;
			
			count++;
		}
		return count;
	}
	public void clean() {
		cartHashMap=new HashMap<Commodity, Integer>();
	}
	public float getTotalPrice() {
		float total = 0;
		Iterator <Commodity> it = cartHashMap.keySet().iterator();
		while(it.hasNext()) {
			Commodity c=it.next();
			float commodityPrice = c.getPrice();
			int num = cartHashMap.get(c);
			float price = commodityPrice * num;
			total = total + price;
		}
		return total;
	}
	public List<Commodity> getCommodities(){
		ArrayList<Commodity> ans=new ArrayList<Commodity>();
		Iterator <Commodity> it = cartHashMap.keySet().iterator();
		while(it.hasNext()) {
			ans.add(it.next());
		}
		return ans;
	}
	
}

