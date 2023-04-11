package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.NoticeVO;

@Repository
public class NoticeDao implements NoticeInter {
	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addinsert(NoticeVO vo) {
		ss.insert("notice.add", vo);
	}

	@Override
	public List<NoticeVO> noList() {
		List<NoticeVO> list = ss.selectList("notice.list");
		return list;
	}

}
