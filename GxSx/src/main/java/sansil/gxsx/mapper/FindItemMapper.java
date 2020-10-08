package sansil.gxsx.mapper;

import java.util.List;
import java.util.Map;

import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemVo;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;

public interface FindItemMapper {
	List<FindItem> selectFinditem();
		
	List<FindItPic> selectByWriter(FindItem findItPicVo);
//	List<FindItPic> selectBySeq(FindItPic findItPic);
	void insert(FindItPic findItPic);
	boolean update(FindItPic findItPic);
	FindItPic updatef(long fino);
	void delete(long fino);
	
	///////////////////////////////////////////////////////////////
	List<FindItPic> selectByName(String fisub);
	
	long selectCount();
	long selectCount2(String fisub);
	long selectCountFinditem();
	List<FindItPic> selectPerPage(Pagination page);
//	List<FindItPic> selectPerPage(FindItemVo findItPicVo);
	List<FindItPic> selectPerPage2(FindItemVo findItPicVo);
	
	List<FindItPic> selectBySeq(long fino);
	String area(long fino);
	List<FindItPic> getFindRelated();
	
	////////////////////////////////////////////////////////////�ڸ�Ʈ
	List<FiComments> FindCommentList(int fino);
	long selectCountByCondition(Map<String, String> paramMap);
	List<FindItPic> selectPerPageByCondition(Map<String, Object> paramMap);
	int insertBoard(FindItem findItem);
	int insertBoardPic(Map<String, Object> paramMap);
	
	long selectListCount(Map<String, Object> query);
	List<FindItPic> selectList(Map<String, Object> query);
	List<FindPic> selectFindPic(long fipno);

}

