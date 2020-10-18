package www.IBC.co.kr.domain;

import java.util.List;

import www.IBC.co.kr.model.FAQReply;

public interface FAQReplyDao {

	List<FAQReply> list(int fno);

	void insert(FAQReply faqr);

	void delete(int rno);

	void update(FAQReply faqr);

}
