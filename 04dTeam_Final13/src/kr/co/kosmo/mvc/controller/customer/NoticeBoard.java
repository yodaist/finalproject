package kr.co.kosmo.mvc.controller.customer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.NoticeInter;
import kr.co.kosmo.mvc.vo.NoticeVO;

//공지사항게시판
@Controller
@RequestMapping(value = "/customernotice")
public class NoticeBoard {
	@Autowired
	private NoticeInter dao;

	@RequestMapping(value = "/addinsert")
	public ModelAndView addinsert(NoticeVO vo) {
		ModelAndView mav = new ModelAndView("customer_notice/noticeList");

		dao.addinsert(vo);

		List<NoticeVO> list = dao.noList();

		mav.addObject("list", list); // request.setAttribute 같은 기능

		return mav;
	}

	@GetMapping(value = "/listNo")
	public ModelAndView listNo() {
		List<NoticeVO> list = dao.noList();
		ModelAndView mav = new ModelAndView("customer_notice/noticeList");

		mav.addObject("list", list); // request.setAttribute 같은 기능

		return mav;
	}

	@GetMapping(value = "/form")
	public String form() {
		return "customer_notice/noticeForm";

	}

	/*
	 * @GetMapping(value = "/notice") public ModelAndView notice() { ModelAndView
	 * mav = new ModelAndView("customer_notice/noticeList"); return mav; }
	 */
}