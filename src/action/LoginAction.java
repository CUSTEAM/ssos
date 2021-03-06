package action;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;

import model.Message;
import model.Wwpass;
import model.Wwpasshist;

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
			return SUCCESS;
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
    	DetachedCriteria c = DetachedCriteria.forClass(Wwpass.class);
		c.add(Restrictions.eq("username", username));
		c.add(Restrictions.eq("password", password));
		List<Wwpass>list=df.getHibernateDAO().getHibernateTemplate().findByCriteria(c);
		if(list.size()<1){
			c = DetachedCriteria.forClass(Wwpass.class);
			c.add(Restrictions.eq("freename", username));
			c.add(Restrictions.eq("password", password));
			list=df.getHibernateDAO().getHibernateTemplate().findByCriteria(c);
		}
		
		//寫入登入記錄	
		Wwpasshist w=new Wwpasshist();
		w.setIpaddress(ipaddress);		
		w.setRemoteaddress(remoteaddress);
		w.setUseragent(request.getHeader("User-Agent"));
		w.setUsername(username);
		w.setUptime(new Timestamp(new Date().getTime()));
		if(list.size()<1){		
			
			
			msg.setError("驗證失敗");
			
			savMessage(msg);
			w.setLoginmsg("0");
			df.update(w);
			return SUCCESS;
		}else {
			//驗證成功
			df.update(w);
		}		
		Wwpass user=(Wwpass)list.get(0);
		//將自訂帳號對應永久帳號
		username=user.getUsername();
		
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
    	if(user.getPriority().equals("C")){
    		response.sendRedirect("/stis/MyCalendar");//轉送至stis
    		return null;
    	}
    	
    	//教職員
    	if(user.getPriority().equals("A")){
    		StringBuilder sb=new StringBuilder("U,");//職員工基本
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM Dtime WHERE techid='"+username+"'")>0||
    		dm.sqlGetInt("SELECT COUNT(*)FROM Sdtime WHERE techid='"+username+"'")>0||
    		dm.sqlGetInt("SELECT COUNT(*)FROM Class WHERE tutor='"+username+"'")>0){
    			sb.append("T,");//教師基本
    		}
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM CODE_DEPT WHERE assistant='"+username+"'")>0){
    			sb.append("S,");//系助理
    		}
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM CODE_DEPT WHERE director_deputy='"+username+"'")>0){
    			sb.append("S,");//副主任
    		}
    		
    		if(dm.sqlGetInt("SELECT COUNT(*)FROM SYS_ADMIN WHERE idno='"+username+"'")>0){
    			sb.append("00000,");//系統管理
    		}
    		
    		/*if(dm.sqlGetInt("SELECT COUNT(*) FROM empl WHERE idno='"+username+"' AND (sname LIKE '%主任%' OR sname LIKE '%長%')")>0){
    			sb.append("C,");
    		}//2階主管
    		*/
    		
    		sb.append(dm.sqlGetStr("SELECT unit_module FROM empl WHERE idno='"+username+"'"));
    		
    		//寫單位cookie
    		cookie = new Cookie("unit", sb.toString());
    		//cookie.setMaxAge(60*60*24*365);  
    		cookie.setMaxAge(60*60*24);
        	cookie.setDomain(".cust.edu.tw");
        	cookie.setPath("/");
        	response.addCookie(cookie);
    		
    		response.sendRedirect("/eis/Calendar");//轉送至eis
    		return null;
    	}    	
		return SUCCESS;
	}	
	//頁面物件
	public String username, password, remoteaddress, ipaddress;
	
}