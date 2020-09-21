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
@RequestMapping("/mypage/")
@Controller
public class MypageController {
//	@Resource(name="MypageService")
//	private TempService service;
	
//	@RequestMapping("")
//	public ModelAndView mypage2(HttpServletRequest request, HttpSession session) { 
//		List<LostItem> lostResult = service.listloS();
//		List<FindItem> findResult = service.listfiS();
//		List<LostPic> lostpicResult = service.listlopicS();
//		
//		ModelAndView mv = new ModelAndView();
//		//new ModelAndView("temp/domain", "lostResult", lostResult);		
//		mv.setViewName("temp/backup1");
//				
//		mv.addObject("lostResult", lostResult);
//		mv.addObject("findResult", findResult);
//		mv.addObject("lostpicResult", lostpicResult);
//		System.out.println("로그인상태확인: "+session.getAttribute("loginuser"));
//		System.out.println("로그인상태확인2: "+session.getAttribute("klogin"));
//		
//		if(session.getAttribute("klogin")!=null) { //kakao로 로그인 했을때
//			String kakaologoutUrl = KakaoController.getAuthorizationUrl2(session);
//			mv.addObject("kakaologout_url", kakaologoutUrl);			
//		}
//		return mv;
//	}
	
	
	@RequestMapping("account.do")
	public String mypage() {
		return "gxsx/mypage";
	}
}