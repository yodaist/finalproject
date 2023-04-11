package kr.co.kosmo.mvc.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;

//RestController => json, 값을 커스텀뷰로 전달하는 목적

@RestController
public class IdCheckController {
	@Autowired
	private MemberDaoInter memberdao;

	// 반드시 id란 파라미터가 있어야 한다.(체크 대상) 
	@GetMapping(value="/idcheck")
	public int idCheck(@RequestParam String mid) {
		int cnt = memberdao.idcheck(mid);
		return cnt;
	}

}
