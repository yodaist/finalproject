package kr.co.kosmo.mvc.controller.member;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberVO;

@Controller
@RequestMapping(value = "/login")
public class LoginMemberController {
	@Autowired
	private MemberDaoInter memberdao;
	
//========================================================================
	// īī���� �α��� API ����
	@GetMapping(value = "/kakaoLogin", produces = "application/json;charset=utf-8")
	public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code,HttpSession session) throws Throwable {
		ModelAndView mav;
		// 1�� : īī���忡 ����� �ڵ� �ޱ�(jsp�� a�±� href�� ��� ����)
		System.out.println("KaKaoLogin code:" + code);

		// 2�� : ���� code�� iKakaoS.getAccessToken�� ���� ###access_Token###�� �� �� �������� �����ܰ�����
		String access_Token = memberdao.getAccessToken(code);
		System.out.println("###access_Token#### : " + access_Token);
		// ���� access_Token �޴� �� Ȯ���� �Ŀ� �ؿ� ����

		// 3�� : ���� access_Token�� iKakaoS.getUserInfo�� ���� userInfo�޾ƿ�, userInfo�� nickname,email������ �������
		HashMap<String, Object> userInfo = memberdao.getUserInfo(access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));
		
		//VO�� �� ����-------------------------------------------------
		MemberVO vo = new MemberVO();
		vo.setMname((String) userInfo.get("nickname"));
		vo.setMemail((String) userInfo.get("email"));
		//db�� �����ؼ� �α���--------------------------------------------
		MemberVO dto = memberdao.kakaologin(vo);
		if (dto == null) { // �α��� ����
			System.out.println("īī�� �α��ν���"); // test�� => �ٲٱ�
			mav = new ModelAndView("member/signUpForm");
		} else {
			mav = new ModelAndView("main/mainbody");
			session.setAttribute("sessionNum", dto.getMnum());
			session.setAttribute("sessionID", dto.getMid());
			session.setAttribute("sessionName", dto.getMname());
			session.setAttribute("sessionEmail", dto.getMemail());
			System.out.println("sessionEmail=>" + session.getAttribute("sessionEmail"));
		}
		return mav;
	}

//========================================================================
	// �α��� : loginForm���� �̵�
	@GetMapping(value = "/loginForm")
	public ModelAndView loginForm() {
		ModelAndView mav = new ModelAndView("login/loginForm");
		return mav;
	}

	// �α��� : Form���� �ۼ��� �����ͷ� loginInsert + ���ǽɱ� => Main���� �̵�
	@PostMapping(value = "/loginProcess")
	public ModelAndView logProcessIn(HttpSession session, HttpServletRequest request, MemberVO vo,
			@RequestHeader("User-Agent") String userAgent) {
		MemberVO dto = memberdao.login(vo);
		ModelAndView mav;
		if (dto == null) { // �α��� ����
			mav = new ModelAndView("login/loginForm");
			System.out.println("�α��ν���"); // test�� => �ٲٱ�
		} else {
			mav = new ModelAndView("main/mainbody");
			session.setAttribute("sessionNum", dto.getMnum());
			session.setAttribute("sessionID", dto.getMid());
			session.setAttribute("sessionName", dto.getMname());
			session.setAttribute("sessionEmail", dto.getMemail());
			System.out.println("sessionEmail=>" + session.getAttribute("sessionEmail"));
		}
		return mav;
	}

	// �α׾ƿ� : ��������� => Main���� �̵�
	@GetMapping(value = "/logoutProcess")
	// public ModelAndView logProcessOut(HttpSession session,HttpServletRequest
	// request) {
	public ModelAndView logOutProcess(HttpSession session, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("main/mainbody");
		session.removeAttribute("sessionNum");
		session.removeAttribute("sessionID");
		session.removeAttribute("sessionName");
		session.removeAttribute("sessionEmail");
		System.out.println("�α׾ƿ�!"); // test�� => �ٲٱ�
		return mav;
	}

//========================================================================
	// ID&PWDã�� �������� �̵�
	@GetMapping(value = "/idpwdSearch")
	public ModelAndView idpwdSearch() {
		ModelAndView mav = new ModelAndView("login/idpwdSearch");
		return mav;
	}

//========================================================================
	// IDã�� : idSearchForm���� �̵�
	@GetMapping(value = "/idSearch")
	public ModelAndView idSearch() {
		ModelAndView mav = new ModelAndView("login/idSearch");
		return mav;
	}

	// IDã�� : Form���� �ۼ��� ������ �˻� �� ���Ϲ߼�/Ȯ��
	@PostMapping(value = "/idSearchProcess")
	public ModelAndView idSearchProcess() {
		ModelAndView mav = new ModelAndView("login/idSearchProcess");
		return mav;
	}

//========================================================================
	// PWDã�� : pwdSearchForm���� �̵�
	@GetMapping(value = "/pwdSearch")
	public ModelAndView pwdSearch() {
		ModelAndView mav = new ModelAndView("login/resetForm");
		return mav;
	}

	// PWDã�� : Form���� �ۼ��� ������ �˻� �� ���Ϲ߼�
	@PostMapping(value = "/pwdSearchProcess")
	public ModelAndView pwdSearchProcess() {
		ModelAndView mav = new ModelAndView("login/pwdSearchProcess");
		return mav;
	}

}
