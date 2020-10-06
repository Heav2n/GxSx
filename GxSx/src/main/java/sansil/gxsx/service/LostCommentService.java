package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.LoComments;

public interface LostCommentService {
	
	List<LoComments> LostCommentList(int lono);
	
	boolean LostCommentInsert(LoComments locomments);
	
	boolean LostCommentDelete(LoComments locomments);

	boolean LostCommentUpdate(LoComments locomments);
	
	List<LoComments> reSelectComment(LoComments locomments);	
}