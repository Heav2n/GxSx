package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FindCommentService;

@RequestMapping("FindComment")
@Controller
@Log4j
@AllArgsConstructor
public class FindCommentController {
	
	@Resource(name="FindCommentService")
	private FindCommentService service;
	
	@PostMapping("insert")//댓글작성
	@ResponseBody
	private ModelAndView fCommentserviceInsert(HttpSession session, @RequestParam int fino, @RequestParam String content) {
		log.info("#> fCommentserviceInsert() 접근"); 
		
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
	
	@PostMapping("update")//댓글수정
	private String fCommentserviceUpdate(FiComments fiComments) {
		
//		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 안들어와??" +fiComments);
		 service.FindCommentUpdate(fiComments);
		
		 return "redirect:../findItPic/content.do?fino="+fiComments.getFino();
	
	}
	@RequestMapping("delete")//댓글삭제
	@ResponseBody
	private boolean fCommentserviceDelete(FiComments fiComments) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 안들어와??" +fiComments);
		
		int finoInt = (int)fiComments.getFino();
		List<FiComments> f = service.FindCommentList(finoInt);
		
		service.FindCommentDelete(fiComments);
		
		fiComments.getComno();
		fiComments.getContents();

		return true;
	}
}