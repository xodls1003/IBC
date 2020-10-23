package www.IBC.co.kr.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String nickName;
	private String email;
	private String phone;
	private boolean enabled;
	
	private Date regDate;
	private List<AuthVO> authList;
}
