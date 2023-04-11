package kr.co.kosmo.mvc.controller.book;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.kosmo.mvc.controller.service.BookService;
import kr.co.kosmo.mvc.vo.BookVO;
import kr.co.kosmo.mvc.vo.ItemVO;

@RestController
public class BookRestController {
	@Autowired
	private BookService booksvc;

//====================================================
	// �������� ����
	@GetMapping(value = "/listLocalBook")
	public String listLocalBook(int lid, String sdate, String edate) {
		List<ItemVO> list = booksvc.detailItem(lid);
		List<Integer> cntList = new ArrayList<Integer>();

		for (ItemVO e : list) {
			e.setSdate(sdate);
			e.setEdate(edate);

			cntList.add(booksvc.checkItem(e));
		}

		// getBookCnt
		ItemVO vo = new ItemVO();

		vo.setSdate(sdate);
		vo.setEdate(edate);

		int bookCnt = booksvc.getBookCnt(vo);
		System.out.println(sdate);
		System.out.println(edate);
		System.out.println(bookCnt);
		String result = "[{\"cntList\":" + cntList + "},{\"bookCnt\":\"" + bookCnt + "\"}]";
		// System.out.println(result);

		return result;
	}

//====================================================
	// ���� ���� �� ��� => ��¥ ���� Ȯ��
	@RequestMapping(value = "/bookUpdateJson", produces = "application/json;charset=utf-8")
	public String bookUpdateJson(String chk, int bid) {
		BookVO bvo;
		// ��¥ ����
		// uplimit ���� : 0 �������� / 1 ���������ؼ� ����
		// dellimit ��� : 1�� �������� / 3�� 50%ȯ�� / 5�� 70%ȯ�� / 7�� 100%ȯ��
		bvo = booksvc.changeLimit(bid);
		int datediff = bvo.getDatediff();
		int uplimit = bvo.getUplimit();
		int dellimit = bvo.getDellimit();
		// System.out.println("=====��¥ ���� Test=====");
		// System.out.println("��¥���� => " + datediff);
		// System.out.println("�������� ���� => " + uplimit);
		// System.out.println("��ұݾ� => " + dellimit);

		String result = null;
		String limitMsg = null;

		if (chk.equals("upBtn")) {
			if (uplimit == 0) { // ������� ����
				limitMsg = "���� ���� ����";
			} else if (uplimit == 1) { // ������� �Ұ���
				limitMsg = "���� ���� �Ұ���! ȣ��Ʈ���� ���� �����ϼ���";
			}
		} else if (chk.equals("delBtn")) {
			if (datediff <= 1) {
				limitMsg = "�ԽǱ��� ���� �Ⱓ " + datediff + "�� => ���� ��� �Ұ���! ȣ��Ʈ���� ���� �����ϼ���";
			} else if (datediff <= 3) {
				limitMsg = "�ԽǱ��� ���� �Ⱓ " + datediff + "��(50% ȯ��) => ���� ��ұݾ� : " + dellimit + "�� �Դϴ�. ";
			} else if (datediff <= 5) {
				limitMsg = "�ԽǱ��� ���� �Ⱓ " + datediff + "��(70% ȯ��) => ���� ��ұݾ� : " + dellimit + "�� �Դϴ�. ";
			} else {
				limitMsg = "�ԽǱ��� ���� �Ⱓ " + datediff + "��(100% ȯ��) => ���� ��ұݾ� : " + dellimit + "�� �Դϴ�. ";
			}
		}

		ObjectMapper objmapper = new ObjectMapper();

		try {
			result = objmapper.writeValueAsString(limitMsg);
			result = "[{\"uplimit\":" + uplimit + "},{\"limitMsg\":\"" + limitMsg + "\"}]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}

}
