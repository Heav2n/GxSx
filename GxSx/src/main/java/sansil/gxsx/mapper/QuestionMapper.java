package sansil.gxsx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;





public interface QuestionMapper {
	
	List<Question> selectQuestion(String query);
	
	//
	long selectCountQuestion(String query);
	
	//페이징
	List<Question> selectPerPage(Pagination page);
	
	//content 띄우기
	Question content(long qno);
	
	public Question Insert(Question question);
	
	//댓글 작성  파라미터 타입이 2개일때 사용하는 법
	public void update(@Param("qno") int qno, @Param("qreply")String qreply);
	
	//댓글 수정
	public Question update(Question question);
	
	//댓글 삭제
	public long Delete(long qno);
	
	//메세지용
	List<Question> messageQuestion(String userid);

}
