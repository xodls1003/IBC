package www.IBC.co.kr.domain;

import java.util.Date;

import lombok.Data;

@Data
public class InstitutionInfoVO {
	
	private Long  ino;
	private String iname;
	private String ilogo;
	private String iaddress;
	private String iphonenum;
	private String iintro;
	private Date iregdate;
	private String ievaluation;
	private String ihomepage;
	private String iestablishment;
	

}
