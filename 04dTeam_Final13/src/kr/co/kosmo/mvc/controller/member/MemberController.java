package kr.co.kosmo.mvc.controller.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.NumberFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.controller.service.BookService;
import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.dao.ReviewDaoInter;
import kr.co.kosmo.mvc.vo.BookVO;
import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;
import kr.co.kosmo.mvc.vo.ReviewVO;

@Controller
@RequestMapping(value = "/member")
public class MemberController {
	@Autowired
	private MemberDaoInter memberdao;
	
	@Autowired
	private BookService booksvc;

	@Autowired
	private ReviewDaoInter reviewDaoInter;

	//ȸ������ : signupForm���� �̵�
	@GetMapping(value = "/signUpForm")
	public ModelAndView signUpForm() {
		ModelAndView mav = new ModelAndView("member/signUpForm");
		return mav;
	}
	//ȸ������ : Form���� �ۼ��� ������ ����  => �������� �̵�
	@PostMapping(value = "/signUpProcess")
	public String signUpProcess(MemberVO vo) {
		memberdao.addMember(vo);
		return "redirect:/main";
	}
//====================================================
	//����������
	@GetMapping(value = "/mypage")
	public ModelAndView mypage(HttpSession session,int mnum) {
		ModelAndView mav = new ModelAndView("member/mypage");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mnum);
		mav.addObject("mbsvo", mbsvo);
		//���� ���� ����-----------------------------------
		String mid = (String) session.getAttribute("sessionID");
		int rcnt = reviewDaoInter.cntReview(mid);
		mav.addObject("rcnt", rcnt);
		//--------------------------------------------
		return mav;
	}
	//���������� ������
	@GetMapping(value = "/mypageDetail" , produces = "application/json;charset=utf-8")
	public ModelAndView mypageDetail(int mnum) {
		ModelAndView mav = new ModelAndView("member/mypageDetail");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mnum);
		mav.addObject("mbsvo", mbsvo);
		//--------------------------------------------
		return mav;
	}
	//���ǿ��ฮ��Ʈ
	@GetMapping(value = "/UseHistoryList")
	public ModelAndView UseHistoryList(int mnum , int chk) {
		ModelAndView mav;
		//����Ʈ ��� or �ֱ��̿볻��TOP3 ��� �����ϱ� => listchk ����
		int listchk = chk;
		BookVO vo = new BookVO();
		vo.setMid(mnum);
		vo.setListchk(listchk);

		//listchk ���� �� View ���� �ٸ��� �̵�
		//System.out.println("listchk : "+listchk);
		if(listchk==1) {
			mav = new ModelAndView("member/useHistoryTop3");			
		}else{
			mav = new ModelAndView("member/useHistoryList");			
		}
		
		//������ �ֱ�
		List<BookVO> blist = booksvc.listBook(vo);
		mav.addObject("blist", blist);

		BookVO bvo = booksvc.useHistory(mnum);		
		mav.addObject("bvo", bvo);
		
		return mav;
	}

	//���������� ��Ʈ
	@GetMapping(value = "/mypageChart")
	public ModelAndView mypageChart(int mnum) {
		ModelAndView mav = new ModelAndView("member/mypageChart");
		//���+�����------------------------------------
		MembershipVO mbsvo = memberdao.memMembership(mnum);
		mav.addObject("mbsvo", mbsvo);
		//--------------------------------------------
		return mav;
	}	
	
	//���Ǹ��丮��Ʈ
	@GetMapping(value = "/myReviewList")
	public ModelAndView myReviewList(String mid) {
		ModelAndView mav = new ModelAndView("member/myReviewList");

		//���� ���� ����
		ReviewVO rvo = new ReviewVO();
		rvo.setListchk(2); //����Ʈ ��¹�� ����
		rvo.setRewriter(mid); //��� fk ����
		
		List<ReviewVO> listReview = reviewDaoInter.listReview(rvo);
		mav.addObject("listReview", listReview);
		
		//���� ���� ����
		int rcnt = reviewDaoInter.cntReview(mid);
		mav.addObject("rcnt", rcnt);
		
		return mav;
	}
	
	
	//���������� �� Ķ����
	@GetMapping(value = "/mypageTest")
	public ModelAndView mypageTest() {
		ModelAndView mav = new ModelAndView("member/mypage_Test");
		return mav;
	}
	
	
//====================================================
	//ȸ������ : ȸ������Form���� �̵�
	@GetMapping(value = "/upmemForm")
	public ModelAndView upmemForm() {
		ModelAndView mav = new ModelAndView("member/upmemForm");
		return mav;
	}
	//ȸ������ : ȸ������Form���� �ۼ��� ������ ����  => �������� �̵�
	@PostMapping(value = "/updateProcess")
	public String updateProcess(HttpSession session,MemberVO vo) {
		//�������� DB�� ����
		memberdao.upMember(vo);
		
		//����Ǿ��� ���� ����
		session.removeAttribute("sessionNum");		
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");

		//�������뿡 ���� ���ο� ���� �ο�
		MemberVO dto = memberdao.login(vo); //���Ǻο��� ���� �ش�޼��� �ҷ�����
		session.setAttribute("sessionNum", dto.getMnum());
		session.setAttribute("sessionID", dto.getMid());
		session.setAttribute("sessionName", dto.getMname());

		return "redirect:/main";
	}
//====================================================
	//ȸ��Ż�� : ȸ������ �� main���� �̵�
	@GetMapping(value = "/delmem")
	public String delMember(int mnum , HttpSession session) {
		memberdao.delMember(mnum);
		//����� ���� ����
		session.removeAttribute("sessionNum");
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");
		return "redirect:/main";
	}
	@GetMapping(value = "/mbti")
	public ModelAndView mbti() {
		ModelAndView mav = new ModelAndView("member/mbti");
		return mav;
	}
}
