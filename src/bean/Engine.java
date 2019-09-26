package bean;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;


public class Engine {
	private float cosine(ArrayList<Float> a,ArrayList<Float> b) {
		float up=0f;
		float a_sq=0f;
		float b_sq=0f;
		double down=0f;
		for(int i=0;i<a.size();i++) {
			up+=a.get(i)*b.get(i);
			a_sq+=a.get(i)*a.get(i);
			b_sq+=b.get(i)*b.get(i);
		}
		down=Math.sqrt(a_sq)*Math.sqrt(b_sq);
		return (float) (up/down) ;
	}
	public  ArrayList<String> recommendCommoditiesByCommodity(String cName){
		
		String name="E:\\workspace\\MecDog\\src\\statistic\\vector.txt";
		HashMap<String, ArrayList<Float>> vectorHashMap=new HashMap<String, ArrayList<Float>>();
		ArrayList<Float> selfVector=new ArrayList<Float>();
		
		try {
			FileReader fr = new FileReader(name);
			BufferedReader bf = new BufferedReader(fr);
			String str;
			// °´ÐÐ¶ÁÈ¡×Ö·û´®
			while ((str = bf.readLine()) != null) {
				ArrayList<Float> vec=new ArrayList<Float>();
				System.out.println(str);
				String[] temp=str.split(" ");
				for(int i=1;i<temp.length;i++) {
					System.out.println(temp[i]);
					vec.add(Float.parseFloat(temp[i]));
				}
				if(!cName.contentEquals(temp[0])) vectorHashMap.put(temp[0], vec);
				else {
					selfVector=vec;
				}
				}
			bf.close();
			fr.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		ArrayList<CommmoditySimilar> sequence=new ArrayList<CommmoditySimilar>();
		Iterator<String> iterator=vectorHashMap.keySet().iterator();
		
		while(iterator.hasNext()) {
			String cString=iterator.next();
			float similar=cosine(selfVector, vectorHashMap.get(cString));
			sequence.add(new CommmoditySimilar(cString,similar));
		}
		 Collections.sort(sequence);
		 
		 ArrayList<String> returnValue=new ArrayList<String>();
		 returnValue.add(sequence.get(0).productName);
		 returnValue.add(sequence.get(1).productName);
		 returnValue.add(sequence.get(2).productName);
		 
		 return returnValue;
		 
	}
	public static void main(String[] args) {
	System.out.println(new Engine().recommendCommoditiesByCommodity("dog5"));	
	}
}
class CommmoditySimilar implements Comparable<CommmoditySimilar>{
	public String productName;
	public float cosine;
	public CommmoditySimilar(String productName,float cosine) {
		this.productName=productName;
		this.cosine=cosine;
	}
	public int compareTo(CommmoditySimilar o) {
		if(cosine<=o.cosine) return 1;
		else {
			return -1;
		}
	}
}
