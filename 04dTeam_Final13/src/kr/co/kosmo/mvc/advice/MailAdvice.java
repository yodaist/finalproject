package kr.co.kosmo.mvc.advice;

import javax.mail.internet.MimeMessage;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

import kr.co.kosmo.mvc.dao.SendMailDaoInter;
import kr.co.kosmo.mvc.vo.SendMailVO;

@Component
@Aspect
public class MailAdvice {
	@Autowired
	private JavaMailSenderImpl mailSender;
	@Autowired
	private SendMailDaoInter sendmaildao;

	@AfterReturning("execution(* kr.co.kosmo.mvc.controller.book.Book*.bookProcess(..))")
	public void reserveSendMail() {
		//====�������� ����=====
		mailSender.send(new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				SendMailVO vo = (SendMailVO) sendmaildao.reservemail();
				System.out.println("======AOPTest�ϴ°� ����!===========");
				System.out.println(vo.getChpay());
				System.out.println(vo.getSdate());
				System.out.println(vo.getEdate());
				System.out.println(vo.getMemail());
				System.out.println("=======AOPTest�ϴ°� ��!===========");
				String text="��¥ : "+vo.getSdate()+"~"+vo.getEdate()+"\n ����ݾ� : "+vo.getChpay()+"��";
				
				mimeMsgHelperObj.setTo(vo.getMemail());
				mimeMsgHelperObj.setFrom("myspring1004@naver.com");
				mimeMsgHelperObj.setText(text);
				mimeMsgHelperObj.setSubject("���༺��");
				
			}
		});
		//====�������� ��=====
		System.out.println("\n ���� ���� ���� \n");
	}
}
