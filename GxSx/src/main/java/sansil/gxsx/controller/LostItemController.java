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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.service.LostItemservice;

@RequestMapping("/lostitem/")
@Controller
public class LostItemController {
	@Resource(name="LostItemMapper")
	private LostItemservice service;
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		int ps = 3;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		LostItemResult lostResult = service.getLostItemResult(cp, ps);
		ModelAndView mv = new ModelAndView("lostitem/list", "lostResult", lostResult);
		if(lostResult.getList().size() == 0) {
			if(cp > 1) {
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			}else {
				return new ModelAndView("redirect:list.do", "lostResult", null);
			}
		}else {
			return mv;
		}
	}
	
	//ajax
	@ResponseBody
	@PostMapping(value="search02", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<LostItem> search02(String losub) {
		List<LostItem> list = service.selectByNameS(losub);
		return list;
	}
	
	@GetMapping("ficontentsearch.do")
	public ModelAndView ficontent(String query, HttpServletRequest request, HttpSession session) { 
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		int cp = 1;
		if(cpStr == null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);
		}
		session.setAttribute("cp", cp);
		
		int ps = 3;
		if(psStr == null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}
			
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		LostItemResult lostResult;
		
		//List<LostItem> list = service.selectByNameS(query);
		if(query.length()!=0) {
			lostResult = service.getLostItemResultByKeyword(query, cp, ps);
		}
		else {
			lostResult = service.getLostItemResult(cp, ps);
		}
		
		ModelAndView mv = new ModelAndView();		
		mv.setViewName("temp/ficontentsearch");		
		mv.addObject("lostResult", lostResult);
		
		if(lostResult.getList().size() == 0) {
			if(cp > 1) {
				return new ModelAndView("redirect:ficontentsearch.do?cp="+(cp-1));
			}else {
				return new ModelAndView("redirect:ficontentsearch.do", "lostResult", null);
			}
		}else {
			return mv;
		}
	}
	
	/*
	@PostMapping("/write.do")
	public String write(LostItem lostitem) {
		service.insertS(lostitem);
		
		return "redirect:list.do";
	}*/
	
	
}
