package sansil.gxsx.controller;

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
	
	@PostMapping("insert")//댓글작성
	@ResponseBody
	private boolean fCommentserviceInsert(HttpSession session, @RequestBody FiComments ficomments) {
		Users user = (Users)session.getAttribute("loginuser");
		ficomments.setUserid(user.getUserid());
		log.info("#> comment : "+ficomments);
		return service.FindCommentInsert(ficomments);
	}
	
	@PostMapping("update")//댓글수정
	@ResponseBody
	private boolean fCommentserviceUpdate(FiComments fiComments) {
		
		return service.FindCommentUpdate(fiComments);
	}
	
	@RequestMapping("delete")//댓글삭제
	@ResponseBody
	private boolean fCommentserviceDelete(FiComments fiComments) {
		log.info("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 안들어와??" +fiComments);
		return service.FindCommentDelete(fiComments);				
	}
}