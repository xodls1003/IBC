package www.IBC.co.kr.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;


import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import www.IBC.co.kr.domain.Criteria;
import www.IBC.co.kr.domain.ForumReplyPageDTO;
import www.IBC.co.kr.domain.ForumReplyVO;
import www.IBC.co.kr.service.ForumReplyService;

@RequestMapping("/www.IBC.co.kr/forum/replies/*")
@RestController
@AllArgsConstructor
public class ForumReplyController {
	
	private ForumReplyService service;
	@PostMapping(value="/new",
			consumes ="application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE}
			)
	public ResponseEntity<String> create(@RequestBody ForumReplyVO vo){
		int insertCount = service.register(vo);
		return insertCount == 1
		? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@GetMapping(value="/pages/{fno}/{page}",
			produces= {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ForumReplyPageDTO> getList(
			@PathVariable("page") int page,
			@PathVariable("fno") Long fno){
		Criteria cri = new Criteria(page,10);
		
		return new ResponseEntity<>(service.getListPage(cri, fno),HttpStatus.OK);
	}
	
	@GetMapping(value="/{frno}",
			produces= {
					MediaType.APPLICATION_XML_VALUE , 
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ForumReplyVO> get(@PathVariable("frno") Long frno){
		return new ResponseEntity<>(service.get(frno), HttpStatus.OK);
	}
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
			value="/{frno}",
			consumes="application/json",
			produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("frno") Long frno){
		
		return service.remove(frno) == 1
					? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	@RequestMapping(method = {RequestMethod.PUT, RequestMethod.PATCH },
			value="/{rno}",
			consumes="application/json",
			produces={MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> modify(
					@RequestBody ForumReplyVO vo,
					@PathVariable("rno") Long rno){
		
		vo.setFrno(rno);
	
		
		return service.modify(vo) == 1
					? new ResponseEntity<>("success", HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
}
