package kr.co.kosmo.mvc.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.kosmo.mvc.vo.LoginLoggerDTO;
import kr.co.kosmo.mvc.vo.MemberVO;
import kr.co.kosmo.mvc.vo.MembershipVO;

@Repository
public class MemberDao implements MemberDaoInter {
	@Autowired
	private SqlSessionTemplate ss;

//=======================================================
	// ȸ������
	@Override
	public void addMember(MemberVO vo) {
		ss.insert("member.addmem", vo);
	}

	// �α���
	@Override
	public MemberVO login(MemberVO vo) {
		return ss.selectOne("member.login", vo);
	}

	// idüũ
	@Override
	public int idcheck(String mid) {
		return ss.selectOne("member.idchk", mid);
	}

	// ȸ������
	@Override
	public void upMember(MemberVO vo) {
		ss.update("member.upmem", vo);
	}

	// ȸ��Ż��
	@Override
	public void delMember(int mnum) {
		ss.delete("member.delmem", mnum);
	}

//=======================================================
	// ����������
	@Override
	public MembershipVO memMembership(int mnum) {
		return ss.selectOne("member.membermbs", mnum);
	}

//=======================================================
	// ����Ʈ => ����service���� �۾�
	// �����Ҷ� ���� ����Ʈ �߰� => id / point �ޱ�
	@Override
	public void upMPoint(MemberVO mvo) {
		ss.update("member.mpoint", mvo);
	}

	// ����� ��� �� ����Ʈ ����
	@Override
	public MembershipVO mbsPoint(int mnum) {
		return ss.selectOne("member.pluspoint", mnum);
	}

//=======================================================
	// ����� ���׷��̵� => ����service���� �۾�
	@Override
	public void updateMbs(int mnum) {
		ss.update("member.updatembs", mnum);
	}

	// ����� ���׷��̵� ��Ʈ => ��� RestController���� �۾� => ����������
	@Override
	public MembershipVO chartMbs(int mnum) {
		return ss.selectOne("member.chartmbs", mnum);
	}

//=======================================================
	// Login_Log
	@Override
	public void addLoginLogging(LoginLoggerDTO vo) {
		ss.insert("member.logger_in", vo);
	}

//=======================================================
	// KaKaoLogin
	@Override
	public String getAccessToken(String authorize_code) throws Throwable {
		System.out.println("==========1. getAccessToken==========");
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST ��û�� ���� �⺻���� false�� setDoOutput�� true��

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			// POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=5807f5504b2c080d19f04bd0614e4de4"); // REST_APIŰ ������ �߱޹��� key �־��ֱ�
			sb.append("&redirect_uri=http://localhost/dTeam_semi_tour/login/kakaoLogin"); // REDIRECT_URI ������ ������ �ּ�
																							// �־��ֱ�

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// ��� �ڵ尡 200�̶�� ����
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// ��û�� ���� ���� JSONŸ���� Response �޼��� �о����
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper ��ü ����
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});
			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	//@SuppressWarnings("unchecked")
	@Override
	public HashMap<String, Object> getUserInfo(String access_Token) throws Throwable {
		System.out.println("==========2. getUserInfo==========");
		// ��û�ϴ� Ŭ���̾�Ʈ���� ���� ������ �ٸ� �� �ֱ⿡ HashMapŸ������ ����
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL); //url ��ü�����
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET"); //���ᱸ��

			// ��û�� �ʿ��� Header�� ���Ե� ����
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);
			conn.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8"); // charset=utf-8 �߰�
			
			//Ű��, �Ӽ� ����
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type : " + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper ��ü ����
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				//System.out.println("nickname => "+properties.get("nickname"));
				//System.out.println("email => "+kakao_account.get("email"));

				String nickname = properties.get("nickname").toString();
				String email = kakao_account.get("email").toString();

				userInfo.put("nickname", nickname);
				userInfo.put("email", email);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	//Login => ���ǽɱ�
	@Override
	public MemberVO kakaologin(MemberVO vo) {
		return ss.selectOne("member.kakaologin", vo);
	}

}
