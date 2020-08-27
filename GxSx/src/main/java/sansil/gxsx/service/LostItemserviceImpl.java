package sansil.gxsx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemResult;
import sansil.gxsx.domain.LostItemVo;
import sansil.gxsx.mapper.LostItemMapper;

@Service("LostItemMapper")
public class LostItemserviceImpl implements LostItemservice {
	@Autowired
	private LostItemMapper lostitemMapper;
	
	@Override
	public LostItemResult getLostItemResult(int page, int pageSize) {
		long totalCount = lostitemMapper.selectCount();
		LostItemVo lostitemvo = new LostItemVo(null, page, pageSize);
		List<LostItem> list = lostitemMapper.selectPerPage(lostitemvo);
		
		return new LostItemResult(page, pageSize, totalCount, list);
	}

	@Override
	public LostItemResult getLostItemResultByKeyword(String query, int page, int pageSize) {
		List<LostItem> list = selectByNameS(query);
		long totalCount = lostitemMapper.selectCount();
//		LostItemVo lostitemvo = new LostItemVo(query, page, pageSize);
//		List<LostItem> list = lostitemMapper.selectByWriter(lostitemvo);
		
		return new LostItemResult(page, pageSize, totalCount, list);
	}

	@Override
	public void insertS(LostItem lostitem) {
		lostitemMapper.insert(lostitem);
	}

	@Override
	public void deleteS(int lono) {
		lostitemMapper.delete(lono);
	}

	@Override
	public LostItem ContentS(int lono) {
		return lostitemMapper.Content(lono);
	}

	@Override
	public LostItem UpdatefS(int lono) {
		return lostitemMapper.Updatef(lono);
	}

	@Override
	public boolean UpdateS(LostItem lostitem) {
		return lostitemMapper.Update(lostitem);
	}
	
	//for Ajax
	public List<LostItem> selectByNameS(String losub){
		return lostitemMapper.selectByName(losub);
	}

}
