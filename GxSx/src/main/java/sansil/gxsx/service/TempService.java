package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Users;

public interface TempService {
	
	List<LostItem> listloS();
	List<FindItem> listfiS();
	List<LostPic> listlopicS();
	void signupS(Users users);
	Users loginS(HashMap loginmap);
	Users kakaologinS(String kid);
}
