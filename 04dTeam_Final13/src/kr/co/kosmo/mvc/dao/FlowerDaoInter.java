package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.FlowerVO;

public interface FlowerDaoInter {
	public List<FlowerVO> flowerAllList();
	public List<FlowerVO> flowerList(String flo);
	

}
