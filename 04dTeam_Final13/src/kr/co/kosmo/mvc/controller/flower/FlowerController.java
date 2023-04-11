package kr.co.kosmo.mvc.controller.flower;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.FlowerDaoInter;
import kr.co.kosmo.mvc.vo.FlowerVO;

@Controller
@CrossOrigin(origins = "http://test.com")
@RequestMapping(value = "/flower")
public class FlowerController {
	@Autowired
	private FlowerDaoInter flower;

	// 경로 설정하기
	@GetMapping(value = "/flowerpath")
	public String flowerpath() {
		return "flower/flowerdata";
	}

	@GetMapping(value = "/dashboard")
	public String dashboard() {
		return "flower/dashboard";
	}

	@RequestMapping(value = "/flowerAllList")
	public String flowerAllList(Model m) {
		List<FlowerVO> list = flower.flowerAllList();
		m.addAttribute("list", list);
		return "flower/flowerAllList";
	}
	


}
