package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.DomainService;
import sansil.gxsx.service.MailService;

@Log4j
@RequestMapping("/gxsx/")
@Controller
public class DomainController {
	@Resource(name="DomainService")
	private DomainService service;	
	@Resource(name="EmailService")
	private MailService mailService;	
	
	@RequestMapping("domain.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) { 
		List<LostItem> lostResult = service.listloS();
		List<FindItem> findResult = service.listfiS();
		List<LostPic> lostpicResult = service.listlopicS();
		List<FindPic> findpicResult = service.listfipicS();
		
		ModelAndView mv = new ModelAndView();	
		mv.setViewName("gxsx/domain");
				
		mv.addObject("lostResult", lostResult);
		mv.addObject("findResult", findResult);
		mv.addObject("lostpicResult", lostpicResult);
		mv.addObject("findpicResult", findpicResult);
		System.out.println("�α��λ���Ȯ��: "+session.getAttribute("loginuser"));
		System.out.println("�α��λ���Ȯ��2: "+session.getAttribute("klogin"));
		
		if(session.getAttribute("klogin")!=null) { //kakao�� �α��� ������
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);
			mv.addObject("kakaologout_url", kakaologoutUrl);			
		}
		return mv;
	}
	
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception { 

			JsonNode node = KakaoController.getAccessToken(code); // accessToken�� ������� �α����� ��� ������ ������� 
			JsonNode accessToken = node.get("access_token"); // ������� ���� 
			JsonNode scope = node.get("scope"); // ������� ���� 
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken); 
			String token = node.get("access_token").toString();
			String kemail = null;
			String kname = null;
			String kid = null;
			JsonNode properties = userInfo.path("properties"); 
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			kid = userInfo.findPath("id").asText();
			kemail = kakao_account.path("email").asText(); 
			kname = properties.path("nickname").asText(); 
			session.setAttribute("token", token); 
			session.setAttribute("kemail", kemail); 
			session.setAttribute("kname", kname);
			session.setAttribute("kid", kid);
			session.setAttribute("klogin", "klogin");
			
			System.out.println("kemail: " + kemail + "kname: " + kname + kid + " :ddd: " + " / ");
			
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);	//�α׾ƿ������ϰ� �ּ� �̸� �޾���
			
		    ModelAndView mv = new ModelAndView(); // ������� node�� ����� 
			mv.setViewName("gxsx/domain");		
			mv.addObject("kakaologout_url", kakaologoutUrl);
			
			Users usercheck = service.kakaologinS(session.getAttribute("kid").toString()); //DB�� īī�����̵� ��ϵ� ȸ������ Ȯ��
			if(usercheck==null) { //kakao�� ȸ�������� ��ϵǾ����������� -> ����ϰ��ؾ���
				System.out.println("%%%%%%%%%%%%%%%%%%%% �� �� �� �� �� �� ȸ �� %%%%%%%%%%%%%%%%%%%%");
//				session.setAttribute("usercheck", usercheck);
				if(session.getAttribute("kemail").toString().length()!=0) { //�̸��ϵ� �����ؼ� �����ϴ� ���
					System.out.println("11111");
					mv.addObject("usercheck", "email");
//					session.setAttribute("usercheck", "kuser_with_email");
//					Users kakaouser = new Users(session.getAttribute("kid").toString(), "temp", 
//							session.getAttribute("kname").toString(), session.getAttribute("kemail").toString(), "temp", null);
				}else {
					System.out.println("22222");
//					mv.addObject("usercheck", "noemail");
					session.setAttribute("usercheck", "no_email");
					Users kakaouser = new Users(session.getAttribute("kid").toString(), "temp", 
							session.getAttribute("kname").toString(), "temp", "temp", null);
					session.setAttribute("kakaouser", kakaouser);
//					mv.addObject("kakaouser", kakaouser);
					System.out.println("�ֿֿֿֿֿֿ��ֿֿ�: " + kakaouser);
				}
			}else { //kakao�� �α����߰� & ȸ�������� ��� �Ǿ����� -> �� �������� �α��� �ѹ���(session�� �Ѱ���)
				System.out.println("%%%%%%%%%%%%%%%%%%%% �� �� �� ȸ �� %%%%%%%%%%%%%%%%%%%%");
//				mv.addObject("userid", usercheck.getUserid());
//				mv.addObject("upwd", usercheck.getUpwd());
				
				HashMap<String, String> loginmap = new HashMap<String, String>(); 
				loginmap.put("userid", usercheck.getUserid().toString());
				loginmap.put("upwd", usercheck.getUpwd().toString());
				Users users = service.loginS(loginmap);
				
				if(users == null || users.getUoutdate()!=null) {
					System.out.println("īī�� �α��� ���� :Ż��¥!!!! : null");
					session.setAttribute("loginuser", null);
				}
				else { //users ��������� �ʰ� Ż��¥���� -> login
					System.out.println("īī�� �α��� ����!!!! : login");
					session.setAttribute("userid", null);
					session.setAttribute("upwd", null);
					session.setAttribute("loginuser", users);
					System.out.println("īī�� ���� �α���" + users);
				}
			}
			return "redirect:domain.do"; //�α��� �Ϸ�Ǿ����� domain.do ���ư� (!@#���Ŀ� ������������ �����ؾ���)
	}
	
	
	@RequestMapping("login.do")
	public ModelAndView login(HttpSession session) { 
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("gxsx/login");		
		mv.addObject("kakao_url", kakaoUrl);
		return mv;
	}

	@PostMapping("logincheck.do")
	public String logincheck(HttpServletRequest request, HttpSession session) { 
		String userid = request.getParameter("userid");
		String upwd = request.getParameter("upwd");

		HashMap<String, String> loginmap = new HashMap<String, String>(); 
		loginmap.put("userid", userid);
		loginmap.put("upwd", upwd);
		Users users = service.loginS(loginmap);

		if(users == null || users.getUoutdate()!=null) {
			System.out.println("�α��� ���� :Ż��¥!!!! : null");
			session.invalidate();
//			session.setAttribute("loginuser", null);
		}
		else { //users ��������� �ʰ� Ż��¥���� -> login
			System.out.println("�α��� ����!!!! : login");
			session.setAttribute("loginuser", users);
			System.out.println("���� �α���" + users);
		}

		return "redirect:domain.do";
	}
	
	@RequestMapping("logout.do")
	public String Logout(HttpSession session) {		
		
			System.out.println("�Ϲ����� �α׾ƿ�");
			session.setAttribute("loginuser", null); //�Ϲ� �α��ν� �α׾ƿ� �ϰ� user�����
//			session.invalidate();
			System.out.println("access_token:!!!!!!!!!!!!!!!!!!!!!!!!!!!!:"+(String)session.getAttribute("access_Token"));
        return "redirect:domain.do";
    }
	
	@RequestMapping(value = "kakaologout.do", produces = "application/json")
	public String kakaologout(HttpSession session) {		
		
			System.out.println("īī������ �α׾ƿ�");
	        
	        KakaoController.Logout((String)session.getAttribute("access_Token"));
	        session.invalidate();

        return "redirect:domain.do";
    }
	
	@GetMapping("signupform.do")
	public ModelAndView signupform() {
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("gxsx/signup");
		mv.addObject("random", ran);
		System.out.println("#######random1 : " + ran);
		return mv;
	}
	
	@PostMapping("signup.do")
	public String signup(Users users, HttpSession session) {
		service.signupS(users);
		return "redirect:domain.do";
	}
	
//	@RequestMapping("idconfirm.do")
//	public boolean idconfirm(String userid) {
//		boolean x = service.idconfirmS(userid);
//		return x;
//	}
	
	@RequestMapping("emailCheck.do")
	@ResponseBody
	public boolean emailCheck(@RequestParam String uemail, @RequestParam int random, HttpServletRequest req){
		//�̸��� ����
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		System.out.println("#######authCode / random2 : " + authCode + " / " + random);
		String subject = "ȸ������ ���� �ڵ� �߱� �ȳ� �Դϴ�.";
		StringBuilder sb = new StringBuilder();
		sb.append("������ ���� �ڵ�� " + authCode + "�Դϴ�.");

		return mailService.send(subject, sb.toString(), "javaoneteam@gmail.com", uemail, null);
	}
	
	@RequestMapping("contact.do")
	public String contact() {
		return "gxsx/contact";
	}
	
	@RequestMapping("myboard.do")
	public String myboard() {
		return "temp/myboard";
	}
	
	@RequestMapping("modifyform.do")
	public String modifyform() {
		return "temp/modifyform";
	}
	
	@RequestMapping("modify.do")
	public String modify() {
		return "temp/modify";
	}
	
	////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("tempsignupform.do") //ī������ �α����ߴµ� DB�� ���� �ȵǾ������� ȣ���Ҳ���
	public ModelAndView tempsignupform(HttpSession session) {
		Users kakaouser = (Users)session.getAttribute("kakaouser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/tempsign");		
		mv.addObject("kakaouser", kakaouser);
		System.out.println("77777 : " + kakaouser);
		return mv;
	}	

	@PostMapping("tempsignup.do") //DB�� ī������ ����Ҷ� ȣ���
	public String tempsignup(HttpServletRequest request, HttpSession session, Users kakaouser) {
		System.out.println("88888 : " + kakaouser);
		service.kakaouser(kakaouser);
		Users users = service.kakaologinS(kakaouser.getUserid());
		session.setAttribute("loginuser", users);
		System.out.println("�α����Ϥ������Ӥ�����: " + users);
		
		return "redirect:domain.do";
	}
}