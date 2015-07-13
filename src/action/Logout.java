package action;

import javax.servlet.http.Cookie;

public class Logout extends BaseAction{
	
	//sso logout
	public String execute() throws Exception {
		Cookie[] cookies = request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(!cookies[i].getName().equals("loginusername")){
				cookies[i].setDomain(".cust.edu.tw");
				cookies[i].setPath("/");
		        cookies[i].setMaxAge(0);
		        cookies[i].setValue(null);
		        response.addCookie(cookies[i]);
			}          
        }
		getSession().invalidate();
		return "logout";
	}
}
