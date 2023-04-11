package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.FlowerVO;

@Repository
public class FlowerDao implements FlowerDaoInter{
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public List<FlowerVO> flowerAllList() {
		return ss.selectList("flower.flowerAlllist");
	}

	@Override
	public List<FlowerVO> flowerList(String flo) {
		return ss.selectList("flower.flowerlist",flo);
	}

	

}
