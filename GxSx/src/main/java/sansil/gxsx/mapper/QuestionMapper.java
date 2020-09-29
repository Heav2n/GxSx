package sansil.gxsx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.Question;





public interface QuestionMapper {
	
	List<Question> selectQuestion(String query);
	
	//
	long selectCountQuestion(String query);
	
	//����¡
	List<Question> selectPerPage(Pagination page);
	
	//content ����
	Question content(long qno);
	
	public Question Insert(Question question);
	
	//��� �ۼ�  �Ķ���� Ÿ���� 2���϶� ����ϴ� ��
	public void update(@Param("qno") int qno, @Param("qreply")String qreply);
	
	//��� ����
	public Question update(Question question);
	
	//��� ����
	public long Delete(long qno);
	
	//�޼�����
	List<Question> messageQuestion(String userid);

}
