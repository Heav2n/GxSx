package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemVo;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.mapper.FindItemMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("FindItem")
@AllArgsConstructor
public class FindItemSerivceImpl implements FindItemService {
	
	private FindItemMapper finditemMapper;
	
	@Autowired
	HttpSession session;
	@Autowired
	HttpServletRequest request;

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

//	@Override
//	public FindItPic selectBySeqS(long fino) {
//		return finditemMapper.selectBySeq(fino);
//	}

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
	public List<FindItPic> getFindItPic(long fino) {
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
	
	////////////////////////////////////////////////////////////////////////�ڸ�Ʈ
	public List<FiComments> FindCommentList(int fino) {
		return finditemMapper.FindCommentList(fino);
	}
	
	@Override
	public int insertBoard(FindItem findItem) {
		int result = finditemMapper.insertBoard(findItem);
		return result;
	}

	@Override
	public int insertBoardPic(Map<String, Object> paramMap) {

		int result = finditemMapper.insertBoardPic(paramMap);
		return result;

	}
	
	@Override
	public Pagination getPaginationByCondition(HttpServletRequest request, HttpSession session, String option,
			String condition, String sorting) {
		System.out.println("==============> getPaginationByCondition Start");
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");

		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("option", option);
		paramMap.put("condition", condition);
		paramMap.put("sorting", sorting);

		Long listCount = finditemMapper.selectCountByCondition(paramMap);
		System.out.println("listCount ==> " + listCount);
		return new Pagination(listCount, pagingutil.getCp(), pagingutil.getPs());
	}
	
	
	@Override
	public List<FindItPic> getlistByCondition(Pagination page, String option, String condition, String sorting) {

		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startRow", page.getStartRow());
		paramMap.put("endRow", page.getEndRow());
		paramMap.put("option", option);
		paramMap.put("condition", condition);
		paramMap.put("sorting", sorting);
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("startRow"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("endRow"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("option"));
		System.out.println("getlistByCondition paramMap===>> " + paramMap.get("condition"));
		System.out.println("#>getlist() page: " + page.getCurrentPage() + "/" + page.getStartPage() + "/"
				+ page.getEndPage() + "/" + page.getPageSize());
		log.info("#>getlist() page: " + page.getCurrentPage() + "/" + page.getStartPage() + "/" + page.getEndPage()
				+ "/" + page.getPageSize());
		return finditemMapper.selectPerPageByCondition(paramMap);
	}
	
	
	
	@Override
	public ResponseListVo getListService(HashMap<String, Object> requestQuery) {
		String psStr = request.getParameter("ps");
		
		int selectedPage = 0;
		String option = null;
		String keyword = null;
		String sorting = null;
		log.info("#> size ? "+requestQuery.size());
		log.info("#> null ? "+requestQuery.get("selectedPage"));
		
		if(requestQuery != null) {
			selectedPage = Integer.parseInt(requestQuery.get("selectedPage").toString());
			if((boolean)requestQuery.get("search")) {
				option = (String)requestQuery.get("option");
				keyword = (String)requestQuery.get("keyword");
				sorting = (String)requestQuery.get("sorting");
			}
		}
		
		PagingUtil util = new PagingUtil(String.valueOf(selectedPage), psStr, session);
		
		log.info("#> o : "+option);
		log.info("#> k : "+keyword);
		log.info("#> s : "+sorting);
		Map<String, Object> query = new HashMap<String, Object>();
		query.put("option", option);
		query.put("sorting", sorting);
		query.put("keyword", keyword);

		long listCount = finditemMapper.selectListCount(query);
		Pagination page = new Pagination(listCount, selectedPage, util.getPs());
		
		query.put("page", page);
		List<FindItPic> list = finditemMapper.selectList(query);

		for (FindItPic findItPic : list) {
			List<FindPic> picList = finditemMapper.selectFindPic(findItPic.getFino());
			for (FindPic pic : picList) {
				findItPic.setFipicno(pic.getFipicno());
				findItPic.setFipno(pic.getFipno());
				findItPic.setFipicname(pic.getFipicname());
				break;
			}
		}
		return new ResponseListVo(list, page);
	}

}
