package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.ReviewVO;

public interface ReviewDaoInter {
    public void addReview(ReviewVO vo);
    
    public List<ReviewVO> listReview(ReviewVO vo);

    public int cntReview(String rewriter); //���� ����
    
    public int getstarAvg(int recode); //���� ���
}