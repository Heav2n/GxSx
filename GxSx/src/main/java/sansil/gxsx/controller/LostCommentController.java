package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	

	
//	@GetMapping("list")//��۸���Ʈ
//	@ResponseBody
//	public ModelAndView list(int fino, HttpServletRequest request, HttpSession session){
//		log.info("#> list() ����"); 
//		List<FiComments> ficomment = service.FindCommentList(fino);
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("findPic/content");
//		mv.addObject("ficomment", ficomment);
//		
//	return mv;
//	}
	
	@PostMapping("insert")//����ۼ�
	@ResponseBody
	private boolean fCommentserviceInsert(HttpSession session, @RequestBody LoComments locomments) {
		Users user = (Users)session.getAttribute("loginuser");
		locomments.setUserid(user.getUserid());
		log.info("#> comment : "+locomments);
		return service.LostCommentInsert(locomments);
	}
	
	@RequestMapping("update")//��ۼ���
	@ResponseBody
	private boolean fCommentserviceUpdate(LoComments locomments) {
		return service.LostCommentUpdate(locomments);
	}
	
	@PostMapping("delete")//��ۻ���
	@ResponseBody
	private boolean fCommentserviceDelete(LoComments locomments) {
		return service.LostCommentDelete(locomments);
	}
}