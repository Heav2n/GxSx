package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.service.LostItemService;

@RequestMapping("/lostitem/")
@Controller
@Log4j
public class LostItemController {
	@Resource(name="LostItem")
	private LostItemService service;
	
//	@RequestMapping("list.do")
//	public ModelAndView list(HttpServletRequest request, HttpSession session) {
//		String cpStr = request.getParameter("cp");
//		String psStr = request.getParameter("ps");
//		
//		int cp = 1;
//		if(cpStr == null) {
//			Object cpObj = session.getAttribute("cp");
//			if(cpObj != null) {
//				cp = (Integer)cpObj;
//			}
//		}else {
//			cpStr = cpStr.trim();
//			cp = Integer.parseInt(cpStr);
//		}
//		session.setAttribute("cp", cp);
//		
//		int ps = 3;
//		if(psStr == null) {
//			Object psObj = session.getAttribute("ps");
//			if(psObj != null) {
//				ps = (Integer)psObj;
//			}
//		}else {
//			psStr = psStr.trim();
//			int psParam = Integer.parseInt(psStr);
//			
//			Object psObj = session.getAttribute("ps");
//			if(psObj != null) {
//				int psSession = (Integer)psObj;
//				if(psSession != psParam) {
//					cp = 1;
//					session.setAttribute("cp", cp);
//				}
//			}else {
//				if(ps != psParam) {
//					cp = 1;
//					session.setAttribute("cp", cp);
//				}
//			}
//			
//			ps = psParam;
//		}
//		session.setAttribute("ps", ps);
//		
//		LostItemResult lostResult = service.getLostItemResult(cp, ps);
//		ModelAndView mv = new ModelAndView("lostitem/list", "lostResult", lostResult);
//		if(lostResult.getList().size() == 0) {
//			if(cp > 1) {
//				return new ModelAndView("redirect:list.do?cp="+(cp-1));
//			}else {
//				return new ModelAndView("redirect:list.do", "lostResult", null);
//			}
//		}else {
//			return mv;
//		}
//	}
	
//////////////////////////////////////////////////////////////////////////////////////////	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		Pagination listpage = service.getPagination(request, session);
		List<LostItemPicVo> list = service.getlist(listpage);
		log.info("#> list size : "+list.size());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("temp/lolist");
		mv.addObject("lostResult", list);
		mv.addObject("listpage", listpage);

		return mv;
	}
	
	@RequestMapping(value="paging",method = RequestMethod.GET,produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	private ResponseListVo paging(int selectedPage, HttpSession session,
			HttpServletRequest request) {
		Pagination page = service.getAjaxPagination(selectedPage, request, session);
		List<LostItemPicVo> list = service.getlist(page);
		return new ResponseListVo(list, page);
	}
	
	@RequestMapping("/locontent.do")
	public ModelAndView content(int lono) {
		LostItemPicVo lostitem = service.ContentS(lono);
		String area = service.areaS(lono);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("lostitem/locontent");
		mv.addObject("locontent", lostitem);
		mv.addObject("area", area);
		return mv;
	}
	
}
