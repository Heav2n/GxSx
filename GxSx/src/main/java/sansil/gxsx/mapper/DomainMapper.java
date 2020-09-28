package sansil.gxsx.mapper;

import java.util.HashMap;
import java.util.List;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Users;

public interface DomainMapper {
	List<LostItem> listlo();
	List<FindItem> listfi();
	List<LostPic> listlopic();
	List<FindPic> listfipic();
	void signup(Users users);
	Users login(HashMap loginmap);
	Users usercheck(String kid); //īī���α��ν� ��ϵǾ��ִ� ȸ������ Ȯ��
	void kakaouser(Users kakaouser);
	String idconfirm(String userid);
}
