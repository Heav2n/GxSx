package sansil.gxsx.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.mapper.LostCommentMapper;

@Log4j
@Service("LostCommentService")
@AllArgsConstructor
public class LostCommentServiceImpl implements LostCommentService {
	
	
	private LostCommentMapper LostcommentMapper;
	
	public List<LoComments> LostCommentList(int lono) {
		return LostcommentMapper.LostCommentList(lono);
	}

	@Override
	public List<LoComments> LostCommentInsert(LoComments locomments) {
		LostcommentMapper.LostCommentInsert(locomments);
		return LostcommentMapper.LostCommentList(locomments.getLono());
	}

	@Override
	public void LostCommentUpdate(LoComments locomments) {		
		LostcommentMapper.LostCommentUpdate(locomments);
	}

	@Override
	public void LostCommentDelete(LoComments locomments) {
		LostcommentMapper.LostCommentDelete(locomments);
		
	}
	@Override
	public List<LoComments> reSelectComment(LoComments locomments) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
