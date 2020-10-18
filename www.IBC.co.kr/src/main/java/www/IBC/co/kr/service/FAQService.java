package www.IBC.co.kr.service;

import java.util.List;

import www.IBC.co.kr.model.FAQ;

public interface FAQService {

//	List<FAQ> list(int startRow, int endRow);

	FAQ select(int fno);

	int insert(FAQ faq);

	int getTotal(FAQ faq);

	/* int maxNum(); */

	void updateReadCount(int fno);

	int update(FAQ faq);

	int delete(int fno);

	List<FAQ> list(FAQ faq);


}
