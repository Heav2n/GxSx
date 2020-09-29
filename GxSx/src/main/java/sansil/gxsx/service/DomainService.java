package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Users;

public interface DomainService {
	
	List<LostItem> listloS();
	List<FindItem> listfiS();
	List<LostPic> listlopicS();
	List<FindPic> listfipicS();
	void signupS(Users users);
	Users loginS(HashMap loginmap);
	Users kakaologinS(String kid);
	
	Users kakaouser(Users kakaouser);
	String idconfirmS(String userid);
}
