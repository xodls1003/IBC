package www.IBC.co.kr.controller;

import java.util.List;

import javax.servlet.annotation.MultipartConfig;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.InstitutionInfoVO;
import www.IBC.co.kr.service.InstitutionInfoService;
import www.IBC.co.kr.util.ImageThumbnail;

@Controller
@RequestMapping("/www.IBC.co.kr/InstitutionInfo/*")
@Log4j
public class InstitutionInfoController {
	
	 @Setter(onMethod_ =  @Autowired)
	 public InstitutionInfoService service;
	 
	 //필터링으로 검색
	 @GetMapping("/filter")
	 public String  InstitutionInfoFilter(Model model) {
		 model.addAttribute("list",  service.list());
		 model.addAttribute("amount", service.listCount());
		 model.addAttribute("bestlist", service.bestList());
		 model.addAttribute("newlist", service.newList());
		 return "/InstitutionInfo/filter";
	 }
	 
	 //이름으로 검색
	 @GetMapping("/name")
	 public String  InstitutionInfoName(Model model) {
		 model.addAttribute("list",  service.list());
		 model.addAttribute("amount", service.listCount());
		 model.addAttribute("bestlist", service.bestList());
		 model.addAttribute("newlist", service.newList());
		 return "/InstitutionInfo/name";
	 }
	 
	 @GetMapping("/reg")
	 public String InstitutionInfoReg() {
		 return "/InstitutionInfo/reg";
	 }
	 
	 @PostMapping("/reg")
	 public String InstitutionInfoRegPost(@RequestParam("iname")String iname,@RequestParam("iaddress")String iaddress,
			 @RequestParam("ihomepage")String ihomepage,@RequestParam("iestablishment")String iestablishment,
			 @RequestParam("isubject")String isubject,@RequestParam("iarea")String iarea,
			 @RequestParam("iintro")String iintro,@RequestParam("iphonenum")String iphonenum,@RequestParam("ilogo") MultipartFile ilogo, Model model) {
		 InstitutionInfoVO vo = new InstitutionInfoVO();
		 vo.setIname(iname);
		 vo.setIaddress(iaddress);
		 vo.setIarea(iarea);
		 vo.setIestablishment(iestablishment);
		 vo.setIhomepage(ihomepage);
		 vo.setIintro(iintro);
		 vo.setIphonenum(iphonenum);
		 vo.setIsubject(isubject);
		 
		 ImageThumbnail thumb = new ImageThumbnail(ilogo, vo);
		 int success = service.registerInfo(vo);
		 
		 if(success == 1 ) {
			 return "redirect:/www.IBC.co.kr/InstitutionInfo/filter";
		 }else {
			 model.addAttribute("fail", "fail");
			 return "/InstitutionInfo/reg";
		 }
		
	 }
	 
	 
	 
	 
	 
	 

}