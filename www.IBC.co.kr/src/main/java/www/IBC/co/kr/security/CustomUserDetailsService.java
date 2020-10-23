package www.IBC.co.kr.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import lombok.Setter;
import www.IBC.co.kr.domain.MemberVO;
import www.IBC.co.kr.mapper.MemberMapper;
import www.IBC.co.kr.security.domain.CustomUser;

public class CustomUserDetailsService implements UserDetailsService {
	
	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		
		// userName means userid
		MemberVO vo = memberMapper.read(userName);
		return vo == null ? null: new CustomUser(vo);
	}

}
