package sansil.gxsx.mapper;

import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.domain.LostPic;

public interface TempMapper {
	List<LostItem> listlo();
	List<FindItem> listfi();
	List<LostPic> listlopic();
}
