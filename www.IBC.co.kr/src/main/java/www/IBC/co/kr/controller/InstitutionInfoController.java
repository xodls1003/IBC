package www.IBC.co.kr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.InstitutionInfoPage;
import www.IBC.co.kr.domain.InstitutionInfoVO;
import www.IBC.co.kr.service.InstitutionInfoService;

@Controller
@RequestMapping("/www.IBC.co.kr/InstitutionInfo/*")
@Log4j
public class InstitutionInfoController {
	
	 @Setter(onMethod_ =  @Autowired)
	 public InstitutionInfoService service;
	 
	 @GetMapping("/filter")
	 public String  InstitutionInfoFilter(@RequestParam(defaultValue = "1") int currentPage,Model model) {
		 InstitutionInfoPage page = new InstitutionInfoPage(service.listCount(), currentPage);
		 //전체 학원 리스트 (12개만)
		 int amount = 16;
		 model.addAttribute("list",  service.list(currentPage, amount));
		 model.addAttribute("page", page);
		 model.addAttribute("amount", amount);
		 return "/InstitutionInfo/home";
	 }
	 
	 @PostMapping(value = "/filter/{currentPage}",produces = {MediaType.TEXT_PLAIN_VALUE})
	 public @ResponseBody List<InstitutionInfoVO> filterAjax(@PathVariable("currentPage") int currentPage ) {
		 int amount = 16;
		 return service.list(currentPage, amount);
	 }
	 
	 
	 
	 
	 
	 

}
