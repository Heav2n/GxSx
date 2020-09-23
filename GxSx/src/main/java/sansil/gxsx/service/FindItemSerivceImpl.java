package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemVo;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.mapper.FindItemMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("FindItem")
@AllArgsConstructor
public class FindItemSerivceImpl implements FindItemService {
	
	private FindItemMapper finditemMapper;

	@Override
	public List<FindItem> finditem() {
		return finditemMapper.selectFinditem();
	}

	@Override
	public void insertS(FindItPic findItPic){
		finditemMapper.insert(findItPic);
	}

	@Override
	public void deleteS(long fino) {
		finditemMapper.delete(fino);
	}

	@Override
	public FindItPic selectBySeqS(long fino) {
		return finditemMapper.selectBySeq(fino);
	}

	@Override
	public FindItPic UpdatefS(long fino) {
		return finditemMapper.updatef(fino);
	}

	@Override
	public boolean UpdateS(FindItPic findItPic) {
		return finditemMapper.update(findItPic);
	}
	
	@Override
	public void edit(FindItPic findItPic) {
		finditemMapper.update(findItPic);
	}
	
	@Override
	public void remove(long fino) {
		finditemMapper.delete(fino);
	}
	
	@Override
	public void write(FindItPic findItPic) {
		System.out.println("@@@@@@############### findItPic : " + findItPic);
		finditemMapper.insert(findItPic);

	}	
	
//	@Override
//	public FindItPicListResult getFindItPicListResult(int page, int pageSize) {
//		long totalCount = finditemMapper.selectCount();
//		FindItemVo findItPicVo = new FindItemVo(null, page, pageSize);
//		List<FindItPic> list = finditemMapper.selectPerPage(findItPicVo);
//		
//		System.out.println("list:------------------------------------------------------- " + list);
//		return new FindItPicListResult(page, pageSize, totalCount, list);		
//	}

	@Override
	public FindItPic UpdatefS(FiComments ficomments) {
		// TODO Auto-generated method stub
		return null;
	}
	
	///////////////////////////////////////////////////////////////////////////
	public List<FindItPic> selectByNameS(String query){
		return finditemMapper.selectByName(query);
	}
	
	@Override
	public FindItPicListResult getFindItemResultByKeyword(String fisub, int page, int pageSize) {
		List<FindItPic> list = selectByNameS(fisub);
		long totalCount = finditemMapper.selectCount();		
		return new FindItPicListResult(page, pageSize, totalCount, list);
	}
	
	@Override
	public Pagination getPagination(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		FindItPic query = new FindItPic();
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Long listCount = finditemMapper.selectCountFinditem();

		return new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs());
	}
	
	@Override
	public List<FindItPic> getlist(Pagination page) {
		return finditemMapper.selectPerPage(page);
	}
	
//	@Override
//	public FindItPicListResult listResult(int page, int pageSize) {
//		long totalCount = finditemMapper.selectCount();
//		FindItemVo findItPicVo = new FindItemVo(null, page, pageSize);
//		List<FindItPic> list = finditemMapper.selectPerPage(findItPicVo);
//		
//		System.out.println("list: " + list);
//		return new FindItPicListResult(page, pageSize, totalCount, list);		
//	}
	
	@Override
	public FindItPicListResult listResult(String fisub, int page, int pageSize) {
		long totalCount = finditemMapper.selectCount2(fisub);
		FindItemVo findItPicVo = new FindItemVo(fisub, page, pageSize);
		List<FindItPic> list = finditemMapper.selectPerPage2(findItPicVo);
		
		System.out.println("list2: " + list);
		return new FindItPicListResult(page, pageSize, totalCount, list);		
	}
	
	@Override
	public FindItPic getFindItPic(long fino) {
		return finditemMapper.selectBySeq(fino);
	}
	
	@Override
	public String areaS(long fino) {
		return finditemMapper.area(fino);
	}
	
	@Override
	public List<FindItPic> getFindRelated(){
		return finditemMapper.getFindRelated();
	}
	
	////////////////////////////////////////////////////////////////////////ÄÚ¸àÆ®
	public List<FiComments> FindCommentList(int fino) {
		return finditemMapper.FindCommentList(fino);
	}

}
