package www.IBC.co.kr.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import www.IBC.co.kr.model.FAQ;
import www.IBC.co.kr.service.FAQService;
import www.IBC.co.kr.service.PagingBean;


@Controller
public class FAQController {
	
	@Autowired
	private FAQService fs;
	@RequestMapping("/list")
	public String init() {
		return "redirect:/list/pageNum/1";
	}
	
	// 게시글 목록
	@RequestMapping("/list/pageNum/{pageNum}")
	public String list(@PathVariable String pageNum, FAQ faq, Model model) {
		
		int rowPerPage = 10;
		// 페이지가 지정되지 않으면 1페이지를 보여줘라
		if (pageNum==null || pageNum.equals(""))
			pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = fs.getTotal(faq); 
		int startRow = (currentPage - 1)*rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		faq.setStartRow(startRow);
		faq.setEndRow(endRow);
		List<FAQ> list = fs.list(faq);
		PagingBean fb = new PagingBean(currentPage,rowPerPage,total);
		String[] tit = {"작성자","질문","답변","질문+답변"};
		model.addAttribute("tit", tit);
		model.addAttribute("list", list);
		model.addAttribute("faq", faq);
		model.addAttribute("fb", fb);		
		return "list";
	}
	
	// 게시글 입력
	@RequestMapping("/insertForm/no/{no}/pageNum/{pageNum}")
	public String insertFrom(@PathVariable String no,@PathVariable String pageNum, Model model) {
		int fno = 0;
		if(no != null && !no.equals("") && !no.equals("null")) {
			fno = Integer.parseInt(no);
			FAQ faq = fs.select(fno);
		}
		
		model.addAttribute("fno", fno);
		model.addAttribute("pageNum", pageNum);
		return "insertForm";
	}
	// 게시글 입력 성공여부 alert
	@RequestMapping("/insert")
	public String insert(FAQ faq, String pageNum, Model model, HttpServletRequest request) {
		int fno = 0;
		faq.setFno(fno);
		int result = fs.insert(faq);
		// insert.jsp에서 pageNum값이 null로 나와 추가
		
		  if (pageNum==null || pageNum.equals("")) pageNum="1";
		 
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "insert";
	}
	
	// 게시글 상세 내역
	@RequestMapping("/view/fno/{fno}/pageNum/{pageNum}")
	public String view(@PathVariable int fno,@PathVariable String pageNum, Model model) {
		fs.updateReadCount(fno);
		FAQ	faq = fs.select(fno);
		model.addAttribute("faq", faq);
		model.addAttribute("pageNum", pageNum);
		return "view";
	}
	
	// 게시글 수정
	@RequestMapping("/updateForm/fno/{fno}/pageNum/{pageNum}")
	public String updateForm(@PathVariable int fno,@PathVariable String pageNum, Model model) {
		FAQ faq = fs.select(fno);
		model.addAttribute("faq", faq);
		model.addAttribute("pageNum", pageNum);
		return "updateForm";
	}
	
	// 게시글 수정 성공여부 alert
	@RequestMapping("/update")
	public String update (FAQ faq, String pageNum, Model model) {
		int result = fs.update(faq);
		model.addAttribute("result", result);
		model.addAttribute("faq", faq);
		model.addAttribute("pageNum", pageNum);
		return "update";
	}
	
	/*
	 * // 게시글 삭제
	 * 
	 * @RequestMapping("/deleteForm/fno/{fno}/pageNum/{pageNum}") public String
	 * deleteForm(@PathVariable int fno,@PathVariable String pageNum, Model model) {
	 * FAQ faq = fs.select(fno); model.addAttribute("faq", faq);
	 * model.addAttribute("pageNum", pageNum); return "deleteForm"; }
	 */
	// 게시글 삭제 및 성공여부 alert
	@RequestMapping("/delete/fno/{fno}/pageNum/{pageNum}")
	public String delete(@PathVariable int fno,@PathVariable String pageNum, Model model) {
		int result = fs.delete(fno);
		model.addAttribute("result", result);
		model.addAttribute("pageNum", pageNum);
		return "delete";
	}
	
	// 임의 데이터 입력
	@RequestMapping("insertFAQ")
	public String insertFAQ(HttpServletRequest request) {
		String ip = request.getLocalAddr();
		for (int i =1; i <= 230; i++ ) {
			FAQ faq = new FAQ();
			faq.setQuestion("test 질문"+i);
			faq.setAdmin_id("admin 관리자"+ i);
			faq.setAnswer("test 답변"+i);
			
			fs.insert(faq);
		}
		return "insertFAQ";
	}
	
}
