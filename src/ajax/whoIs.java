package ajax;

import java.sql.Timestamp;
import java.util.Date;

import org.json.JSONObject;

import action.BaseAction;
//import model.SysLog;
//import model.SysLog;
import model.SysLogSecurity;

public class whoIs extends BaseAction{
	
	public String execute() {
		SysLogSecurity log;
		//System.out.println("ipaddress?"+request.getParameter("ipaddress"));
		//System.out.println("remoteaddress?"+request.getParameter("remoteaddress"));
		try {
			log=(SysLogSecurity)df.hqlGetListBy("FROM SysLogSecurity ORDER BY Oid DESC LIMIT 1").get(0);
			log.setIpaddress(request.getParameter("ipaddress"));
			log.setRemoteaddress(request.getParameter("remoteaddress"));
			log.setAgent(request.getHeader("User-Agent"));
			//log.setUpTime(new Timestamp(new Date().getTime()));
			df.update(log);
		}catch(Exception e) {
			log=new SysLogSecurity();log.setIpaddress(request.getParameter("ipaddress"));
			log.setRemoteaddress(request.getParameter("remoteaddress"));
			log.setUpTime(new Timestamp(new Date().getTime()));
			log.setAgent(request.getHeader("User-Agent"));
			df.update(log);
		}		
		return SUCCESS;
	}
	

}
