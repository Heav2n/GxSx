package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.service.FindItemService;
import sansil.gxsx.service.FindPicService;

@RequestMapping("/findItPic2/")
@Controller
@Log4j
@AllArgsConstructor
public class FindController {
	@Resource(name="FindPic")
	private FindPicService service;

	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		
		Pagination listpage = service.getPagination(request, session);
		List<FindItPic> list = service.getlist(listpage);
		log.info("#> list size : "+list.size());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("findItPic2/list");
		mv.addObject("findItPic2", list);
		mv.addObject("listpage", listpage);

		return mv;
	}
	@RequestMapping(value="paging",method = RequestMethod.GET)
	@ResponseBody
	private ResponseListVo paging(int selectedPage, HttpSession session,HttpServletRequest request) {
		Pagination page = service.getAjaxPagination(selectedPage, request, session);
		List<FindItPic> list = service.getlist(page);
		return new ResponseListVo(list, page);
	}
	
}
