package action;

import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import model.Message;

/**
 * 登入動作
 * @author John
 */
public class LoginAction extends BaseAction{
	
	public String login() throws Exception{
		
		Message msg=new Message();
		if(username.trim().length()<3||password.length()<3){
			//資料不全			
			msg.setWarning("帳號或密碼未輸入完成!");
			savMessage(msg);
			getSession().invalidate();
			return "unsuccess";
		}
		
		//立即清除Cookie
		Cookie[] cookies = request.getCookies();
		if(cookies!=null)
		for(int i=0;i<cookies.length;i++){
			if(!cookies[i].getName().equals("loginusername")){
				cookies[i].setDomain(".cust.edu.tw");
				cookies[i].setPath("/");
		        cookies[i].setMaxAge(0);
		        cookies[i].setValue(null);
		        response.addCookie(cookies[i]);
			}          
        }
		
		
    	//驗證使用者
    	Map<String,String>user=dm.sqlGetMap("SELECT username, priority FROM wwpass WHERE username='"+username+"' AND password='"+password+"'");
		
		if(user==null){
			user=dm.sqlGetMap("SELECT username, priority FROM wwpass WHERE freename='"+username+"' AND password='"+password+"'");
		}
		
		if(user==null){			
			msg.setError("驗證失敗");
			savMessage(msg);
			return "unsuccess";
		}
		
		//將自訂帳號對應永久帳號
		username=user.get("username");
		//寫入登入記錄		
		df.exSql("INSERT SYS_LOG_ACCESS(userid,action,accip)VALUES('"+username+"','"+request.getServletPath()+"','"+ip+"')");
		//寫身份cookie
		Cookie cookie = new Cookie("userid", request.getSession().getId()+username.hashCode());	    	
		cookie.setMaxAge(60*60*24*365); // 瀏覽器關閉失效   	
    	cookie.setDomain(".cust.edu.tw");
    	cookie.setPath("/");
    	response.addCookie(cookie);
    	
    	//寫session cookie id	    	
    	dm.exSql("UPDATE wwpass SET sessionid='"+
    	request.getSession().getId()+username.hashCode()+
    	"' WHERE username='"+username+"'");    	
    	
    	//學生 (目前為學號驗證)
    	if(user.get("priority").equals("C")){
    		response.sendRedirect("/stis/MyCalendar");//轉送至stis
    		return null;
    	}
    	
    	//教職員
    	if(user.get("priority").equals("A")){
    		StringBuilder sb=new StringBuilder("A,");//職員工基本
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM Dtime WHERE techid='"+user.get("username")+"'")>0){
    			sb.append("T,");//教師基本
    		}
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM CODE_DEPT WHERE assistant='"+user.get("username")+"'")>0){
    			sb.append("S,");//系助理
    		}
    		
    		if(dm.sqlGetInt("SELECT COUNT(*) FROM empl WHERE idno='"+user.get("username")+"' AND (sname LIKE '%主任%' OR sname LIKE '%長%')")>0){
    			sb.append("C,");
    		}//2階主管
    		
    		
    		sb.append(dm.sqlGetStr("SELECT unit_module FROM empl WHERE idno='"+user.get("username")+"'"));
    		
    		//寫單位cookie
    		cookie = new Cookie("unit", sb.toString());
    		cookie.setMaxAge(60*60*24*365); //瀏覽器關閉失效    	
        	cookie.setDomain(".cust.edu.tw");
        	cookie.setPath("/");
        	response.addCookie(cookie);
    		
    		response.sendRedirect("/eis/Calendar");//轉送至eis
    		return null;
    	}    	
		return "unsuccess";
	}	
	//頁面物件
	public String username, password, ip;
	
}