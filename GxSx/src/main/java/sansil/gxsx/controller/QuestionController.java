package sansil.gxsx.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

//import org.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.QuestionService;
import sansil.gxsx.service.QuestionServiceImpl;

@RequestMapping("/Question")
@Controller
@Log4j
@AllArgsConstructor
public class QuestionController {
	
	@Resource(name="QuestionMapper")
	private QuestionService service;
	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		log.info("아아아아아아아아아아");
		Users user = (Users)session.getAttribute("loginUser");
		List<Question> questionlist = service.selectQuestion(user.getUserid());
		Pagination questionPage = service.getQuestionPagination(user.getUserid(), request, session);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("question");
		mv.addObject("question", questionlist);
		mv.addObject("questionPage", questionPage);
		
		for(Question q : questionlist) {
			log.info("#>qno : "+q.getQno());
		}
		
		log.info("#>questionPage : "+questionPage.getCurrentPage()+"/"+questionPage.getEndPage()+"/"+questionPage.getStartPage()+"/"+questionPage.getListCount());

		return mv;
		
	}
	//페이징
	@RequestMapping(value="otherPageQu",method = RequestMethod.GET) // value : URL 주소 , method : type
	@ResponseBody // json 으로만 받을꺼에요
	private ResponseListVo otherPageQu(int selectedPage, HttpSession session, HttpServletRequest request) {
		Users user = (Users)session.getAttribute("loginUser");
		Pagination page = service.getAjaxQuestionPagination(selectedPage, user.getUserid(), request, session);
		log.info("#>page : "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+ page.getEndPage());
		List<Question> list = service.getQuestion(page, user.getUserid());
		return new ResponseListVo(list, page);
	}
	@RequestMapping("/questionco.do")
	public ModelAndView questionco(@RequestParam long qno) {
		Question question = service.contentS(qno);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("questionco");
		mv.addObject("question", question);
		return mv;
	}
	@RequestMapping(value="reupdate.do",method = RequestMethod.GET) //댓글작성
	private String reupdate(int qno, String content) {
		Question comment =  new Question();
		service.updateS(qno, content);
		comment.setQno(qno);
		comment.setContent(content);
	
		return "redirect:questionco.do?qno="+qno;
			
	}
//	@RequestMapping("/update") //댓글수정
//	private Question Update(int qno, String content) {	
//		Question comment = new Question();
//		
//		comment.setQno(qno);
//		comment.setContent(content);
//		
//		return comment;
//	}
	@RequestMapping("/del.do") //댓글삭제
	
	private String Delete(int qno) {
		service.deleteS(qno);
		
		return "redirect:list.do";
	}
}

