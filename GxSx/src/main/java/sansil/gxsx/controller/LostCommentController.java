package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.LostCommentService;

@RequestMapping("LostComment")
@Controller
@Log4j
@AllArgsConstructor
public class LostCommentController {
	
	@Resource(name="LostCommentService")
	private LostCommentService service;
	
	@PostMapping("insert")//댓글작성
	@ResponseBody
	private ModelAndView fCommentserviceInsert(HttpSession session, @RequestParam int lono, @RequestParam String content) {
		log.info("#> lCommentserviceInsert() 접근"); 
		
		Users user = (Users)session.getAttribute("loginUser");
		LoComments locomments = new LoComments();
		locomments.setLono(lono);
		locomments.setContents(content);
		locomments.setUserid(user.getUserid());
		//og.info("###################### fino : " + FiComments.getComno() +" , contents : " + fiComments.getContents());
		boolean commentList = service.LostCommentInsert(locomments);
		ModelAndView response = new ModelAndView("../added/lostitem2/comment_table");
		response.addObject("locomment", commentList);
		return response;
	}
	
	@PostMapping("update")//댓글수정
	private String fCommentserviceUpdate(LoComments locomments) {
		
		 service.LostCommentUpdate(locomments);
		
		 return "redirect:../lostitem2/content.do?lono="+locomments.getLono();
	
	}
	@RequestMapping("delete")//댓글삭제
	@ResponseBody
	private boolean fCommentserviceDelete(LoComments locomments) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 안들어와??" +locomments);
		
		int lonoInt = (int)locomments.getLono();
		List<LoComments> f = service.LostCommentList(lonoInt);
		
		service.LostCommentDelete(locomments);
		
		locomments.getComno();
		locomments.getContents();

		return true;
	}
}
