package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Notice;
import sansil.gxsx.domain.FindPic;
import sansil.gxsx.domain.Users;
import sansil.gxsx.mapper.DomainMapper;

@Service("DomainService")
public class DomainServiceImpl implements DomainService {
	@Autowired
	private DomainMapper mapper;
	
	@Override
	public List<LostItem> listloS() {
		return mapper.listlo();
	}
	
	@Override
	public List<FindItem> listfiS() {
		return mapper.listfi();
	}
	
	@Override
	public List<LostPic> listlopicS() {
		return mapper.listlopic();
	}
	
	@Override
	public List<FindPic> listfipicS() {
		return mapper.listfipic();
	}
	
	@Override
	public void signupS(Users users) {
		mapper.signup(users);
	}
	
	@Override
	public Users loginS(HashMap loginmap) {
		return mapper.login(loginmap);	
	}
	
	@Override
	public Users kakaologinS(String kid) {		
		return mapper.usercheck(kid);
	}
	
	@Override
	public Users kakaouser(Users kakaouser) {
		signupS(kakaouser);		
		return kakaologinS(kakaouser.getUserid());
	}
	
	@Override
	public int idCheckS(String userid) {
		return mapper.idcheck(userid);
	}
	
	@Override
	public List<Notice> noticeListS() {
		return mapper.noticelist();
	}
	
	@Override
	public Notice noticeConS(int nono) {
		return mapper.noticecon(nono);
	}
	
	@Override
	public Notice noticeUp(int nono) {
		return mapper.noticeup(nono);
	}
	@Override
	public Notice noticeDown(int nono) {
		return mapper.noticedown(nono);
	}
	
	@Override
	public String userPowerS(String userid) {
		return mapper.userpower(userid);
	}
	
	@Override
	public void noticeWriteS(Notice notice) {
		mapper.noticewrite(notice);
	}
	
	@Override
	public void noticeEditS(Notice notice) {
		mapper.noticeedit(notice);
	}
	
	@Override
	public void noticeDelS(int nono) {
		mapper.noticedel(nono);
	}
}
