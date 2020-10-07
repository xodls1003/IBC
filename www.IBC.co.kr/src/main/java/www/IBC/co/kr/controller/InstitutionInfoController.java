package www.IBC.co.kr.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.InstitutionInfoPage;
import www.IBC.co.kr.service.InstitutionInfoService;

@Controller
@RequestMapping("/www.IBC.co.kr/InstitutionInfo/*")
@Log4j
public class InstitutionInfoController {
	
	 @Setter(onMethod_ =  @Autowired)
	 public InstitutionInfoService service;
	 
	 @RequestMapping("/filter")
	 public String  InstitutionInfoFilter(@RequestParam(defaultValue = "1") int currentPage,Model model) {
		 InstitutionInfoPage page = new InstitutionInfoPage(service.listCount(), currentPage);
		 //전체 학원 리스트
		 model.addAttribute("list",  service.list(currentPage, 8));
		 return "/InstitutionInfo/home";
	 }
	 
	 
	 
	 
	 
	 

}
