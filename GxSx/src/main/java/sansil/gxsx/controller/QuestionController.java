package sansil.gxsx.controller;


import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.Question;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.QuestionService;

@RequestMapping("Question")
@Controller
@Log4j
@AllArgsConstructor
public class QuestionController {
	
	private static final String qcon = null;
	@Resource(name="QuestionMapper")
	private QuestionService service;
	@Autowired
	HttpSession session;
	
	
	//���Ǳ� ����Ʈ View ��û / question.jsp ����
	@RequestMapping("list.do")
	public String list() {
		if(session.getAttribute("loginUser") == null) return "redirect:../"; //��α��ν� �ε��� or �α��� ������ �̵�
		return "gxsx/contact";
	}
	
	//���Ǳ� ����Ʈ JSON ������ ��û / ResponseListVo ����
	@ResponseBody
	@GetMapping("otherPageQu")
	private ModelAndView otherPageQu(int selectedPage) {
		log.info("#>>selectedPage : "+selectedPage);
		ResponseListVo result = service.getQuestionListService(selectedPage);
		return new ModelAndView("gxsx/questionList", "vo", result);
	}
	
	@ResponseBody
	@RequestMapping("/questionco.do")
	public ModelAndView questionco(@RequestParam long qno) {
		
		return new ModelAndView("gxsx/questionform", "question", service.contentS(qno));
	}
	
	@RequestMapping(value="reupdate.do",method = RequestMethod.POST) //����ۼ�
	private String reupdate(int qno, String content) {
		Question comment =  new Question();
		service.updateS(qno, content);
		comment.setQno(qno);
		comment.setContent(content);
	
		return "redirect:questionco.do?qno="+qno;
			
	}
//	@RequestMapping("/update") //��ۼ���
//	private Question Update(int qno, String content) {	
//		Question comment = new Question();
//		
//		comment.setQno(qno);
//		comment.setContent(content);
//		
//		return comment;
//	}
	@RequestMapping("/del.do") //��ۻ���
	private String Delete(int qno) {
		service.deleteS(qno);
		
		return "redirect:list.do";
	}
	//���� �� ��
	@RequestMapping("/write.do")
	private ModelAndView write(HttpSession session) {
		Users user = (Users)session.getAttribute("loginUser");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("question/write");
		mv.addObject("user", user);
		return mv;

	}
	
	//���� �۾���
	@PostMapping("/Questioninsert.do")
	private String Questioninsert(Question questioninsert) {
		service.QuestioninsertS(questioninsert);
		
		return "gxsx/contact";
	}
	//���Ǳ� ����
	@GetMapping("/Questionupdate.do")
	private String Questionupdate(Question questionupdate) {
		service.QuestionupdateS(questionupdate);
		return "redirect:list.do";
	}
	//���Ǳ� ����
	@GetMapping("/Questiondelete.do")
	private String Questiondelete(long qno) {
		service.QuestiondeleteS(qno);
		return "redirect:list.do";
	}
	
}

