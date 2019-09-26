package bean;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {
	private String username;
	private String password;
	private String email;
	private String telephone;
	private String currentAddressString;
	
	public static Boolean isEmail(String str) {
        Boolean isEmail = false;
        String expr = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";

        if (str.matches(expr)) {
            isEmail = true;
        }
        return isEmail;
    }
	public static boolean checkPassword(String password){
        Pattern Password_Pattern = Pattern.compile("^(?=.*[0-9])(?=.*[a-zA-Z])(.{8,20})$");
        Matcher matcher = Password_Pattern.matcher(password);
        if (matcher.matches()) {
            return true;
        }
        return false;
   }



}
