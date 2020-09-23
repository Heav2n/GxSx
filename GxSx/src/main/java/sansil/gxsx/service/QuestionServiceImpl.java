package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;
import sansil.gxsx.mapper.QuestionMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("QuestionMapper")
@AllArgsConstructor
public class QuestionServiceImpl implements QuestionService {
	
	private QuestionMapper questionMapper;
	
//	@Override
//	public List<Question> selectQuestion() {
//		return questionMapper.selectQuestion();
//	}

	@Override
	public List<Question> getQuestion(Pagination page, String quid) {
		Question query = new Question();
		query.setQuid(quid);
		query.setPaging(page);
		
		return questionMapper.selectQuestion(query.getQuid());
	}	

	@Override
	public Pagination getAjaxQuestionPagination(int selectedPage, String quid, HttpServletRequest request,
			HttpSession session) {
		long listCount = questionMapper.selectCountQuestion(quid);
		log.info("#> listCount : "+listCount);
		PagingUtil page = new PagingUtil(null, null, session);
		return new Pagination(listCount, selectedPage, page.getPs());
	}
	@Override
	public Pagination getQuestionPagination(String quid, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		Question query = new Question();
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		query.setQuid(quid);
		Long listCount = questionMapper.selectCountQuestion(quid);
		
		return new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs());
	}

	@Override
	public List<Question> selectQuestion(String quid) {
		return questionMapper.selectQuestion(quid);
	}

	@Override
	public List<Question> getQuestion(String quid, HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingUtil = new PagingUtil(cpStr, psStr, session);
		Question query = new Question();
		query.setQuid(quid);
		Long listCount = questionMapper.selectCountQuestion(query.getQuid());

		query.setPaging(new Pagination(listCount, pagingUtil.getCp(), pagingUtil.getPs()));
		
		
		List<Question> question = questionMapper.selectQuestion(query.getQuid());
		
		log.info("#> controller question : "+question);
		for(Question selectQuestion : question) {
			log.info("#> query "+ query.getPaging());
			/*
			log.info("currentPage : "+query.getPaging().getCurrentPage()+
					"currentRange : "+query.getPaging().getCurrentRange()+
					"endPage : "+query.getPaging().getEndPage()+
					"" ...
					);
			*/
		}
		return question;
	}

	@Override
	public Question contentS(long qno) {
			return questionMapper.content(qno);
	}

	@Override
	public Question insertS(Question question) {		
		return questionMapper.Insert(question);
	}
	@Override
	public void updateS(int qno, String content) {		
		questionMapper.update(qno, content);
	}
	@Override
	public Question updateS(Question question) {
		return questionMapper.update(question);
	}

	@Override
	public long deleteS(long qno) {
		return questionMapper.Delete(qno);
	}	
}
