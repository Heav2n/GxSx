package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemVo;

public interface LostItemMapper {
	List<LostItem> selectPerPage(LostItemVo lostitemvo);
	long selectCount();
	LostItem Content(int lono);
	List<LostItem> selectByWriter(LostItemVo lostitemvo);
	void insert(LostItem lostitem);
	void delete(int lono);
	LostItem Updatef(long lono);
	boolean Update(LostItem lostitem);
	
	//for Ajax
	LostItem selectBySeq(long lono);
	List<LostItem> selectByName(String losub);
	
	List<LostItem> selectByName2(String query);
}
