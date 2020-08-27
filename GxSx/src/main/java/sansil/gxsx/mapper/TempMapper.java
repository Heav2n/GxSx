package sansil.gxsx.mapper;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Users;

public interface TempMapper {
	List<LostItem> listlo();
	List<FindItem> listfi();
	List<LostPic> listlopic();
	void signup(Users users);
	Users login(HashMap loginmap);
	Users usercheck(String kid); //카카오로그인시 등록되어있는 회원인지 확인
	void kakaouser(Users kakaouser);
}
