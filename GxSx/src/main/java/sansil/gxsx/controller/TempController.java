package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonNode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.service.TempService;

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
	
	@RequestMapping("ficontent.do")
	public void ficontent(String query) { 
		System.out.println("1dsadsadsadasdad");
		System.out.println(query);
//		String kakaoUrl = KakaoController.getAuthorizationUrl(session);
//		
//		ModelAndView mv = new ModelAndView();		
//		mv.setViewName("temp/login");		
//		mv.addObject("ddd", ddd);
//		return mv;
	}

}