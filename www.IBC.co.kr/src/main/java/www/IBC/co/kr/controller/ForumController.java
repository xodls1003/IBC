package www.IBC.co.kr.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumVO;
import www.IBC.co.kr.domain.PageDTO;
import www.IBC.co.kr.service.ForumService;

@Controller
@RequestMapping("www.IBC.co.kr/forum/*")
@AllArgsConstructor
public class ForumController {
	
	private ForumService service;
	
	@GetMapping("/register")
	@PreAuthorize("isAutgebticcated")
	public String register() {
		return "/forum/register";
	}
	
	//페이지 목록
	@GetMapping("/list")
	public String list(Criteria cri,Model model) {
		
		model.addAttribute("list",service.getList(cri));
		
		
		  int total = service.getTotal(cri);
		  
		  model.addAttribute("pageMaker", new PageDTO(cri,total));
		  return "/forum/list";
		 
	}
	//글 등록
	@PostMapping("/register")
	public String register(ForumVO forum, RedirectAttributes rttr) {
		
		
		
		service.register(forum);
		
		rttr.addFlashAttribute("result", forum.getFno());
		
		return "redirect:/www.IBC.co.kr/forum/list";
	}
	
	//글내용 보기
	@GetMapping("/get")
	public String get(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("forum", service.get(fno));
		return "/forum/get";
	}
	//수정폼 진입
	@GetMapping("/modify")
	public String enterModify(@RequestParam("fno") Long fno, @ModelAttribute("cri") Criteria cri, Model model) {
		model.addAttribute("forum", service.get(fno));
		return "/forum/modify";
	}
	
	
	
	
	//수정처리
	@PostMapping("/modify")
	public String modify(ForumVO forum,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.modify(forum)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		
		return "redirect:/www.IBC.co.kr/forum/list"+cri.getListLink();
	}
	//삭제 처리
	@PostMapping("/remove")
	public String remove(@RequestParam("fno") Long fno, 
			@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		
		if(service.remove(fno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/www.IBC.co.kr/forum/list"+cri.getListLink();
	}
	
}
