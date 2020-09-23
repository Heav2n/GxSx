package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FiComments;

import sansil.gxsx.domain.Pagination;

public interface FindCommentService {
	
	List<FiComments> FindCommentList(int fino);
	
	List<FiComments> FindCommentInsert(FiComments findcomments);
	
	void FindCommentDelete(FiComments fiComments);

	void FindCommentUpdate(FiComments fiComments);

	
}