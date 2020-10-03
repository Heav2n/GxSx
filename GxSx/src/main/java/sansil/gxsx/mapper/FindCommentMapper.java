package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FiComments;


public interface FindCommentMapper {
	
	List<FiComments> FindCommentList(int fino);
	
	boolean FindCommentInsert(FiComments findcomments);

	
	boolean FindCommentDelete(FiComments fiComments);
	
	List<FiComments> reSelectComment(FiComments findcomments);

//	FiComments FindCommentUpdate(int comno, String contents);

	boolean FindCommentUpdate(FiComments fiComments);
	
	boolean CommentReplyInsert(FiComments fiComments);

}

