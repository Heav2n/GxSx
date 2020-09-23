package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.LostListVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FindItemService;
import sansil.gxsx.service.FindPicService;
import sansil.gxsx.service.LostItemService;
import sansil.gxsx.service.LostPicService;
import sansil.gxsx.service.UsersService;

@RequestMapping("/Users/*")
@Controller
@Log4j
@AllArgsConstructor
public class UsersController {
	@Resource(name="Users")
	private UsersService service;
	@Resource(name="FindItem")
	private FindItemService fservice;
	@Resource(name="LostItem")
	private LostItemService lservice;
	@Resource(name="FindPic")
	private FindPicService fpserivce;
	@Resource(name="LostPic")
	private LostPicService lpService;
	
//	@RequestMapping("list.do")
//	public ModelAndView list(HttpServletRequest request, HttpSession session) { // 구현
//		Users user = (Users)session.getAttribute("loginUser");
//		
//		List<LostListVo> lostList = service.getLostList(user.getUserid(), request, session);
//		Pagination lostPage = service.getLostPagination(user.getUserid(), request, session);
//		
//		List<FindListVo> findlist = service.getFindList(user.getUserid(), request, session);
//		Pagination findPage = service.getFindPagination(user.getUserid(), request, session);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("list");
//		mv.addObject("lost", lostList);
//		mv.addObject("lostPage", lostPage);
//		
//		mv.addObject("find", findlist);
//		mv.addObject("findPage", findPage);
//		
//		return mv;
//	}

	@RequestMapping("mypage.do")
	public ModelAndView mypage(HttpServletRequest request, HttpSession session) { // 구현
		Users user = (Users)session.getAttribute("loginuser");
		System.out.println("1:"+user);
		System.out.println("2:"+user.getUserid());
		List<LostListVo> lostList = service.getLostList(user.getUserid(), request, session);
		
		Pagination lostPage = service.getLostPagination(user.getUserid(), request, session);
		
		List<FindListVo> findlist = service.getFindList(user.getUserid(), request, session);
		Pagination findPage = service.getFindPagination(user.getUserid(), request, session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/mypage");
		mv.addObject("lost", lostList);
		mv.addObject("lostPage", lostPage);
		
		mv.addObject("find", findlist);
		mv.addObject("findPage", findPage);
		
		return mv;
	}
	
	//ajax
	@ResponseBody
	@PostMapping(value="fiboard", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<FindListVo> search01(String fisub, HttpSession session) {
		Users user = (Users)session.getAttribute("loginuser");
		HashMap<String, String> searchmap = new HashMap<String, String>(); 
		searchmap.put("userid", user.getUserid());
		searchmap.put("fisub", fisub);
		List<FindListVo> list = service.fselectByNameS(searchmap);
		return list;
	}
	
	//ajax
	@ResponseBody
	@PostMapping(value="loboard", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<LostListVo> search02(String losub, HttpSession session) {
		Users user = (Users)session.getAttribute("loginuser");
		HashMap<String, String> searchmap = new HashMap<String, String>(); 
		searchmap.put("userid", user.getUserid());
		searchmap.put("losub", losub);
		List<LostListVo> list = service.lselectByNameS(searchmap);
		return list;
	}
	
	@RequestMapping(value="otherPageLo",method = RequestMethod.GET) // value : URL 주소 , method : type
	@ResponseBody // json 으로만 받을꺼에요
	private ResponseListVo otherPageLo(int selectedPage, HttpSession session, HttpServletRequest request) {
		Users user = (Users)session.getAttribute("loginUser");
		Pagination page = service.getAjaxLostPagination(selectedPage, user.getUserid(), request, session);
		log.info("#>page : "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+ page.getEndPage());
		List<LostListVo> list = service.getLostListVo(page, user.getUserid());
		return new ResponseListVo(list, page);
	}
	
	@RequestMapping(value="otherPageFi",method = RequestMethod.GET) // value : URL 주소 , method : type
	@ResponseBody // json 으로만 받을꺼에요
	private ResponseListVo otherPageFi(int selectedPage, HttpSession session, HttpServletRequest request) {
		Users user = (Users)session.getAttribute("loginUser");
		Pagination page = service.getAjaxFindPagination(selectedPage, user.getUserid(), request, session);
		log.info("#>page : "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+ page.getEndPage());
		List<FindListVo> list = service.getFindListVo(page, user.getUserid());
		return new ResponseListVo(list, page);
	}
}
