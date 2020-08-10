package sansil.gxsx.service;

import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;

public interface TempService {
	
	List<LostItem> listloS();
	List<FindItem> listfiS();
	List<LostPic> listlopicS();
}
