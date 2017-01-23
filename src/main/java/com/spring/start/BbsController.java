package com.spring.start;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.service.BbsService;
import com.spring.vo.BbsVO;
import com.spring.vo.PageCriteria;
import com.spring.vo.PagingMaker;

@Controller
@RequestMapping("/bbs/*")
public class BbsController {
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	@Inject
	private BbsService bsvc;
	
	@RequestMapping(value="/write")
	public void writeGet(){
		logger.info("게시글 입력...");
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String writePost(BbsVO bvo, RedirectAttributes reAttr) throws Exception{
		logger.info("write Post...");
		logger.info(bvo.toString());
		
		bsvc.write(bvo);
		reAttr.addFlashAttribute("result", "success");
		
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/read")
	public void read(@RequestParam("bid") int bid, PageCriteria pageCriteria, Model model) throws Exception{
		model.addAttribute(bsvc.read(bid)); //addAttribute의 키값을 지정하지 않았을 경우, key는 자동으로 클래스 이름을 소문자로 시작해서 저장됨
	}
	
	
	//RedirectAttributes 객체는 리다이렉트 시 데이터를 전송할 수 있는 addAttribute()메소드를 지원
	//RedirectAttributes 객체는 리다이렉트 시점에 한번만 사용되는 데이터를 전송할 수 있는 addFlashAttribute()메소드를 지원
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String delete(@RequestParam("bid") int bid, PageCriteria pageCriteria, RedirectAttributes reAttr) throws Exception{
		logger.info("delete bid : " + bid);
		bsvc.remove(bid);
		reAttr.addFlashAttribute("result", "success");
		reAttr.addAttribute("page", pageCriteria.getPage());
		reAttr.addAttribute("numPerPage", pageCriteria.getNumPerPage());
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/modify")
	public void modifyGet(@RequestParam("bid") int bid, PageCriteria pageCriteria, Model model) throws Exception{
		model.addAttribute(bsvc.read(bid));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPost(BbsVO bvo, PageCriteria pageCriteria, RedirectAttributes reAttr) throws Exception{
		logger.info("Modify Post...");
		logger.info(bvo.toString());
		
		bsvc.modify(bvo);
		reAttr.addFlashAttribute("result", "success");
		reAttr.addAttribute("page", pageCriteria.getPage());
		reAttr.addAttribute("numPerPage", pageCriteria.getNumPerPage());
		return "redirect:/bbs/list";
	}
	
	@RequestMapping(value="/list") 
	public void list(PageCriteria pageCriteria, Model model, PagingMaker pagingMaker) throws Exception {
		logger.info("list : " + pageCriteria.toString());
		
		//PagingMaker pagingMaker = new PagingMaker(); //매개변수에 넣는 것과 직접 생성하는 것의 차이는 무엇인가????
		pagingMaker.setPageCriteria(pageCriteria);
		pagingMaker.setTotalData(bsvc.listCountData());
		
		model.addAttribute("list", bsvc.listCriteria(pageCriteria));	
		model.addAttribute("pagingMaker", pagingMaker);
	}
	
}
