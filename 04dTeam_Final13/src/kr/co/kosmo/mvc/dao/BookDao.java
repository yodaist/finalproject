package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.ChargeMVO;
import kr.co.kosmo.mvc.vo.ItemVO;
import kr.co.kosmo.mvc.vo.LocalVO;
import kr.co.kosmo.mvc.vo.BookVO;

@Repository
public class BookDao {
	@Autowired
	private SqlSessionTemplate ss;

// ==============================================
	// ����
	// ���� ���� ����
	public LocalVO detailLocalTotal(int lid) {
		return ss.selectOne("book.detailLocalTotal", lid);
	}

	// ------------------------------
	// book
	public void addBook(BookVO bookvo) {
		ss.insert("book.addBook", bookvo);
	}

	// charge
	public void addChage(ChargeMVO chvo) {
		ss.insert("book.addBookCh", chvo);
	}

// ==============================================
	// ���� ����Ʈ ��� + �ֱ�Top3
	public List<BookVO> listBook(BookVO bookvo) {
		return ss.selectList("book.listBookRank", bookvo);
	}

// ==============================================
	// �������
	// ���� ���� ����
	public BookVO updateBookForm(int bid) {
		return ss.selectOne("book.updateBookForm", bid);
	}

	// ------------------------------
	// book
	public void updateBook(BookVO bookvo) {
		ss.update("book.updateBook", bookvo);
	}

	// charge
	public void updateChage(ChargeMVO chvo) {
		ss.update("book.updateBookCh", chvo);
	}

// ==============================================
	// �������
	public void delBook(BookVO bookvo) {
		ss.delete("book.delBook", bookvo);
	}

// ==============================================
	// ��¥ ����
	// uplimit ���� : 0 �������� / 1 ���������ؼ� ����
	// dellimit ��� : 1�� �������� / 3�� 50%ȯ�� / 5�� 70%ȯ�� / 7�� 100%ȯ��
	public BookVO changeLimit(int bid) {
		return ss.selectOne("book.changeLimit", bid);
	}

//==============================================
	// ���������� => useHistory�� ���
	public BookVO useHistory(int mnum) {
		return ss.selectOne("book.useHistory", mnum);
	}

//==============================================
	// ��Ʈ ����
	// ���� Ƚ�� ���
	public List<BookVO> tourCount(int mnum) {
		return ss.selectList("book.tourcount", mnum);
	}
	// �湮 ������
	public List<BookVO> visitSpot(int mnum) {
		return ss.selectList("book.visitSpot", mnum);
	}
	// �ִ� ����Ⱓ
	public List<BookVO> periodMax(int mnum) {
		return ss.selectList("book.periodMax", mnum);
	}
	// �� ���� ���
	public List<BookVO> costType(int mnum) {
		return ss.selectList("book.costType", mnum);
	}
	// ���� ���� ���
	public List<BookVO> costTotal(int mnum) {
		return ss.selectList("book.costTotal", mnum);
	}

//==============================================
	// ��������Ʈ ���
	public List<BookVO> rankLocal() {
		return ss.selectList("book.rankLocal");
	}

	// ���� ����
	public List<ItemVO> detailItem(int lid) {
		return ss.selectList("book.detailItem", lid);
	}

	// ���� Ȯ��
	public int checkItem(ItemVO vo) {
		return ss.selectOne("book.checkItem", vo);
	}

	// �����ϼ� �ޱ�
	public int getBookCnt(ItemVO vo) {
		return ss.selectOne("book.getBookCnt", vo);
	}
}
