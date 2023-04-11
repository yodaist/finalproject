package kr.co.kosmo.mvc.controller.diary;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.DiaryDaoInter;
import kr.co.kosmo.mvc.vo.DiaryVO;

@Controller
@RequestMapping(value = "/diary")
public class DiaryController {
	@Autowired
	private DiaryDaoInter diaryDaoInter;

	// =================================================
	// ====================���==========================

	// ���̾ ��
	@GetMapping(value = "/diaryForm")
	public String diaryPath() {
		return "diary/diaryForm";
	}

	@GetMapping(value = "/photo")
	public String photo() {
		return "diary/photo";
	}

	// =================================================
	// ===================���ε�==========================

	@PostMapping(value = "/addDiary")
	public String addDiary(DiaryVO vo, HttpServletRequest request) {
		// request�� ������ �̹����� ��� �޾� ���
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");
		System.out.println("r_path: " + r_path);

		// ���ε�� �̹����� �̸��� �޾� �̹��� ����, �̹��� �̸� Ȯ��
		String oriFn = vo.getMfile().getOriginalFilename();
		System.out.println("oriFn: " + oriFn);

		// �̹��� ������ �� contentType Ȯ��
		long size = vo.getMfile().getSize();
		// img���ϸ� �ް� ���� ��� ��, ������ �����ϰ���� �� if�� �Ἥ ���!
		String contentType = vo.getMfile().getContentType();
		System.out.println("����ũ��:" + size);
		System.out.println("����ũ�� type: " + contentType);

		// �޸𸮻�(�ӽ������)�� ������ �츮�� ������ ��ο� ����!
		// �̹����� ����� ��� �����
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath: " + path);

		// �߻���(�̹����� ������ ���) ��ü ����
		File f = new File(path.toString());
		// �ӽø޸𸮿� ��� ���ε��� ������ �� => fileŬ������ ��η� ����
		try {
			vo.getMfile().transferTo(f); // ����
			vo.setDimg(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		diaryDaoInter.addDiary(vo);

		return "redirect:diaryList?dwriter=" + vo.getDwriter();
	}

	// =================================================
	// ===================����Ʈ==========================
	@RequestMapping(value = "/diaryList")
	public String diaryList(Model m, String dwriter) {
		List<DiaryVO> list = diaryDaoInter.listDiary(dwriter);
		m.addAttribute("list", list);
		return "diary/diaryList";
	}

	// =================================================
	// ===================������==========================
	@RequestMapping(value = "/diaryDetail")
	public String updateDetail(Model m, int num) {
		DiaryVO vo = diaryDaoInter.detailDiary(num);
		m.addAttribute("vo", vo);
		return "diary/diaryDetail";
	}

	// =================================================
	// =====================����==========================
	@RequestMapping(value = "/updatePath")
	public String updatePath(Model m, int num) {
		DiaryVO vo = diaryDaoInter.detailDiary(num);
		m.addAttribute("vo", vo);
		return "diary/diaryUpdate";
	}

	@PostMapping(value = "/updateDiary")
	public String updateDiary(Model m, DiaryVO vo, HttpServletRequest request) {
		String img_path = "resources\\imgfile";
		String r_path = request.getRealPath("/");
		System.out.println("r_path: " + r_path);

		// ���ε�� �̹����� �̸��� �޾� �̹��� ����, �̹��� �̸� Ȯ��
		String oriFn = vo.getMfile().getOriginalFilename();
		System.out.println("oriFn: " + oriFn);

		// �̹��� ������ �� contentType Ȯ��
		long size = vo.getMfile().getSize();
		// img���ϸ� �ް� ���� ��� ��, ������ �����ϰ���� �� if�� �Ἥ ���!
		String contentType = vo.getMfile().getContentType();
		System.out.println("����ũ��:" + size);
		System.out.println("����ũ�� type: " + contentType);

		// �޸𸮻�(�ӽ������)�� ������ �츮�� ������ ��ο� ����!
		// �̹����� ����� ��� �����
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(img_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath: " + path);

		// �߻���(�̹����� ������ ���) ��ü ����
		File f = new File(path.toString());
		// �ӽø޸𸮿� ��� ���ε��� ������ �� => fileŬ������ ��η� ����
		try {
			vo.getMfile().transferTo(f); // ����
			vo.setDimg(oriFn);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		diaryDaoInter.updateDiary(vo);
		return "redirect:diaryList?dwriter=" + vo.getDwriter();

	}

	// =================================================
	// =====================����==========================
	@RequestMapping(value = "/deleteDiary")
	public String deleteDiary(int num) {
		diaryDaoInter.deleteDiary(num);
		return "diary/deleteImg";
		// delete������ ������ �� �Ѿ�� �� �ٸ� jsp���� ���̿� ���� �Ķ���Ͱ� �ѱ� ����..
	}
}
