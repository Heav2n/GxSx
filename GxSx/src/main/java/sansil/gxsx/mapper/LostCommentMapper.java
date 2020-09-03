package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.LoComments;


public interface LostCommentMapper {
	
	List<LoComments> LostCommentList(int lono);
	
	
	int LostCommentInsert(LoComments locomments);
	
	
	void LostCommentDelete(LoComments locomments);
	
	List<LoComments> reSelectComment(LoComments locomments);

	void LostCommentUpdate(LoComments locomments);

	
}

