package sansil.gxsx.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemResult;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;

public interface FindItemService {
	List<FindItem> finditem();

	void insertS(FindItPic findItPic);
	void deleteS(long fino);
	FindItPic selectBySeqS(long fino);
	FindItPic UpdatefS(FiComments ficomments);
	boolean UpdateS(FindItPic findItPic);
	
	void write(FindItPic findItPic);
	void edit(FindItPic findItPic);
	void remove(long seq);

//	FindItPicListResult getFindItPicListResult(int cp, int ps);

	FindItPic UpdatefS(long fino);
	
	
	////////////////////////////////////////////////////////////////////////////////////////////확실히사용중(최종때 위에지울꺼임)
	FindItPicListResult getFindItemResultByKeyword(String fisub, int page, int pageSize);	
	List<FindItPic> selectByNameS(String fisub);
	

	Pagination getPagination(HttpServletRequest request, HttpSession session);
	List<FindItPic> getlist(Pagination page);
//	FindItPicListResult listResult(int cp, int ps);
	FindItPicListResult listResult(String fisub, int cp, int ps);
	
	FindItPic getFindItPic(long fino);
	String areaS(long fino);
	List<FindItPic> getFindRelated();
	
	///////////////////////////////////////////////////////////////////////////////////////코멘트
	List<FiComments> FindCommentList(int fino);


	
}
