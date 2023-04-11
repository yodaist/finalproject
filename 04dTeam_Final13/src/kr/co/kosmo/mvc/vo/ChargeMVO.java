package kr.co.kosmo.mvc.vo;

import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Component;

/*
 * CHNO	NUMBER
CHNAME	VARCHAR2(50 BYTE)
CHRESNO	NUMBER
 */
public class ChargeMVO {
	//total_sum��ģ��,maxpay_�ִ����Ⱚ,ctypecnt_������� count
	private int chpay,total,maxpay;
	
	private int chno;
	private int ctypecnt;
	private String chtype,chdate;

	public int getCtypecnt() {
		return ctypecnt;
	}
	public void setCtypecnt(int ctypecnt) {
		this.ctypecnt = ctypecnt;
	}
	public int getMaxpay() {
		return maxpay;
	}
	public void setMaxpay(int maxpay) {
		this.maxpay = maxpay;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getChno() {
		return chno;
	}
	public void setChno(int chno) {
		this.chno = chno;
	}
	public int getChpay() {
		return chpay;
	}
	public void setChpay(int chpay) {
		this.chpay = chpay;
	}
	public String getChtype() {
		return chtype;
	}
	public void setChtype(String chtype) {
		this.chtype = chtype;
	}
	public String getChdate() {
		return chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}

}
