package www.IBC.co.kr.service;

import java.util.List;

import www.IBC.co.kr.model.FAQReply;

public interface FAQReplyService {

	List<FAQReply> list(int fno);

	void insert(FAQReply faqr);

	void delete(int rno);

	void update(FAQReply faqr);

}
