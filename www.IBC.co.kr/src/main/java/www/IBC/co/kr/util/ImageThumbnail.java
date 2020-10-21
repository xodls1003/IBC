package www.IBC.co.kr.util;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.MultipartFile;


import lombok.Setter;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import www.IBC.co.kr.domain.InstitutionInfoVO;
import www.IBC.co.kr.service.InstitutionInfoService;

@Log4j
public class ImageThumbnail {

	MultipartFile ilogo;

	@Setter(onMethod_ = @Autowired)
	public InstitutionInfoService service;

	public ImageThumbnail(MultipartFile ilogo, InstitutionInfoVO vo) {
		this.ilogo = ilogo;

		String uploadFileName = "";
		String uploadFoler = "C:\\upload";

		log.info("-------------------------------");
		log.info("upload file name : " + ilogo.getOriginalFilename());
		log.info("upload file size :" + ilogo.getSize());

		// 증복방지를 위한 UUID적용
		UUID uuid = UUID.randomUUID();

		uploadFileName = ilogo.getOriginalFilename();

		// 파일이름에 UUID 추가
		uploadFileName = uuid.toString() + "_" + uploadFileName;
		File saveFile = new File(uploadFoler, uploadFileName);

		try {
			ilogo.transferTo(saveFile);
			if (checkImageType(saveFile)) {
				FileOutputStream thumnail = new FileOutputStream(new File(uploadFoler, "image_" + uploadFileName));
				Thumbnailator.createThumbnail(ilogo.getInputStream(), thumnail, 160, 160);
				// vo에 이미지 이름 추가
				vo.setIlogo("image_" + uploadFileName);

				thumnail.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 이미지인지 확인 메소드
	public boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

}