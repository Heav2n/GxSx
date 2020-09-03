package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FiComments;


public interface FindCommentMapper {
	
	List<FiComments> FindCommentList(int fino);
	
	int FindCommentInsert(FiComments findcomments);

	
	void FindCommentDelete(FiComments fiComments);
	
	List<FiComments> reSelectComment(FiComments findcomments);

//	FiComments FindCommentUpdate(int comno, String contents);

	void FindCommentUpdate(FiComments fiComments);

}

