package sansil.gxsx.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Notice;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.DomainService;
import sansil.gxsx.service.MailService;
import sansil.gxsx.service.MessageService;

@Log4j
@RequestMapping("/gxsx/")
@Controller
public class DomainController {
	@Resource(name="DomainService")
	private DomainService service;	
	@Resource(name="EmailService")
	private MailService mailService;
	@Resource(name="MessageService")
	private MessageService messageService;
	
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
		
		if(session.getAttribute("loginuser")!=null) { //�޼���Ȯ�ο�
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		
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
				if(session.getAttribute("kemail").toString().length()!=0) { //�̸��ϵ� �����ؼ� �����ϴ� ���
					mv.addObject("usercheck", "email");
				}else {
					session.setAttribute("usercheck", "no_email");
					Users kakaouser = new Users(session.getAttribute("kid").toString(), "temp", 
							session.getAttribute("kname").toString(), "temp", "temp", null);
					session.setAttribute("kakaouser", kakaouser);
					System.out.println("�ֿֿֿֿֿֿ��ֿֿ�: " + kakaouser);
				}
			}else { //kakao�� �α����߰� & ȸ�������� ��� �Ǿ����� -> �� �������� �α��� �ѹ���(session�� �Ѱ���)
				System.out.println("%%%%%%%%%%%%%%%%%%%% �� �� �� ȸ �� %%%%%%%%%%%%%%%%%%%%");
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
	public static ModelAndView login(HttpSession session) {
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
		
		String userpower = service.userPowerS(userid); //���� �Ѹ���(ȸ�� or ������)

		if(users == null || users.getUoutdate()!=null) {
			System.out.println("�α��� ���� :Ż��¥!!!! : null");
			session.invalidate();
		}
		else { //users ��������� �ʰ� Ż��¥���� -> login
			System.out.println("�α��� ����!!!! : login");
			session.setAttribute("loginuser", users);
			session.setAttribute("userpower", userpower);
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
	
	@PostMapping("idCheck.do")
	@ResponseBody
	public boolean idconfirm(String userid) {
		int id_exist = service.idCheckS(userid);
		if(id_exist==0) {
			return true;
		}
		else {
			return false;
		}		
	}
	
	@RequestMapping(value="emailCheck.do", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
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
	
	//ajax
	@ResponseBody
	@GetMapping(value="emailAuth", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public boolean emailAuth(HttpSession session, String uemailauth){
		String originalJoinCode = (String) session.getAttribute("authCode");
		System.out.println("auth / num :" + originalJoinCode + " / " + uemailauth);
		if(originalJoinCode.equals(uemailauth)) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public boolean name(HttpSession session) {
		return session.getAttribute("loginuser") == null;
	}
	
	@RequestMapping("myboard.do")
	public String myboard() {
		return "temp/myboard";
	}
	
	////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("tempsignupform.do") //ī������ �α����ߴµ� DB�� ���� �ȵǾ������� ȣ���Ҳ���
	public ModelAndView tempsignupform(HttpSession session) {
		Users kakaouser = (Users)session.getAttribute("kakaouser");
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		mv.setViewName("gxsx/signup2");
		mv.addObject("kakaouser", kakaouser);
		mv.addObject("random", ran);
		System.out.println("77777 : " + kakaouser);
		return mv;
	}	

	@PostMapping("tempsignup.do") //DB�� ī������ ����Ҷ� ȣ���
	public String tempsignup(HttpServletRequest request, HttpSession session, Users kakaouser) {
		System.out.println("88888 : " + kakaouser);
		service.kakaouser(kakaouser);
		Users users = service.kakaologinS(kakaouser.getUserid());
		session.setAttribute("loginuser", users);
		
		return "redirect:domain.do";
	}
	
	@GetMapping("notice.do")
	public ModelAndView notice(HttpServletRequest request, HttpSession session) {
		List<Notice> notice = service.noticeListS();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/notice");
		mv.addObject("noticeList", notice);
		if(session.getAttribute("userpower")!=null) {
			String userpower = (String)session.getAttribute("userpower");
			mv.addObject("user", userpower);
		}
		return mv;
	}

	@GetMapping("noticeCon.do")
	public ModelAndView noticeCon(HttpServletRequest request, HttpSession session, String nono) {
		Notice notice = service.noticeConS(Integer.parseInt(nono));
		Notice noticeup = service.noticeUp(Integer.parseInt(nono));
		Notice noticedown = service.noticeDown(Integer.parseInt(nono));
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/noticecontent");
		mv.addObject("noticeList", notice);
		mv.addObject("noticeup", noticeup);
		mv.addObject("noticedown", noticedown);
		if(session.getAttribute("userpower").toString()!=null) {
			String userpower = (String)session.getAttribute("userpower");
			mv.addObject("user", userpower);
		}
		return mv;
	}
	
	@ResponseBody
	@GetMapping("noticeEditForm")
	private ModelAndView noticeEditForm(int nono) {
		log.info("#########nono : "+nono);
		System.out.println(nono);
		Notice result = service.noticeConS(nono);
		return new ModelAndView("gxsx/noticeedit", "notice", result);
	}
	
	@RequestMapping("noticeEdit")
	private String noticeEdit(HttpServletRequest request, HttpSession session, Notice notice) {
		service.noticeEditS(notice);
		return "redirect:notice.do";
	}
	
	@RequestMapping("noticeDel.do")
	private String noticeDel(HttpServletRequest request, HttpSession session, int nono) {
		System.out.println("#########ddsadlksajdlksajdl##########");
		service.noticeDelS(nono);
		return "redirect:notice.do";
	}
	
	@RequestMapping("noticeForm.do")
	public ModelAndView noticeForm(HttpServletRequest request, HttpSession session) {
		Users user = (Users)session.getAttribute("loginuser");
		String userid = user.getUserid();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/noticewrite");
		mv.addObject("userid", userid);
		return mv;
	}
	
	@RequestMapping("noticeWrite.do")
	public String noticeWrite(HttpServletRequest request, HttpSession session, Notice notice) {
		Users user = (Users)session.getAttribute("loginuser");
		service.noticeWriteS(notice);
		return "redirect:notice.do";
	}
}