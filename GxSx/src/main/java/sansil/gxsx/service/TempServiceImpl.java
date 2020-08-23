package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Users;
import sansil.gxsx.mapper.TempMapper;

@Service("TempService")
public class TempServiceImpl implements TempService {
	@Autowired
	private TempMapper tempMapper;
	
	@Override
	public List<LostItem> listloS() {
		return tempMapper.listlo();
	}
	
	@Override
	public List<FindItem> listfiS() {
		return tempMapper.listfi();
	}
	
	@Override
	public List<LostPic> listlopicS() {
		return tempMapper.listlopic();
	}
	
	@Override
	public void signupS(Users users) {
		tempMapper.signup(users);
	}
	
	@Override
	public Users loginS(HashMap loginmap) {
		return tempMapper.login(loginmap);	
	};

}
