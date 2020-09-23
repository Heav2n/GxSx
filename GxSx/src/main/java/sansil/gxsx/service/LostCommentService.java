package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.LoComments;

public interface LostCommentService {
	
	List<LoComments> LostCommentList(int lono);
	
	List<LoComments> LostCommentInsert(LoComments locomments);
	
	void LostCommentDelete(LoComments locomments);

	void LostCommentUpdate(LoComments locomments);

//	List<LoComments> LostCommentInsert(LoComments locomments);
	
	List<LoComments> reSelectComment(LoComments locomments);

	
}