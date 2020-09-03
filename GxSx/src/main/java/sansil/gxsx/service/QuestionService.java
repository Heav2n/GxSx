package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;


public interface QuestionService {
	
	List<Question> selectQuestion(String quid);

	List<Question> getQuestion(String quid, HttpServletRequest request, HttpSession session);
	
	Pagination getAjaxQuestionPagination(int selectedPage, String quid, HttpServletRequest request,
			HttpSession session);
	
	
	List<Question> getQuestion(Pagination page, String quid);

	Pagination getQuestionPagination(String quid, HttpServletRequest request, HttpSession session);

	Question contentS(long seq);
	
	/**
	 * ��� ���� �۾��⸦ insert���ִ� �޼ҵ�
	 * @param question
	 * @return
	 */
	Question insertS(Question question);
	
	Question updateS(Question question);
	
	long deleteS(long qno);

	/**
	 * �� �ڽ��� ����� insert���ִ� Service
	 * @param qno
	 * @param content
	 */
	void updateS(int qno, String content);

	
	
}