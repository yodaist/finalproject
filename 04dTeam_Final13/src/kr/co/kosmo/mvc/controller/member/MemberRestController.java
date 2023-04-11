package kr.co.kosmo.mvc.controller.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.kosmo.mvc.controller.service.BookService;
import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.BookVO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;

@RestController
public class MemberRestController {
	@Autowired
	private MemberDaoInter memberdao;

	@Autowired
	private BookService booksvc;

//====================================================
	// ������������ ��Ʈ
	// [{sub:���ɴ뺰~},Map]
	@RequestMapping(value = "/membershipGauge", produces = "application/json;charset=utf-8")
	public String tourCount2(int mnum) {
		MembershipVO mbsvo = memberdao.chartMbs(mnum);
		List<MemberVO> list = mbsvo.getMember();
		String gradename = mbsvo.getMbsname();
		// System.out.println("gradename => "+gradename);

		int grade = 0;
		int percentage = 0;

		for (MemberVO e : list) {
			// System.out.println("grade => "+e.getMgrade());
			// System.out.println("Percentage => "+e.getPercentage());
			grade = e.getMgrade();
			percentage = e.getPercentage();
		}

		String result = null;

		ObjectMapper objmapper = new ObjectMapper();

		try {
			result = objmapper.writeValueAsString(grade);
			result = objmapper.writeValueAsString(percentage);
			result = "[{\"grade\":" + grade + "},{\"percentage\":\"" + percentage + "\"},{\"gradename\":\"" + gradename
					+ "\"}]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}

//====================================================
	// ������������ ���� �׷��� => ��Ʈ
	// [{sub:���ɴ뺰~},Map]
//----------	
	// �� �� ���� Ƚ��
	@RequestMapping(value = "/tourMonthCount", produces = "application/json;charset=utf-8")
	public String tourCount(int mnum) {
		// 1. �ڵ鸵�� ������ List ����
		List<BookVO> list = booksvc.tourCount(mnum);

		// 2. ���� ���� => String
		String subject = "�� �� ���� ����";

		// 3. ������ ���� => Map
		// {2023-03:4},{2023-02:3}...
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 3-1. foreach������ ���� ������ map �ȿ� ����
		// List<ReservationVO> ����Ǿ����Ƿ� ReservationVO�� �� ����
		for (BookVO e : list) {
			// key : N��
			// value : CNT��
			map.put(e.getMonth(), e.getTcount());
		}

		// 4. return��ȯ ���� ����� ���� => String
		String result = null;

		// 5. ObjectMapper ���� : ��ü�� ���ڿ��� ��ȯ => JSON?
		ObjectMapper objmapper = new ObjectMapper();

		// 6. result�� ���ڿ��� ��ȯ�� ��(=Map_survey ������) ���� => writeValueAsString
		// => try/catch
		try {
			// {"2023-03":4},{"2023-02":3}...
			result = objmapper.writeValueAsString(map);

			// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
			// ���� : [{"sub":"����"},map]
			result = "[{\"sub\":\"" + subject + "\"}," + result + "]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}
	// ----------
	// �湮 ������
	@RequestMapping(value = "/visitSpotCount", produces = "application/json;charset=utf-8")
	public String visitSpotCount(int mnum) {
		// 1. �ڵ鸵�� ������ List ����
		List<BookVO> list = booksvc.visitSpot(mnum);

		// 2. ���� ���� => String
		String subject = "�湮 ������";

		// 3. ������ ���� => Map
		// {����:4},{��õ:3}...
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 3-1. foreach������ ���� ������ map �ȿ� ����
		// List<ReservationVO> ����Ǿ����Ƿ� ReservationVO�� �� ����
		for (BookVO e : list) {
			// key : ����
			// value : CNT��
			map.put(e.getLocal().getLarea(), e.getLocal().getLocalcnt());
		}

		// 4. return��ȯ ���� ����� ���� => String
		String result = null;

		// 5. ObjectMapper ���� : ��ü�� ���ڿ��� ��ȯ => JSON?
		ObjectMapper objmapper = new ObjectMapper();

		// 6. result�� ���ڿ��� ��ȯ�� ��(=Map_survey ������) ���� => writeValueAsString
		// => try/catch
		try {
			// {����:4},{��õ:3}.....
			result = objmapper.writeValueAsString(map);

			// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
			// ���� : [{"sub":"����"},map]
			result = "[{\"sub\":\"" + subject + "\"}," + result + "]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}
	// ----------
	// �ִ� ���� �Ⱓ
	@RequestMapping(value = "/periodMaxChart", produces = "application/json;charset=utf-8")
	public String periodMax(int mnum) {
		// 1. �ڵ鸵�� ������ List ����
		List<BookVO> list = booksvc.periodMax(mnum);

		// 2. ���� ���� => String
		String subject = "�ִ� ���� �Ⱓ";

		// 3. ������ ���� => Map
		// {2023-02-11:3},{2023-03-29:4},...
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 3-1. foreach������ ���� ������ map �ȿ� ����
		// List<BookVO> ����Ǿ����Ƿ� BookVO�� �� ����
		for (BookVO e : list) {
			// key : ��¥
			// value : ��¥���̰�
			map.put(e.getSdate(), e.getDatediff());
		}

		// 4. return��ȯ ���� ����� ���� => String
		String result = null;

		// 5. ObjectMapper ���� : ��ü�� ���ڿ��� ��ȯ => JSON?
		ObjectMapper objmapper = new ObjectMapper();

		// 6. result�� ���ڿ��� ��ȯ�� ��(=Map_survey ������) ���� => writeValueAsString
		// => try/catch
		try {
			// {"2023-02-11":3},{"2023-03-29":4}...
			result = objmapper.writeValueAsString(map);

			// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
			// ���� : [{"sub":"����"},map]
			result = "[{\"sub\":\"" + subject + "\"}," + result + "]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}

	// ----------
	// �� ���� ���
	@RequestMapping(value = "/costTypeChart", produces = "application/json;charset=utf-8")
	public String visitSpot(int mnum) {
		// 1. �ڵ鸵�� ������ List ����
		List<BookVO> list = booksvc.costType(mnum);

		// 2. ���� ���� => String
		String subject = "�� ���� ���";

		// 3. ������ ���� => Map
		// {�������:3},{ī��:4}...
		Map<String, Integer> map = new HashMap<String, Integer>();
		// 3-1. foreach������ ���� ������ map �ȿ� ����
		// List<BookVO> ����Ǿ����Ƿ� BookVO�� �� ����
		for (BookVO e : list) {
			// key : ����Ÿ��
			// value : cnt
			map.put(e.getCharge().getChtype(), e.getCharge().getCtypecnt());
		}

		// 4. return��ȯ ���� ����� ���� => String
		String result = null;

		// 5. ObjectMapper ���� : ��ü�� ���ڿ��� ��ȯ => JSON?
		ObjectMapper objmapper = new ObjectMapper();

		// 6. result�� ���ڿ��� ��ȯ�� ��(=Map_survey ������) ���� => writeValueAsString
		// => try/catch
		try {
			// {"�������":3},{"ī��":4}...
			result = objmapper.writeValueAsString(map);

			// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
			// ���� : [{"sub":"����"},map]
			result = "[{\"sub\":\"" + subject + "\"}," + result + "]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		return result;
	}

// ----------
	// ���� ���� ���
	// [{sub:���ɴ뺰~},[��¥],[�����ݾ�]]
	@RequestMapping(value = "/costTotalChart", produces = "application/json;charset=utf-8")
	public String costTotal(int mnum) {
		// 1. �ڵ鸵�� ������ List ����
		List<BookVO> list = booksvc.costTotal(mnum);

		// 2. ���� ���� => String
		String subject = "���� ���� ���";

		// 3. ������ ���� => List
		// ['2023-02-11','2023-03-29'..],[180000,680000...]
		List<String> datelist = new ArrayList<>(); // ��¥
		List<Object> sumlist = new ArrayList<>(); // ���� ��
		// 3-1. foreach������ ���� ������ map �ȿ� ����
		// List<BookVO> ����Ǿ����Ƿ� BookVO�� �� ����
		datelist.add("\'x\'");
		sumlist.add("\'���� ���� ���\'");
		for (BookVO e : list) {
			// key : ��¥
			// value : ���� ��
			datelist.add("\'" + e.getSdate() + "\'");
			sumlist.add(e.getCharge().getTotal());
		}
		System.out.println("datelist => " + datelist);
		System.out.println("sumlist => " + sumlist);

		// 4. return��ȯ ���� ����� ���� => String
		String result = null;

		// 5. ObjectMapper ���� : ��ü�� ���ڿ��� ��ȯ => JSON?
		ObjectMapper objmapper = new ObjectMapper();

		// 6. result�� ���ڿ��� ��ȯ�� ��(=Map_survey ������) ���� => writeValueAsString
		// => try/catch
		try {
			// {"2023-02-11":3},{"2023-03-29":4}...
			result = objmapper.writeValueAsString(datelist);

			// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
			// ���� : [{"sub":"����"},map]
			result = "[{\"sub\":\"" + subject + "\"},{\"datelist\":\"" + datelist + "\"},{\"sumlist\":\"" + sumlist
					+ "\"}]";
		} catch (JsonProcessingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		// 7. result�� JSON�� ���� �� �ִ� ���·� ���� �� ����(�ڵ鸵)
		// ���� : [{"sub":"����"},map]

		return result;
	}
//====================================================

}
