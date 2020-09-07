package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemVo;
import sansil.gxsx.domain.FindListVo;
import sansil.gxsx.domain.LostItem;

public interface FindItemMapper {
	List<FindItem> selectFinditem();
		
	List<FindItPic> selectByWriter(FindItem findItPicVo);
	List<FindItPic> selectBySeq(FindItPic findItPic);
	void insert(FindItPic findItPic);
	boolean update(FindItPic findItPic);
	FindItPic updatef(long fino);
	void delete(long fino);
	
	///////////////////////////////////////////////////////////////
	List<FindItPic> selectByName(String fisub);
	
	long selectCount();
	long selectCount2(String fisub);
	List<FindItPic> selectPerPage(FindItemVo findItPicVo);
	List<FindItPic> selectPerPage2(FindItemVo findItPicVo);
	
	FindItPic selectBySeq(long fino);
	String area(long fino);
}

