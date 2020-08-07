package sansil.gxsx.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.mapper.TempMapper;

@Service("TempService")
public class TempServiceImpl implements TempService {
	@Autowired
	private TempMapper tempMapper;
	
	@Override
	public List<LostItem> listS() {
		return tempMapper.list();
	}

}
