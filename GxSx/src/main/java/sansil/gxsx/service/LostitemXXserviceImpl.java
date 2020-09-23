package sansil.gxsx.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.mapper.LostitemXXMapper;
import sansil.gxsx.utils.PagingUtil;

@Log4j
@Service("LostitemXXMapper")
@AllArgsConstructor
public class LostitemXXserviceImpl implements LostitemXXservice {

	private LostitemXXMapper lostitemxxMapper;
	

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
		lostitemxxMapper.insert1(lostitem);
	}
	@Override
	public LostItemPicVo ContentS(int lono) {
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
	public LostItemPicVo UpdatefS(int lono) {
		return lostitemxxMapper.Updatef(lono);
	}

	@Override
	public boolean UpdateS(LostItemPicVo lostitem) {
		return lostitemxxMapper.Update(lostitem);
	}


}
