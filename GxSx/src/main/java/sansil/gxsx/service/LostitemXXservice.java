package sansil.gxsx.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;

public interface LostitemXXservice {
	
	List<LostItemPicVo> list();
	List<LostItemPicVo> getlist(HttpServletRequest request, HttpSession session);
	Pagination getAjaxPagination(int selectedPage, HttpServletRequest request,
							HttpSession session);
	List<LostItemPicVo> getlist(Pagination page);
	Pagination getPagination(HttpServletRequest request, HttpSession session);

	
	void insertS(LostItemPicVo lostitem);
	
	void insertP(LostItemPicVo lostitem, ArrayList<MultipartFile> files);

	
	
	List<LostItemPicVo> ContentS(int lono);
	String areaS(int lono);
	void deleteS(int lono);
	List<LostItemPicVo> UpdatefS(int lono);
	boolean UpdateS(LostItemPicVo lostitem);
	List<LostItemPicVo> getLostRelated();

	
}