package www.IBC.co.kr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.IBC.co.kr.model.FAQ;
import www.IBC.co.kr.model.FAQReply;
import www.IBC.co.kr.service.FAQReplyService;
import www.IBC.co.kr.service.FAQService;

@Controller
public class FAQReplyController {
	
	@Autowired
	private FAQReplyService frs;
	@Autowired
	private FAQService fs;
	
	@RequestMapping("/FAQReplyList/fno/{fno}")
	public String FAQReplyList(@PathVariable int fno, Model model) {
		FAQ faq = fs.select(fno);
		List<FAQReply> frList = frs.list(fno);
		model.addAttribute("faq", faq);
		model.addAttribute("frList", frList);
		return "FAQReplyList";
	}
	
	@RequestMapping("rInsert")
	public String rInsert (FAQReply faqr) {
		frs.insert(faqr);
		return "redirect:/FAQReplyList/fno/"+faqr.getFno();
	}
	
	@RequestMapping("rDelete")
	public String rDelete(FAQReply faqr) {
		frs.delete(faqr.getRno());
		return "redirect:/FAQReplyList/fno/" + faqr.getFno();
	}
	
	@RequestMapping("rUpdate")
	public String rUpdate(FAQReply faqr) {
		frs.update(faqr);
		return "redirect:/FAQReplyList/fno/"+faqr.getFno();
	}
}
