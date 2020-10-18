package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.IBC.co.kr.domain.FAQReplyDao;
import www.IBC.co.kr.model.FAQReply;

@Service
public class FAQReplyServiceImpl implements FAQReplyService {
	
	@Autowired
	private FAQReplyDao frd;

	public List<FAQReply> list(int fno) {
		return frd.list(fno);
	}

	public void insert(FAQReply faqr) {
		frd.insert(faqr);
		
	}

	public void delete(int rno) {
		frd.delete(rno);
	}

	public void update(FAQReply faqr) {
		frd.update(faqr);
	}

}
