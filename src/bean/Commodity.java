package bean;

import com.google.gson.Gson;

public class Commodity {
	protected String Id;
	protected float price;
	protected String productName;
	protected String category;
	public String getName() {
		return productName;
	}

	public void setName(String name) {
		this.productName = name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String additional) {
		this.category = additional;
	}

	public Commodity() {
		super();
	}
	
	public Commodity(String id, float price, String name, String category) {
		super();
		Id = id;
		this.price = price;
		this.productName = name;
		this.category = category;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getId() {
		return Id;
	}
	public void setId(String id) {
		Id = id;
	}
	public boolean equals(Commodity c){
		return(c.getId().contentEquals(Id));
	}
	public String toString() {
		Gson gson=new Gson();
		return gson.toJson(this);
	}

}
