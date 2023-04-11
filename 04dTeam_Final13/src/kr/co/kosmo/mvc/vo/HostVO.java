package kr.co.kosmo.mvc.vo;
/*
 * HNO	NUMBER
HID	VARCHAR2(50 BYTE)
HPWD	VARCHAR2(100 BYTE)
HNAME	VARCHAR2(100 BYTE)
HPHONE	VARCHAR2(100 BYTE)
HADDR	VARCHAR2(100 BYTE)
HEMAIL	VARCHAR2(100 BYTE)
HCALL	VARCHAR2(100 BYTE)
HACCOUNT	VARCHAR2(100 BYTE)
HNUM	NUMBER
HDATE	DATE
 */
public class HostVO {
	private int hno,hnum;
	private String hid,hpwd,hname,hphone,haddr,hemail,hcall,haccount,hdate;
	
	public int getHno() {
		return hno;
	}
	public void setHno(int hno) {
		this.hno = hno;
	}
	public int getHnum() {
		return hnum;
	}
	public void setHnum(int hnum) {
		this.hnum = hnum;
	}
	public String getHid() {
		return hid;
	}
	public void setHid(String hid) {
		this.hid = hid;
	}
	public String getHpwd() {
		return hpwd;
	}
	public void setHpwd(String hpwd) {
		this.hpwd = hpwd;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getHaddr() {
		return haddr;
	}
	public void setHaddr(String haddr) {
		this.haddr = haddr;
	}
	public String getHemail() {
		return hemail;
	}
	public void setHemail(String hemail) {
		this.hemail = hemail;
	}
	public String getHcall() {
		return hcall;
	}
	public void setHcall(String hcall) {
		this.hcall = hcall;
	}
	public String getHaccount() {
		return haccount;
	}
	public void setHaccount(String haccount) {
		this.haccount = haccount;
	}
	public String getHdate() {
		return hdate;
	}
	public void setHdate(String hdate) {
		this.hdate = hdate;
	}

}
