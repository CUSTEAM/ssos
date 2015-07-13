package action;

import java.util.Map;
import model.Message;

/**
 * 登入動作
 * @author John
 */
public class ReSetPasswordAction extends BaseAction{	
	
	public String execute() throws Exception{		
    	
		return SUCCESS;
	}
	
	public String reset(){
		
		String date;
		Message msg=new Message();
		
		if(idno.length()<10||birthday.length()<6){
			msg.setError("身分證號字數為10, 生日字數至少為6");
			savMessage(msg);
			return SUCCESS;
		}
		
		try{
			date=bl.getBirthday(birthday);
		}catch(Exception e){
			msg.setError("生日應為YYMMDD, 如90年1月12日為:900112");
			savMessage(msg);
			return SUCCESS;
		}
		
		Map m=dm.sqlGetMap("SELECT cname as name, idno as username FROM empl WHERE idno='"+idno+"' AND bdate='"+date+"'");
		
		if(m==null){
			m=dm.sqlGetMap("SELECT student_name as name, student_no as username, idno as password FROM stmd WHERE idno='"+idno+"' AND birthday='"+date+"'");
			if(m!=null)
			m.put("priority", "C");
		}else{
			m.put("priority", "A");
			m.put("password", birthday);
		}
		
		if(m==null){
			msg.setError("無此帳號");
			savMessage(msg);
		}else{
			dm.exSql("DELETE FROM wwpass WHERE username='"+m.get("username")+"'");
			dm.exSql("INSERT INTO wwpass(username, password, priority)VALUES('"+m.get("username")+"', '"+m.get("password")+"', '"+m.get("priority")+"');");
			msg.setMsg(m.get("name")+"您好, 您的帳號密碼已重新設為預設值<br><a href='/ssos'>點此處重新登入</a>");
			savMessage(msg);
		}
		
		return SUCCESS;
	}
	
	//頁面物件
	public String idno;
	public String birthday;
	
}