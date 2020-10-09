package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.LostCommentService;
import sansil.gxsx.service.FindCommentService;

@Log4j
@RequestMapping("/test")
@Controller
public class TestController {
	@Autowired 
	private LostCommentService service;
	@Autowired 
	private FindCommentService fiservice;
	
	@RequestMapping("lost.do")
	public String myboard() {
		return "gxsx/locontent";
	}
	@RequestMapping("find.do")
	public String findboard() {
		return "gxsx/ficontent";
	}
	
	@RequestMapping("comment.do")
	public ModelAndView comment(int lono) {
		log.info("#> TestController comment() : call"); 
		List<LoComments> list = service.LostCommentList(lono);
		return new ModelAndView("gxsx/lost_comment_list", "comment", list);
	}
	//Find ¸®½ºÆ®
	@RequestMapping("findcomment.do")
	public ModelAndView findcomment(int fino) {
		log.info("#> TestController comment() : call");
		log.info("################ fino : " +fino);
		List<FiComments> list = fiservice.FindCommentList(fino);
		log.info("@@@@@@@@@@@ list : " + list);
		return new ModelAndView("gxsx/find_comment_list", "comment", list);
	}
	
	//Find´ñ±ÛÀÛ¼º
	@PostMapping("findinsert")
	@ResponseBody
	private boolean FindCommentInsert(HttpSession session, @RequestBody FiComments ficomments) {
		Users user = (Users)session.getAttribute("loginuser");
		ficomments.setUserid(user.getUserid());
		log.info("#> comment : "+ficomments);		 
		return fiservice.FindCommentInsert(ficomments);
	}
	
	@PostMapping("insert")//´ñ±ÛÀÛ¼º
	@ResponseBody
	private boolean fCommentserviceInsert(HttpSession session, @RequestBody LoComments locomments) {
		Users user = (Users)session.getAttribute("loginuser");
		locomments.setUserid(user.getUserid());
		log.info("#> comment : "+locomments);
		return service.LostCommentInsert(locomments);
	}
	
	@RequestMapping("fiupdate")//Find´ñ±Û¼öÁ¤
	@ResponseBody
	private boolean FindCommentUpdate(HttpSession session, FiComments fiComments) {
		Users user = (Users)session.getAttribute("loginuser");
		fiComments.setUserid(user.getUserid());
		return fiservice.FindCommentUpdate(fiComments);
	}
	
	@RequestMapping("update")//´ñ±Û¼öÁ¤
	@ResponseBody
	private boolean fCommentserviceUpdate(HttpSession session, LoComments locomments) {
		Users user = (Users)session.getAttribute("loginuser");
		locomments.setUserid(user.getUserid());
		return service.LostCommentUpdate(locomments);
	}
	
	@RequestMapping("fidelete")//Find´ñ±Û»èÁ¦
	@ResponseBody
	private boolean FindCommentDelete(HttpSession session, @RequestBody HashMap<String, Object> request) {
		log.info("#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return fiservice.FindCommentDelete(request);
	}
	
	@RequestMapping("delete")//´ñ±Û»èÁ¦
	@ResponseBody
	private boolean fCommentserviceDelete(HttpSession session, @RequestBody HashMap<String, Object> request) {
		log.info("#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return service.LostCommentDelete(request);
	}
}

