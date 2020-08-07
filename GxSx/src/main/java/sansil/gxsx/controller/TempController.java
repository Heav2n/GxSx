package sansil.gxsx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sansil.gxsx.domain.FindItem;
import sansil.gxsx.domain.LostItem;
import sansil.gxsx.service.TempService;

@RequestMapping("/temp/")
@Controller
public class TempController {
	@Resource(name="TempService")
	private TempService service;
	
//	@Resource(name="FindItemMapper")
//	private FindItemservice fservice;
	
	@RequestMapping("domain.do")
	public ModelAndView list() { 
		List<LostItem> lostResult = service.listS();
		ModelAndView mv = new ModelAndView("temp/domain", "lostResult", lostResult);
		
		return mv;
	}
}