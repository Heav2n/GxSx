package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
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
	public ModelAndView list() { 
		List<LostItem> lostResult = service.listloS();
		List<FindItem> findResult = service.listfiS();
		List<LostPic> lostpicResult = service.listlopicS();
		
		ModelAndView mv = new ModelAndView();
		//new ModelAndView("temp/domain", "lostResult", lostResult);		
		mv.setViewName("temp/domain");
				
		mv.addObject("lostResult", lostResult);
		mv.addObject("findResult", findResult);
		mv.addObject("lostpicResult", lostpicResult);
		return mv;
	}
	
	@RequestMapping(value = "kakaologin.do", produces = "application/json") 
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
			throws Exception { 
		    ModelAndView mav = new ModelAndView(); // 결과값을 node에 담아줌 
			JsonNode node = KakaoController.getAccessToken(code); // accessToken에 사용자의 로그인한 모든 정보가 들어있음 
			JsonNode accessToken = node.get("access_token"); // 사용자의 정보 
			JsonNode userInfo = KakaoController.getKakaoUserInfo(accessToken); 
			String token = node.get("access_token").toString();
			String kemail = null; 
			String kname = null; 
			String kgender = null; 
			String kbirthday = null; 
			String kage = null; 
			String kimage = null; // 유저정보 카카오에서 가져오기 Get properties 
			JsonNode properties = userInfo.path("properties"); 
			JsonNode kakao_account = userInfo.path("kakao_account"); 
			kemail = kakao_account.path("email").asText(); 
			kname = properties.path("nickname").asText(); 
			kimage = properties.path("profile_image").asText(); 
			kgender = kakao_account.path("gender").asText(); 
			kbirthday = kakao_account.path("birthday").asText(); 
			kage = kakao_account.path("age_range").asText(); 
			session.setAttribute("token", token); 
			session.setAttribute("kemail", kemail); 
			session.setAttribute("kname", kname); 
			session.setAttribute("kimage", kimage); 
			session.setAttribute("kgender", kgender); 
			session.setAttribute("kbirthday", kbirthday); 
			session.setAttribute("kage", kage); 
			mav.setViewName("temp/domain"); 
			
			return mav; 
	}
	
	
	@RequestMapping("login.do")
	public ModelAndView login(HttpSession session) { 
		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("temp/login");		
		mv.addObject("kakao_url", kakaoUrl);
		return mv;
	}
	
	@RequestMapping("logincheck.do")
	public ModelAndView logincheck(HttpSession session) { 		
		String userid = session.getAttribute("userid").toString();
		String tempupwd = session.getAttribute("upwd").toString();
		
		Users users = service.loginS(userid);
		String realupwd = users.getUpwd();
		
		ModelAndView mv = new ModelAndView();
		
		if(tempupwd.equals(realupwd)) {					
			mv.setViewName("temp/login");		
			mv.addObject("loginuser", users);
			return mv;
		}
		else {			
			mv.setViewName("temp/loginerror");
			return mv;
		}
		
	}
	
	@RequestMapping(value = "logout.do", produces = "application/json")
	public String Logout(HttpSession session) {
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = KakaoController.Logout(session.getAttribute("token").toString());
        //결과 값 출력
        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        return "redirect:domain.do";
    }
	
	@RequestMapping("signupform.do")
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

}