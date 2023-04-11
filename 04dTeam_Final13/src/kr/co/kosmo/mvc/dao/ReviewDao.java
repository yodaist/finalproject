package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.NoticeVO;
import kr.co.kosmo.mvc.vo.ReviewVO;

@Repository
public class ReviewDao implements ReviewDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addReview(ReviewVO vo) {
		ss.insert("review.addReview", vo);
	}

	//���� ����Ʈ => �������� �� ����Ʈ 1 / ���������� �� ����Ʈ2
	@Override
	public List<ReviewVO> listReview(ReviewVO vo) {
		return ss.selectList("review.listReview", vo);
	}

	@Override
	public int cntReview(String rewriter) {
		return ss.selectOne("review.cntReview", rewriter);
	}

	@Override
	public int getstarAvg(int recode) {
		return ss.selectOne("review.getstarAvg",recode);
	}

}
