package www.IBC.co.kr.domain;

import lombok.Data;

@Data
public class FourmAttachVO {

  private String uuid;
  private String uploadPath;
  private String fileName;
  private boolean fileType;
  
  private Long bno;
  
}
