package sansil.gxsx.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.mapper.LostitemXXMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("LostitemXXMapper")
@AllArgsConstructor
public class LostitemXXserviceImpl implements LostitemXXservice {

	private LostitemXXMapper lostitemxxMapper;
	private FileUploadservice fileuploadsevice;
	
	
	@Override
	public List<LostItemPicVo> list() {
		
		return lostitemxxMapper.list();
	}

	@Override
	public List<LostItemPicVo> getlist(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);
		LostItemPicVo query = new LostItemPicVo();
		Long listCount = lostitemxxMapper.selectCountLostitem();
		query.setPaging(new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs()));
		List<LostItemPicVo> lostitem = lostitemxxMapper.list();
		System.out.println("asdasdasdaTLqkf" + pagingutil.getPs());
		System.out.println("@!@#!@#!@#!@#" + lostitem);
		log.info("@!@#!@#!@#!@#" + lostitem);
		return lostitem;
	}

	@Override
	public Pagination getAjaxPagination(int selectedPage, HttpServletRequest request, HttpSession session) {
		long listCount = lostitemxxMapper.selectCountLostitem();
		PagingUtil page = new PagingUtil(null,null,session);
		
		return new Pagination(listCount, selectedPage, page.getPs());
	}

	@Override
	public List<LostItemPicVo> getlist(Pagination page) {
//		LostItem query = new LostItem();
//		query.setPaging(page);
		log.info("#>getlist() page: "+page.getCurrentPage()+"/"+page.getStartPage()+"/"+page.getEndPage()+"/"+page.getPageSize());
//		HashMap<String, Object> query = new HashMap<String, Object>();
//		query.put("page", page);
		return lostitemxxMapper.selectPerPage(page);
	}

	@Override
	public Pagination getPagination(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		
		LostItem query = new LostItem();
		PagingUtil pagingutil = new PagingUtil(cpStr, psStr, session);

		Long listCount = lostitemxxMapper.selectCountLostitem();

		return new Pagination(listCount, pagingutil.getCp(),pagingutil.getPs());
	}
	@Override
	public void insertS(LostItemPicVo lostitem) {
		lostitemxxMapper.insert(lostitem);
		
	}
	@Override
	public void insertP(LostItemPicVo lostitem, ArrayList<MultipartFile> files) {
		lostitemxxMapper.insert(lostitem);
		System.out.println("########## lllll :" + lostitem);
		for(MultipartFile file : files) {
            String ofname = file.getOriginalFilename();
            if(ofname != null) {
                ofname = ofname.trim();
                if(ofname.length() != 0) {
                	lostitem.setLopicname(ofname);
                	lostitemxxMapper.insert1(lostitem);
                    String url = fileuploadsevice.saveStore(file);
                    log.info("@@@@@@@@@@@"+ofname +"##########" +file);
                }
            }
        }
	int get_lono = lostitem.getLono();
	log.info("이건왜안뜨는거야tlqkf" + get_lono);
	}
	@Override
	public List<LostItemPicVo> ContentS(int lono) {
		return lostitemxxMapper.Content(lono);
	}
	@Override
	public String areaS(int lono) {
		return lostitemxxMapper.area(lono);
	}
	@Override
	public void deleteS(int lono) {
		lostitemxxMapper.delete(lono);
	}
	@Override
	public List<LostItemPicVo> UpdatefS(int lono) {
		return lostitemxxMapper.Updatef(lono);
	}

	@Override
	public boolean UpdateS(LostItemPicVo lostitem) {
		return lostitemxxMapper.Update(lostitem);
	}
	@Override
	public List<LostItemPicVo> getLostRelated(){
		return lostitemxxMapper.getLostRelated();
	}


}