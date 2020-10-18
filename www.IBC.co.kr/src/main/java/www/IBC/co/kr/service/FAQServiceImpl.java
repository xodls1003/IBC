package www.IBC.co.kr.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import www.IBC.co.kr.domain.FAQDao;
import www.IBC.co.kr.model.FAQ;



@Service
public class FAQServiceImpl implements FAQService{
	
	@Autowired
	private FAQDao fd;

	/*
	 * public List<FAQ> list(int startRow, int endRow) { return fd.list(startRow,
	 * endRow); }
	 */

	public FAQ select(int fno) {
		return fd.select(fno);
	}

	public int insert(FAQ faq) {
		return fd.insert(faq);
	}

	public int getTotal(FAQ faq) {
		return fd.getTotal(faq);
	}

	/*
	 * public int maxNum() { return fd.maxNum(); }
	 */

	public void updateReadCount(int fno) {
		fd.updateReadCount(fno);
	}

	public int update(FAQ faq) {
		return fd.update(faq);
	}

	public int delete(int fno) {
		return fd.delete(fno);
	}

	public List<FAQ> list(FAQ faq) {
		return fd.list(faq);
	}

}
