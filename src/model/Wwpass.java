package model;

import java.io.ByteArrayOutputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Dilg generated by MyEclipse - Hibernate Tools
 */
public class Wwpass implements java.io.Serializable {

	private static final long serialVersionUID = 8006336086880578386L;

	private Integer Oid;
	private String username;
	private String freename;
	private String password;
	private String priority;
	private Date updated;
	private String inco;	

	public Wwpass() {

	}

	public Wwpass(Integer Oid,String username,String freename,String password,String priority,Date updated,String inco) {
		this.freename=freename;
		this.inco=inco;
		this.Oid=Oid;
		this.password=password;
		this.priority=priority;
		this.updated=updated;
		this.username=username;
		
	}

	public Integer getOid() {
		return Oid;
	}

	public void setOid(Integer oid) {
		Oid = oid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFreename() {
		return freename;
	}

	public void setFreename(String freename) {
		this.freename = freename;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPriority() {
		return priority;
	}

	public void setPriority(String priority) {
		this.priority = priority;
	}

	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public String getInco() {
		return inco;
	}

	public void setInco(String inco) {
		this.inco = inco;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	

}