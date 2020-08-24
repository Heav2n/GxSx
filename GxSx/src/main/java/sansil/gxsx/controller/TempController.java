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
		System.out.println("로그인상태확인: "+session.getAttribute("loginuser"));
		System.out.println("로그인상태확인2: "+session.getAttribute("klogin"));
		
		if(session.getAttribute("klogin")!=null) { //kakao로 로그인 했을때
			if(service.kakaologinS(session.getAttribute("kid").toString())==null) { //kakao로 회원계정이 등록되어있지않으면 -> 등록하게해야함
				
			}
			else { //kakao로 로그인했고 & 회원계정이 등록 되어있음 -> 그 계정으로 로그인 한번더(session에 넘겨줌)
				
			}			
		}
		
		return mv;
	}
	
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception { 
		    ModelAndView mv = new ModelAndView(); // 결과값을 node에 담아줌 
			JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
			JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
			JsonNode scope = node.get("scope"); // 사용자의 정보 
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
			
			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);	//로그아웃가능하게 주소 미리 받아줌
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
		else { //users 비어져있지 않고 탈퇴날짜없음 -> login
			System.out.println("dldldldldl!!!! : login");
			session.setAttribute("loginuser", users);
		}

		return "redirect:domain.do";
	}
	
	@RequestMapping("logout.do")
	public String Logout(HttpSession session) {		
		
			System.out.println("일반유저 로그아웃");
//			session.setAttribute("loginuser", null); //일반 로그인시 로그아웃 하고 user비워줌
			session.invalidate();
			
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