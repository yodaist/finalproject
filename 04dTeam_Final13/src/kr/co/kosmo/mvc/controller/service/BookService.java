package kr.co.kosmo.mvc.controller.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.kosmo.mvc.dao.MemberDao;
import kr.co.kosmo.mvc.dao.SendMailDao;
import kr.co.kosmo.mvc.dao.BookDao;
import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.ItemVO;
import kr.co.kosmo.mvc.vo.LocalVO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;
import kr.co.kosmo.mvc.vo.SendMailVO;
import kr.co.kosmo.mvc.vo.BookVO;

@Service
public class BookService {
	@Autowired
	private BookDao bookdao;
	
	@Autowired 
	private SendMailDao smdao;


	@Autowired
	private MemberDao memdao;

//=============================================================
	// 예약 폼에 적용
	public LocalVO detailLocalTotal(int lid) {
		return bookdao.detailLocalTotal(lid);
	}

	// add
	// 단위처리 (예약+결제+멤버십포인트)
	@Transactional
	public void addBookCh(BookVO bookvo, ChargeMVO chvo, SendMailVO mailvo, int num) {
		// 예약--------------------------------------------
		bookdao.addBook(bookvo);

		// 결제--------------------------------------------
		bookdao.addChage(chvo);

		// 메일--------------------------------------------
		smdao.textupdate(mailvo);
		
		// 포인트&누적결제금액----------------------------------
		// 결제할때 마다 포인트 추가 => id / point 받기
		MemberVO mvo = new MemberVO();
		int mnum = num;
		mvo.setMnum(mnum);

		// point 계산----------
		// 결제금액 chvo.getChpay()
		int chpay = chvo.getChpay();
		System.out.println("결제금액 : " + chpay);
		// 등급 별 포인트 계산 0.02~0.1
		MembershipVO mbsvo = memdao.mbsPoint(mnum);
		float mbspoint = mbsvo.getMbspoint();
		System.out.println("등급 별 포인트  : " + mbspoint);

		// 추가될 포인트 : 결제금액*등급별 포인트 계산법
		int mpoint = (int) (chpay * mbspoint);
		System.out.println("추가될 포인트  : " + mpoint);

		// db에 전달
		mvo.setMpoint(mpoint); //포인트 추가
		mvo.setMcharge(chpay); //결제금액 추가

		memdao.upMPoint(mvo);

		// 누적결제금액에 따른 멤버십등급 변경------------------------
		memdao.updateMbs(mnum);
	}

//=============================================================
	// 예약 리스트 출력 + 최근Top3 => 멤버 컨트롤러에서 사용
	public List<BookVO> listBook(BookVO bookvo) {
		return bookdao.listBook(bookvo);
	}

//=============================================================
	// 예약수정 폼에 적용
	public BookVO updateBookForm(int bid) {
		return bookdao.updateBookForm(bid);
	}

	// update
	// 단위처리 (예약+결제+멤버십포인트)
	@Transactional
	public void updateBookCh(BookVO bookvo, ChargeMVO chvo, int num) {
		// 예약--------------------------------------------
		bookdao.updateBook(bookvo);

		// 결제--------------------------------------------
		bookdao.updateChage(chvo);

		// 포인트--------------------------------------------
		// 결제할때 마다 포인트 추가 => id / point 받기
		/*
		 * MemberVO mvo = new MemberVO(); // id String mid = id;
		 * System.out.println("아이디 : " + mid); mvo.setMid(mid);
		 * 
		 * // point 계산 // 결제금액 chvo.getChpay() int chpay = chvo.getChpay();
		 * System.out.println("결제금액 : " + chpay); // 등급 별 포인트 계산 0.02~0.1 MembershipVO
		 * mbsvo = memdao.mbsPoint(mid); float mbspoint = mbsvo.getMbspoint();
		 * System.out.println("등급 별 포인트  : " + mbspoint);
		 * 
		 * // 추가될 포인트 : 결제금액*등급별 포인트 계산법 int mpoint = (int) (chpay * mbspoint);
		 * System.out.println("추가될 포인트  : " + mpoint); mvo.setMpoint(mpoint);
		 * 
		 * // db에 전달 memdao.upMPoint(mvo); System.out.println("=====포인트Svc 실행됨!=====");
		 */
	}

//=============================================================
	// 예약취소
	public void delBook(BookVO bookvo) {
		bookdao.delBook(bookvo);
	}

//=============================================================
	// 날짜 제한
	// uplimit 수정 : 0 수정가능 / 1 직접연락해서 수정
	// dellimit 취소 : 1일 직접연락 / 3일 50%환불 / 5일 70%환불 / 7일 100%환불
	public BookVO changeLimit(int bid) {
		return bookdao.changeLimit(bid);
	}

//=============================================================
	// 마이페이지 => useHistory에 출력 => MemberController
	public BookVO useHistory(int mnum) {
		return bookdao.useHistory(mnum);
	}
//=============================================================
	// 차트 적용 => MemberRestController
	// 예약 횟수 출력
	public List<BookVO> tourCount(int mnum) {
		return bookdao.tourCount(mnum);
	}
	// 방문 여행지
	public List<BookVO> visitSpot(int mnum) {
		return bookdao.visitSpot(mnum);
	}
	// 최대 여행기간
	public List<BookVO> periodMax(int mnum) {
		return bookdao.periodMax(mnum);
	}
	// 주 결제 방식
	public List<BookVO> costType(int mnum) {
		return bookdao.costType(mnum);
	}
	// 누적 여행 비용
	public List<BookVO> costTotal(int mnum) {
		return bookdao.costTotal(mnum);
	}

//=============================================================
	// 상위리스트 출력
	public List<BookVO> rankLocal() {
		return bookdao.rankLocal();
	}

	// 객실 정보
	public List<ItemVO> detailItem(int lid) {
		return bookdao.detailItem(lid);
	}

	// 객실 확인
	public int checkItem(ItemVO vo) {
		return bookdao.checkItem(vo);
	}

	// 숙박일수
	public int getBookCnt(ItemVO vo) {
		return bookdao.getBookCnt(vo);
	}

}
