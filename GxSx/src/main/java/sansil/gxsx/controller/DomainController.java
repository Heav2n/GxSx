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
		System.out.println("로그인상태확인: "+session.getAttribute("loginuser"));
		System.out.println("로그인상태확인2: "+session.getAttribute("klogin"));
		
		if(session.getAttribute("loginuser")!=null) { //메세지확인용
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		
		if(session.getAttribute("klogin")!=null) { //kakao로 로그인 했을때
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);
			mv.addObject("kakaologout_url", kakaologoutUrl);			
		}
		return mv;
	}
	
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception { 

			JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
			JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
			JsonNode scope = node.get("scope"); // 사용자의 정보 
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
			
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);	//로그아웃가능하게 주소 미리 받아줌
			
		    ModelAndView mv = new ModelAndView(); // 결과값을 node에 담아줌 
			mv.setViewName("gxsx/domain");		
			mv.addObject("kakaologout_url", kakaologoutUrl);
			
			Users usercheck = service.kakaologinS(session.getAttribute("kid").toString()); //DB에 카카오아이디가 등록된 회원인지 확인
			if(usercheck==null) { //kakao로 회원계정이 등록되어있지않으면 -> 등록하게해야함
				System.out.println("%%%%%%%%%%%%%%%%%%%% 등 록 되 지 않 은 회 원 %%%%%%%%%%%%%%%%%%%%");
				if(session.getAttribute("kemail").toString().length()!=0) { //이메일도 선택해서 제공하는 사람
					mv.addObject("usercheck", "email");
				}else {
					session.setAttribute("usercheck", "no_email");
					Users kakaouser = new Users(session.getAttribute("kid").toString(), "temp", 
							session.getAttribute("kname").toString(), "temp", "temp", null);
					session.setAttribute("kakaouser", kakaouser);
					System.out.println("왜왜왜왜왜왜오왜왜왱: " + kakaouser);
				}
			}else { //kakao로 로그인했고 & 회원계정이 등록 되어있음 -> 그 계정으로 로그인 한번더(session에 넘겨줌)
				System.out.println("%%%%%%%%%%%%%%%%%%%% 등 록 된 회 원 %%%%%%%%%%%%%%%%%%%%");
				HashMap<String, String> loginmap = new HashMap<String, String>(); 
				loginmap.put("userid", usercheck.getUserid().toString());
				loginmap.put("upwd", usercheck.getUpwd().toString());
				Users users = service.loginS(loginmap);
				
				if(users == null || users.getUoutdate()!=null) {
					System.out.println("카카오 로그인 실패 :탈퇴날짜!!!! : null");
					session.setAttribute("loginuser", null);
				}
				else { //users 비어져있지 않고 탈퇴날짜없음 -> login
					System.out.println("카카오 로그인 성공!!!! : login");
					session.setAttribute("userid", null);
					session.setAttribute("upwd", null);
					session.setAttribute("loginuser", users);
					System.out.println("카카오 비우고 로그인" + users);
				}
			}
			return "redirect:domain.do"; //로그인 완료되었으니 domain.do 돌아감 (!@#추후에 이전페이지로 수정해야함)
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
		
		String userpower = service.userPowerS(userid); //권한 뿌리기(회원 or 관리자)

		if(users == null || users.getUoutdate()!=null) {
			System.out.println("로그인 실패 :탈퇴날짜!!!! : null");
			session.invalidate();
		}
		else { //users 비어져있지 않고 탈퇴날짜없음 -> login
			System.out.println("로그인 성공!!!! : login");
			session.setAttribute("loginuser", users);
			session.setAttribute("userpower", userpower);
			System.out.println("비우고 로그인" + users);
		}

		return "redirect:domain.do";
	}
	
	@RequestMapping("logout.do")
	public String Logout(HttpSession session) {	
			System.out.println("일반유저 로그아웃");
			session.setAttribute("loginuser", null); //일반 로그인시 로그아웃 하고 user비워줌
//			session.invalidate();
			System.out.println("access_token:!!!!!!!!!!!!!!!!!!!!!!!!!!!!:"+(String)session.getAttribute("access_Token"));
        return "redirect:domain.do";
    }
	
	@RequestMapping(value = "kakaologout.do", produces = "application/json")
	public String kakaologout(HttpSession session) {		
		
			System.out.println("카카오유저 로그아웃");
	        
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
		//이메일 인증
		int ran = new Random().nextInt(900000) + 100000;
		HttpSession session = req.getSession(true);
		String authCode = String.valueOf(ran);
		session.setAttribute("authCode", authCode);
		session.setAttribute("random", random);
		System.out.println("#######authCode / random2 : " + authCode + " / " + random);
		String subject = "회원가입 인증 코드 발급 안내 입니다.";
		StringBuilder sb = new StringBuilder();
		sb.append("귀하의 인증 코드는 " + authCode + "입니다.");

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
	@RequestMapping("tempsignupform.do") //카톡으로 로그인했는데 DB에 저장 안되어있을때 호출할꺼임
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

	@PostMapping("tempsignup.do") //DB에 카톡유저 등록할때 호출됨
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