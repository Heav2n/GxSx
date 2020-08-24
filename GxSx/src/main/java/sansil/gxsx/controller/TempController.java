package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.TempService;

@Log4j
@RequestMapping("/temp/")
@Controller
public class TempController {
	@Resource(name="TempService")
	private TempService service;
	
//	@Resource(name="FindItemMapper")
//	private FindItemservice fservice;
	
	@RequestMapping("domain.do")
	public ModelAndView list(HttpSession session) { 
		List<LostItem> lostResult = service.listloS();
		List<FindItem> findResult = service.listfiS();
		List<LostPic> lostpicResult = service.listlopicS();
		
		ModelAndView mv = new ModelAndView();
		//new ModelAndView("temp/domain", "lostResult", lostResult);		
		mv.setViewName("temp/domain");
				
		mv.addObject("lostResult", lostResult);
		mv.addObject("findResult", findResult);
		mv.addObject("lostpicResult", lostpicResult);
		System.out.println("�α��λ���Ȯ��: "+session.getAttribute("loginuser"));
		System.out.println("�α��λ���Ȯ��2: "+session.getAttribute("klogin"));
		
		if(session.getAttribute("klogin")!=null) { //kakao�� �α��� ������
			if(service.kakaologinS(session.getAttribute("kid").toString())==null) { //kakao�� ȸ�������� ��ϵǾ����������� -> ����ϰ��ؾ���
				
			}
			else { //kakao�� �α����߰� & ȸ�������� ��� �Ǿ����� -> �� �������� �α��� �ѹ���(session�� �Ѱ���)
				
			}			
		}
		
		return mv;
	}
	
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception { 
		    ModelAndView mv = new ModelAndView(); // ������� node�� ����� 
			JsonNode node = KakaoController.getAccessToken(code); // accessToken�� ������� �α����� ��� ������ ������� 
			JsonNode accessToken = node.get("access_token"); // ������� ���� 
			JsonNode scope = node.get("scope"); // ������� ���� 
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken); 
			String token = node.get("access_token").toString();
			String temp2 = scope.get("account_email").toString();
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
			
			System.out.println("kemail: " + kakao_account.path("email") + kemail + "kname: " + kname + kid + " :ddd: " + " / " + temp2);
			
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);	//�α׾ƿ������ϰ� �ּ� �̸� �޾���
			mv.setViewName("temp/domain");		
			mv.addObject("kakaologout_url", kakaologoutUrl);
			
			return mv;
	}
	
	
	@RequestMapping("login.do")
	public ModelAndView login(HttpSession session) { 
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("temp/login");		
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
			System.out.println("dldldldldl!!!! : null");
			session.setAttribute("loginuser", null);
		}
		else { //users ��������� �ʰ� Ż��¥���� -> login
			System.out.println("dldldldldl!!!! : login");
			session.setAttribute("loginuser", users);
		}

		return "redirect:domain.do";
	}
	
	@RequestMapping("logout.do")
	public String Logout(HttpSession session) {		
		
			System.out.println("�Ϲ����� �α׾ƿ�");
//			session.setAttribute("loginuser", null); //�Ϲ� �α��ν� �α׾ƿ� �ϰ� user�����
			session.invalidate();
			
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
	public String signupform() {
		return "temp/signup";
	}
	
	@PostMapping("signup.do")
	public String signup(Users users, HttpSession session) {
		service.signupS(users);
		return "redirect:domain.do";
	}
	
	@RequestMapping("lostitem.do")
	public String lostitem() {
		return "temp/lostitem";
	}
	
	@RequestMapping("finditem.do")
	public String finditem() {
		return "temp/finditem";
	}
	
	@RequestMapping("contact.do")
	public String contact() {
		return "temp/contact";
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

}