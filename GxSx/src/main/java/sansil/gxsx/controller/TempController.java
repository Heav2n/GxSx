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
	public ModelAndView list(HttpServletRequest request, HttpSession session) { 
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
			mv.setViewName("temp/domain");		
			mv.addObject("kakaologout_url", kakaologoutUrl);
			
			Users usercheck = service.kakaologinS(session.getAttribute("kid").toString()); //DB에 카카오아이디가 등록된 회원인지 확인
			if(usercheck==null) { //kakao로 회원계정이 등록되어있지않으면 -> 등록하게해야함
				System.out.println("%%%%%%%%%%%%%%%%%%%% 등 록 되 지 않 은 회 원 %%%%%%%%%%%%%%%%%%%%");
//				session.setAttribute("usercheck", usercheck);
				if(session.getAttribute("kemail").toString().length()!=0) { //이메일도 선택해서 제공하는 사람
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
					System.out.println("왜왜왜왜왜왜오왜왜왱: " + kakaouser);
				}
			}else { //kakao로 로그인했고 & 회원계정이 등록 되어있음 -> 그 계정으로 로그인 한번더(session에 넘겨줌)
				System.out.println("%%%%%%%%%%%%%%%%%%%% 등 록 된 회 원 %%%%%%%%%%%%%%%%%%%%");
//				mv.addObject("userid", usercheck.getUserid());
//				mv.addObject("upwd", usercheck.getUpwd());
				
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
			System.out.println("로그인 실패 :탈퇴날짜!!!! : null");
			session.invalidate();
//			session.setAttribute("loginuser", null);
		}
		else { //users 비어져있지 않고 탈퇴날짜없음 -> login
			System.out.println("로그인 성공!!!! : login");
			session.setAttribute("loginuser", users);
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
	
	////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("tempsignupform.do") //카톡으로 로그인했는데 DB에 저장 안되어있을때 호출할꺼임
	public ModelAndView tempsignupform(HttpSession session) {
		Users kakaouser = (Users)session.getAttribute("kakaouser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("temp/tempsign");		
		mv.addObject("kakaouser", kakaouser);
		System.out.println("77777 : " + kakaouser);
		return mv;
	}	

	@PostMapping("tempsignup.do") //DB에 카톡유저 등록할때 호출됨
	public String tempsignup(HttpServletRequest request, HttpSession session, Users kakaouser) {
		System.out.println("88888 : " + kakaouser);
		service.kakaouser(kakaouser);
		Users users = service.kakaologinS(kakaouser.getUserid());
		session.setAttribute("loginuser", users);
		System.out.println("로긔으니ㅏ으ㅏㅣㅁ느아: " + users);
		
		return "redirect:domain.do";
	}
}