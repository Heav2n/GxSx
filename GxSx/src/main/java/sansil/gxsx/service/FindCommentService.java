package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FiComments;

import sansil.gxsx.domain.Pagination;

public interface FindCommentService {
	
	List<FiComments> FindCommentList(int fino);
	
	boolean FindCommentInsert(FiComments findcomments);
	
	boolean FindCommentDelete(FiComments fiComments);

	boolean FindCommentUpdate(FiComments fiComments);

	boolean CommentReplyInsert(FiComments fiComments);
}