package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemResult;

public interface LostItemservice {
	
	LostItemResult getLostItemResult(int page, int pageSize);
	LostItemResult getLostItemResultByKeyword(String keyword, int page, int pageSize);
	void insertS(LostItem lostitem);
	void deleteS(int lono);
	LostItem ContentS(int lono);
	LostItem UpdatefS(int lono);
	boolean UpdateS(LostItem lostitem);
	
	//for Ajax
	List<LostItem> selectByNameS(String losub);
}
