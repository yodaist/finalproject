package kr.co.kosmo.mvc.controller.host;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.HostDaoInter;
import kr.co.kosmo.mvc.vo.HostVO;
import kr.co.kosmo.mvc.vo.MembershipVO;

@Controller
@RequestMapping(value = "/host")
public class HostController {
	@Autowired
	private HostDaoInter hostdao;

//========================================================================
	// 회원가입 : signupForm으로 이동
	@GetMapping(value = "/hostSignup")
	public String hostsignUpForm() {
		return "host/hostSignup";
	}

	// 회원가입 : Form에서 작성한 데이터 저장 => 메인으로 이동
	// 등록버튼 누르면 디비에 데이터가 담기다.
	@PostMapping(value = "/hsignUpProcess")
	public String hsignUpProcess(HostVO vo) {
		hostdao.addHost(vo);
		return "redirect:/main";
	}
	
//========================================================================
	//회원탈퇴 : 회원삭제 및 main으로 이동
		@GetMapping(value = "/delhost")
		public String upmemForm(String hid , HttpSession session) {
			hostdao.delHost(hid);
			//저장된 세션 삭제
			session.removeAttribute("sessionHID");
			session.removeAttribute("sessionHName");
			return "redirect:/main";
		}

//========================================================================
	// host/hostpage
	@GetMapping(value = "/hostpage")
	public ModelAndView hostpage(String hid) {
		ModelAndView mav = new ModelAndView("host/hostpage");
		HostVO hvo = hostdao.hostpage(hid);
		mav.addObject("hvo", hvo);

		return mav;
	}

//========================================================================
	@GetMapping(value = "/uphostForm")
	public ModelAndView uphostForm() {
		ModelAndView mav = new ModelAndView("host/uphostForm");
		return mav;
	}

	@PostMapping(value = "/hostupdate")
	public String hostupdate(HostVO vo) {
		hostdao.hostupdate(vo);
		return "redirect:/main";
	}

}