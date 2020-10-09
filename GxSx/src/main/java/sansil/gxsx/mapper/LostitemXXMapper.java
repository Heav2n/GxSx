package sansil.gxsx.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;

public interface LostitemXXMapper {
	
	List<LostItemPicVo> list();
	
	long selectCountLostitem();
	
	List<LostItemPicVo> selectPerPage(Pagination page);
	
	void insert(LostItemPicVo lostitem);
	
//	void insert1(LostItemPicVo lostitem,  ArrayList<MultipartFile> files);
	void insert1(LostItemPicVo lostitem);


	List<LostItemPicVo> Content(int lono);

	String area (int lono);
	
	void delete(int lono);

	List<LostItemPicVo> Updatef(int lono);
	boolean Update(LostItemPicVo lostitem);
	boolean Update1(LostItemPicVo lostitem);

	String saveStore(MultipartFile f);
    boolean writeFile(MultipartFile f, String saveFileName);
    
    void uploadpic(Map<String,String> map);
	List<LostItemPicVo> getLostRelated();
	List<LostItemPicVo> getpic();


    
}