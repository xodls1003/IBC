package www.IBC.co.kr.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Setter;
import www.IBC.co.kr.domain.InstitutionInfoVO;
import www.IBC.co.kr.service.InstitutionInfoService;

@Controller
@RequestMapping("/check/*")
public class CheckController {

	@Setter(onMethod_ = @Autowired)
	public InstitutionInfoService infoservice;

	// 학원등록 - 학원이름 중복확인 체크
	@RequestMapping(value = "/iname/{iname}", method = RequestMethod.POST)
	public ResponseEntity<String> inameCheck(@PathVariable("iname") String iname) {
		InstitutionInfoVO vo = infoservice.info(iname);

		if (vo == null) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>("fail", HttpStatus.OK);
		}
	}

	// 검색 - 학원이름
	@GetMapping(value = "/searchIname/{searchIname}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<InstitutionInfoVO>> searchInameCheck(@PathVariable("searchIname") String searchIname) {
		return new ResponseEntity<>(infoservice.searchInameInfo(searchIname), HttpStatus.OK);

	}


	// 필터 - 지역과 과목
		@RequestMapping(value = "/searchInfo", method = RequestMethod.POST, consumes = "application/json", produces = {
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public ResponseEntity<List<InstitutionInfoVO>> searcIareaInfoCheck(
				@RequestBody(required = false) String area,@RequestBody(required = false) String subject) {
			
			System.out.println("지역:" + area);
			System.out.println("과목:" +subject);
			if(area != null && subject == null) {
				return new ResponseEntity<>(infoservice.searcIareaInfo(area), HttpStatus.OK);
			}else if(subject != null && area == null) {
				return new ResponseEntity<>(infoservice.searcIsubjectInfo(subject), HttpStatus.OK);
			}
			return null;
		}
		
		
		@RequestMapping(value = "/searchInfo2", method = RequestMethod.POST, consumes = "application/json", produces = {
				MediaType.APPLICATION_JSON_UTF8_VALUE })
		public void searcIareaInfoCheck2(
				@RequestBody String subject, @RequestBody String area) {
			
			System.out.println("1:"+subject);
			
		}



}