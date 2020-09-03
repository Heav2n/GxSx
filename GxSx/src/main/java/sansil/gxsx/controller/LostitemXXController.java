package sansil.gxsx.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import sansil.gxsx.domain.LostItemPicVo;
import sansil.gxsx.domain.Pagination;
import sansil.gxsx.domain.ResponseListVo;
import sansil.gxsx.service.FileUploadservice;
import sansil.gxsx.service.LostCommentService;
import sansil.gxsx.service.LostitemXXservice;

@RequestMapping("/lostitem2/")
@Controller
@Log4j
@AllArgsConstructor
public class LostitemXXController {
		@Resource(name="LostitemXXMapper")
		private LostitemXXservice service;
		private FileUploadservice fservice;
		@Resource(name="LostCommentService")
		private LostCommentService LostCommentService;
		
		
		@RequestMapping("list.do")
		public ModelAndView list(HttpServletRequest request, HttpSession session) {
			
			Pagination listpage = service.getPagination(request, session);
			List<LostItemPicVo> list = service.getlist(listpage);
			log.info("#> list size : "+list.size());
			ModelAndView mv = new ModelAndView();
			mv.setViewName("lostitem2/list");
			mv.addObject("lostitem2", list);
			mv.addObject("listpage", listpage);

			return mv;
		}
		@RequestMapping(value="paging",method = RequestMethod.GET)
		@ResponseBody
		private ResponseListVo paging(int selectedPage, HttpSession session,
				HttpServletRequest request) {
			Pagination page = service.getAjaxPagination(selectedPage, request, session);
			List<LostItemPicVo> list = service.getlist(page);
			return new ResponseListVo(list, page);
		}
		@GetMapping("/write.do")
		public String write() {
			return "lostitem2/write1";
		}
		@PostMapping("/write.do")
		public String write(LostItemPicVo lostitem, @RequestParam ArrayList<MultipartFile> files) {
			log.info("%%%%%%%%%%%%" + files);
			 for(MultipartFile file : files) {
		            String ofname = file.getOriginalFilename();
		            if(ofname != null) {
		                ofname = ofname.trim();
		                if(ofname.length() != 0) {
		                	lostitem.setLopicname(ofname);
		            		service.insertS(lostitem);
		                    String url = fservice.saveStore(file);
		                    log.info("@@@@@@@@@@@"+ofname +"##########" +file);
		                }
		            }
		        }
			
			return "redirect:list.do";
		}
		@RequestMapping("/locontent.do")
		public ModelAndView content(int lono) {
//			log.info("############ lono : " + lono);
//			return null;
			LostItemPicVo lostitem = service.ContentS(lono);
			String area = service.areaS(lono);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("lostitem2/locontent");
			mv.addObject("locontent", lostitem);
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
		public ModelAndView updatef(int lono) {
			LostItemPicVo lostitem = service.UpdatefS(lono);
			ModelAndView mv = new ModelAndView();
			mv.setViewName("lostitem2/updatef");
			mv.addObject("updatef", lostitem);
			
			return mv;
		}
		@PostMapping("/update")
		public String update(LostItemPicVo lostitem) {
			service.UpdateS(lostitem);
			return "redirect:list.do";
		}
}

