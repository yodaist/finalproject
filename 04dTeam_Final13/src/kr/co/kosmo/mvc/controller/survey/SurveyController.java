package kr.co.kosmo.mvc.controller.survey;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.controller.service.SurveyService;
import kr.co.kosmo.mvc.dao.SurveyDao;
import kr.co.kosmo.mvc.vo.SurveyCheckVO;
import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

@Controller
@RequestMapping(value = "/survey")
public class SurveyController {
	@Autowired
	private SurveyService surveyservice;
	
	@Autowired
	private SurveyDao dao;
	
	@RequestMapping(value = "/surveyForm")
	public String surform() {
		return "survey/surveyAddform";
	}

	@RequestMapping(value = "/addsurvey")
	public ModelAndView surveyadd(SurveyVO vo,HttpServletRequest request) {
		//httpHttpServletRequest request : 폼에서 surveytitle 넘어올때 파라미터값 받기위해
		String[] surveytitle = request.getParameterValues("surveytitle"); //subtitle을 배열로 저장
		
		//DB에 전달하기 위한 List 만들기
		List<SurveyContentVO> list = new ArrayList<>();
		char stype = 'A';
		for (String e : surveytitle) {
			SurveyContentVO sv = new SurveyContentVO();
			sv.setSurveytitle(e);
			sv.setSurveycnt(0);
			sv.setSubtype(String.valueOf(stype));
			System.out.println("surveytitle : "+e);
			list.add(sv);
			stype++; //알파벳 증가
		}
		System.out.println("제목(Sub) : "+vo.getSub());		
		//surveyVO에 설문 타이틀을 저장한 List<SurveyContentVO> 인자로 전달
		vo.setSubvey(list);
		
		//service에 값 전달 => DB에 연결됨!
		surveyservice.addSurvey(vo, list);
		
		ModelAndView mav = new ModelAndView("redirect:surveyList");
		return mav;
	}
	
	@RequestMapping(value = "/surveyList")
    public ModelAndView surveylist() {
        ModelAndView mav = new ModelAndView("survey/surveyList");
        List<SurveyVO> list = surveyservice.listSurvey();
        mav.addObject("list", list);
        return mav;
	}
	
	@RequestMapping(value = "/surveyAdminDetail")
    public ModelAndView surveyDetail(int num) {
        ModelAndView mav = new ModelAndView("survey/surveyAdminDetail");
        SurveyVO vo = surveyservice.adminDetail(num);
        mav.addObject("vo", vo);
        return mav;
	}

	@RequestMapping(value = "/surveyDetail")
    public ModelAndView surveyClientDetail(int num) {
        ModelAndView mav = new ModelAndView("survey/surveyClientDetail");
        SurveyVO vo = surveyservice.adminDetail(num);
        mav.addObject("vo", vo);
        return mav;
	}

	@PostMapping(value = "/addSurveyClient")
    public String clientSurveyAdd(Model m, SurveyContentVO subvo, SurveyCheckVO scvo) {
		int cnt = dao.surveycheck(scvo);
		System.out.println(cnt);
		if(cnt==0) {
			System.out.println("Subcode : "+subvo.getSubcode());
			System.out.println("Subtype : " + subvo.getSubtype());
			System.out.println("Scid : " + scvo.getScid());
			System.out.println("Sccode : " + scvo.getSccode());
			System.out.println("Subtype : "+ scvo.getSubtype());
			surveyservice.updateSurveyCntck(subvo,scvo);			
		}else {
			System.out.println("else에 걸림");
		}
		 return "redirect:surveyList";
	}
	

	
	
	
}
