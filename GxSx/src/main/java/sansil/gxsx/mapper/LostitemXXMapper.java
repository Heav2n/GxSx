package sansil.gxsx.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;

public interface LostitemXXMapper {
	
	List<LostItemPicVo> list();
	
	long selectCountLostitem();
	
	List<LostItemPicVo> selectPerPage(Pagination page);
	
	void insert(LostItemPicVo lostitem);
	
	void insert1(LostItemPicVo lostitem);


	LostItemPicVo Content(int lono);

	String area (int lono);
	
	void delete(int lono);

	LostItemPicVo Updatef(int lono);
	boolean Update(LostItemPicVo lostitem);
	boolean Update1(LostItemPicVo lostitem);

	String saveStore(MultipartFile f);
    boolean writeFile(MultipartFile f, String saveFileName);
    
    void uploadpic(Map<String,String> map);
}
