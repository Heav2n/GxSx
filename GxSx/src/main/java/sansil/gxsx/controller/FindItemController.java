package sansil.gxsx.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.patch;

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

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FindCommentService;
import sansil.gxsx.service.FindItemService;
import sansil.gxsx.service.MessageService;

@RequestMapping("/finditem/")
@Controller
@Log4j
public class FindItemController {
	@Resource(name="FindItem")
	private FindItemService service; //Spring 4.3~ ( with @AllArgsConstructor )
	@Resource(name="FindCommentService")
	private FindCommentService findCommentService;
	@Resource(name="MessageService")
	private MessageService messageService;
	
	@GetMapping("write2.do")
	public String write(HttpServletRequest request, HttpSession session) {
		
		if(session.getAttribute("loginuser")==null) { //로그인 안되었을 때
			return "redirect:../gxsx/login.do";
		}
		else {
			return "gxsx/fiwrite";
		}
	}
	
	@PostMapping("write2.do")
	public String write(FindItPic findItPic) {
		
		log.info("==========YJ write findpic : " + findItPic);
		service.write(findItPic);
		return "redirect:list.do";
	}
	
	@GetMapping("update.do")
	public ModelAndView update(FiComments ficomments) {
		FindItPic findItPic = service.UpdatefS(ficomments);
		findCommentService.FindCommentUpdate(ficomments);
		ModelAndView mv = new ModelAndView("findItPic/update", "update", findItPic);
		mv.setViewName("findItPic/content");
		mv.addObject("ficomments", ficomments);
		mv.addObject("content", findItPic);
		
		
		return mv;
	}
	@PostMapping("update.do")
	public String update(FindItPic findItPic) {
		service.UpdateS(findItPic);
		return "redirect:list.do";
	}
	@GetMapping("del.do")
	public String delete(long fino) {
		service.remove(fino);
		return "redirect:list.do";
	}
	
	/////////////////////////////////////////////////////////index -> ���湰���� �˻�
	
	//ajax
	@ResponseBody
	@PostMapping(value="search02", 
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE, MediaType.APPLICATION_XML_VALUE})
	public List<FindItPic> search02(String fisub) {
		List<FindItPic> list = service.selectByNameS(fisub);
		return list;
	}	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		
		Pagination listpage = service.getPagination(request, session);
		List<FindItPic> list = service.getlist(listpage);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/filist");
		mv.addObject("findResult", list);
		mv.addObject("listpage", listpage);
		
		if(session.getAttribute("loginuser")!=null) { //�޼���Ȯ�ο�
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}

		return mv;
	}
	
	
	@RequestMapping("slist.do")
	public ModelAndView slist(String query, HttpServletRequest request, HttpSession session) {
		System.out.println("nullroQkrclsek:" + query);
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
		
		int ps = 8;
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
		
		FindItPicListResult listResult;
		ModelAndView mv = new ModelAndView();	
		
		listResult = service.listResult(query, cp, ps);
		
//		if(query.length()!=0) {
//			listResult = service.listResult(query, cp, ps);
//		}
//		else {
//			Pagination listpage = service.getPagination(request, session);
//			List<FindItPic> list = service.getlist(listpage);
//			listResult = service.listResult(cp, ps);
//		}
		
		mv.setViewName("gxsx/fislist");
		mv.addObject("findResult", listResult);
		mv.addObject("query", query);
		
		if(session.getAttribute("loginuser")!=null) { //�޼���Ȯ�ο�
			Users user = (Users)session.getAttribute("loginuser");
			List<Question> messageResult = messageService.messageList(user.getUserid());			
			mv.addObject("messageResult", messageResult);
		}
		
		if(listResult.getList().size() == 0) {
			if(cp > 1) {
				return new ModelAndView("redirect:slist.do?cp="+(cp-1)+"&query="+query);
			}else {
				return new ModelAndView("redirect:slist.do?cp=1&query="+query, "findResult", null);
			}
		}else {
			return mv;
		}
	}
	
	@GetMapping("content.do")
	public ModelAndView content(long fino) {
		FindItPic findItPic = service.getFindItPic(fino);
		String area = service.areaS(fino);
		int finoInt = (int)fino;
		List<FiComments> ficomment = service.FindCommentList(finoInt);
		List<FindItPic> related = service.getFindRelated();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/ficontent");
		mv.addObject("content", findItPic);		 
		mv.addObject("ficomment", ficomment);
		mv.addObject("area", area);
		mv.addObject("related", related);
		
		return mv;
	}
	
}