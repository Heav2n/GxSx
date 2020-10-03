package sansil.gxsx.service;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.mapper.FindCommentMapper;

@Log4j
@Service("FindCommentService")
@AllArgsConstructor
public class FindCommentServiceImpl implements FindCommentService {
	
	
	private FindCommentMapper findcommentMapper;
	
	public List<FiComments> FindCommentList(int fino) {
		return findcommentMapper.FindCommentList(fino);
	}

	@Override
	public boolean FindCommentInsert(FiComments findcomments) {
		
		return findcommentMapper.FindCommentInsert(findcomments);
	}

	@Override
	public boolean FindCommentUpdate(FiComments fiComments) {		
		return findcommentMapper.FindCommentUpdate(fiComments);
	}

	@Override
	public boolean FindCommentDelete(FiComments ficomments) {
		return findcommentMapper.FindCommentDelete(ficomments);
		
	}
	
	@Override
	public boolean CommentReplyInsert(FiComments ficomments) {
		return findcommentMapper.CommentReplyInsert(ficomments);
	
	}
}