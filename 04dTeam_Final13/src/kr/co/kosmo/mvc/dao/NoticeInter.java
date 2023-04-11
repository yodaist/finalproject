package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.NoticeVO;

public interface NoticeInter {
    public void addinsert(NoticeVO vo);
    public List<NoticeVO> noList(); 
 }
