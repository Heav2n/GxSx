package sansil.gxsx.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FindCommentService;

@RequestMapping("FindComment")
@Controller
@Log4j
@AllArgsConstructor
public class FindCommentController {
	
	@Resource(name="FindCommentService")
	private FindCommentService service;
	
	@PostMapping("insert")//´ñ±ÛÀÛ¼º
	@ResponseBody

	private ModelAndView fCommentserviceInsert(HttpSession session, @RequestParam int fino, @RequestParam String content) {
		log.info("#> fCommentserviceInsert() Á¢±Ù"); 
		
		Users user = (Users)session.getAttribute("loginuser");
		FiComments ficomments = new FiComments();
		ficomments.setFino(fino);
		ficomments.setContents(content);
		ficomments.setUserid(user.getUserid());
		//og.info("###################### fino : " + FiComments.getComno() +" , contents : " + fiComments.getContents());
		boolean commentList = service.FindCommentInsert(ficomments);
		ModelAndView response = new ModelAndView("../added/findItPic/comment_table");
		response.addObject("ficomment", commentList);
		return response;
	}
	private boolean fCommentserviceInsert(HttpSession session, @RequestBody FiComments ficomments) {
		Users user = (Users)session.getAttribute("loginuser");
		ficomments.setUserid(user.getUserid());
		log.info("#> comment : "+ficomments);
		return service.FindCommentInsert(ficomments);

	}
	
	@PostMapping("update")//´ñ±Û¼öÁ¤
	@ResponseBody
	private boolean fCommentserviceUpdate(FiComments fiComments) {
		
		return service.FindCommentUpdate(fiComments);
	}
	
	@RequestMapping("fidelete")//Find´ñ±Û»èÁ¦
	@ResponseBody
	private boolean FindCommentDelete(HttpSession session, @RequestBody HashMap<String, Object> request) {
		log.info("#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		return service.FindCommentDelete(request);
	}
}