package sansil.gxsx.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import sansil.gxsx.domain.FindItPic;
import sansil.gxsx.domain.LoComments;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.LostPic;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.domain.Users;
import sansil.gxsx.service.FileUploadservice;
import sansil.gxsx.service.LostCommentService;
import sansil.gxsx.service.LostPicService;
import sansil.gxsx.service.LostitemXXservice;

@RequestMapping("/lostitem/")
@Controller
@Log4j
@AllArgsConstructor
public class LostitemXXController {
	@Resource(name="LostitemXXMapper")
	private LostitemXXservice service;
	@Resource(name="LostCommentService")
	private LostCommentService lostCommentService;
//	@Resource(name="LostPic")
//	private LostPicService lostpicS;
	
	private FileUploadservice fservice;
	
	
	
	@RequestMapping("list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		
		Pagination listpage = service.getPagination(request, session);
		List<LostItemPicVo> list = service.getlist(listpage);
		log.info("#> pic size : "+list.size());
		log.info("@#@#@#@#@#@#@#@#" + list);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/lolist");
		mv.addObject("lostResult", list);
		mv.addObject("listpage", listpage);
		log.info("xxxxxxxxXX" + list);
		return mv;
	}
	@RequestMapping(value="paging",method = RequestMethod.GET)
	@ResponseBody
	private ResponseListVo paging(int selectedPage, HttpSession session,
			HttpServletRequest request) {
		Pagination page = service.getAjaxPagination(selectedPage, request, session);
		List<LostItemPicVo> list = service.getlist(page);
		
		log.info("이게 맞는건가?");
		return new ResponseListVo(list, page);
	}
	@GetMapping("/write.do")
	public ModelAndView write(HttpServletRequest request, HttpSession session) {
		
		Users user = (Users)session.getAttribute("loginuser");
		String userid = user.getUserid();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/lowrite");
		mv.addObject("userid", userid);
		
		return mv;
	}
	@PostMapping("/write.do")
	public String write(LostItemPicVo lostitem, ArrayList<MultipartFile> files
						) {
		log.info("%%%%%%%%%%%%" + files);
		log.info("@@@@@@@@LOSTITEMPICVO@@@@@@@@@" + lostitem);
		// 잃어버린 물품 - DB 에 저장
//		service.insetS(lostitem);

		
		
		service.insertP(lostitem, files);
		
		// 잃어버린 물품의 DB에서 code값 ai => 값을가지고
		
		// 잃어버린 물품 사진 => code값을 넣고 사진들을 넣는다.
		
		 
		
		return "redirect:list.do";
	}
	@RequestMapping("/locontent.do")
	public ModelAndView content(int lono) {
		List<LostItemPicVo> lostitem = service.ContentS(lono);
		List<LostItemPicVo> related = service.getLostRelated();

		String area = service.areaS(lono);
		
		List<LoComments> locomment = lostCommentService.LostCommentList(lono);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/locontent");
		mv.addObject("locontent", lostitem);
		mv.addObject("locomment", locomment);
		mv.addObject("related", related);

		mv.addObject("area", area);
		log.info("xxxxxxxxxx"+ lostitem + "sadasdsadsadasdsadqwdsadasda" + area);
		return mv;
	}
	@GetMapping("/del.do")
	public String delete(@RequestParam int lono,
			HttpSession session, HttpServletRequest request, Object page) {
		ServletContext application = session.getServletContext();
		log.info("#application" + application);
		service.deleteS(lono);
		return "redirect:list.do";
	}
	@RequestMapping("/updatef.do")
	public ModelAndView updatef(int lono,HttpServletRequest request, HttpSession session) {
		List<LostItemPicVo> lostitem = service.UpdatefS(lono);
		
		Users user = (Users)session.getAttribute("loginuser");
		String userid = user.getUserid();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("gxsx/updatef");
		mv.addObject("updatef", lostitem);
		mv.addObject("userid", userid);
		
		return mv;
	}
	@PostMapping("/update")
	public String update(LostItemPicVo lostitem) {
		service.UpdateS(lostitem);
		return "redirect:list.do";
	}
	
}