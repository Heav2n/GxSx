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
	public List<FiComments> FindCommentInsert(FiComments findcomments) {
		findcommentMapper.FindCommentInsert(findcomments);
		return findcommentMapper.FindCommentList(findcomments.getFino());
	}

	@Override
	public void FindCommentUpdate(FiComments fiComments) {		
		findcommentMapper.FindCommentUpdate(fiComments);
	}

	@Override
	public void FindCommentDelete(FiComments ficomments) {
		 findcommentMapper.FindCommentDelete(ficomments);
		
	}
}
