package bean;

public class CartElement extends Commodity {
	Integer num;
	public CartElement(String id, float price, String name, String category,Integer num) {
		super();
		Id = id;
		this.price = price;
		this.productName = name;
		this.category = category;
		this.num=num;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public CartElement(Commodity c,int num) {
		super();
		Id = c.getId();
		price=c.getPrice();
		productName=c.getName();
		category=c.getCategory();
		this.num=num;
	}

	
}
