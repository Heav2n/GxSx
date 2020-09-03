package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.FiComments;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.FindItPicListResult;
import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.FindItemResult;

public interface FindItemService {
	List<FindItem> finditem();

	FindItPic getFindItPic(long fino);
	void insertS(FindItPic findItPic);
	void deleteS(long fino);
	FindItPic selectBySeqS(long fino);
	FindItPic UpdatefS(FiComments ficomments);
	boolean UpdateS(FindItPic findItPic);
	String areaS(long fino);
	
	void write(FindItPic findItPic);
	void edit(FindItPic findItPic);
	void remove(long seq);

	FindItPicListResult getFindItPicListResult(int cp, int ps);

	FindItPic UpdatefS(long fino);
	
	
	////////////////////////////////////////////////////////////////////////////////////////////
	FindItPicListResult getFindItemResultByKeyword(String fisub, int page, int pageSize);	
	List<FindItPic> selectByNameS(String fisub);
	
	FindItPicListResult listResult(int cp, int ps);

	
}
