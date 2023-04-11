package kr.co.kosmo.mvc.dao;

import java.util.HashMap;

import kr.co.kosmo.mvc.vo.LoginLoggerDTO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;

public interface MemberDaoInter {
	public void addMember(MemberVO vo); //Insert
	public MemberVO login(MemberVO vo); //Login
	public int idcheck(String mid); //IdCheck
	public void upMember(MemberVO vo); //Update	
	public void delMember(int mnum); //Delete
	//====================================================
	public MembershipVO memMembership(int mnum); //Detail(mypage1)
	//====================================================
	public void upMPoint(MemberVO vo); //Update_mpoint&mcharge 
	public MembershipVO mbsPoint(int mnum); //��޺� point���� ���
	//====================================================
	public void updateMbs(int mnum); //����ʵ�� ���׷��̵�
	public MembershipVO chartMbs(int mnum); //����ʵ�� ���׷��̵� ��Ʈ
	//====================================================
	public void addLoginLogging(LoginLoggerDTO vo); //Login_Log : AOP���� ���
	//====================================================
	//KaKaoLogin
	String getAccessToken(String authorize_code) throws Throwable; 
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable;
	public MemberVO kakaologin(MemberVO vo); //Login => ���ǽɱ�
	//====================================================
	
	
}
