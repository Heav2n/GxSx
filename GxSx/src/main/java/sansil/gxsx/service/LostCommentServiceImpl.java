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
	public boolean LostCommentInsert(LoComments locomments) {
		return LostcommentMapper.LostCommentInsert(locomments);
	}

	@Override
	public boolean LostCommentUpdate(LoComments locomments) {		
		return LostcommentMapper.LostCommentUpdate(locomments);
	}

	@Override
	public boolean LostCommentDelete(LoComments locomments) {
		return LostcommentMapper.LostCommentDelete(locomments);
	}
	@Override
	public List<LoComments> reSelectComment(LoComments locomments) {
		// TODO Auto-generated method stub
		return null;
	}

	
}
