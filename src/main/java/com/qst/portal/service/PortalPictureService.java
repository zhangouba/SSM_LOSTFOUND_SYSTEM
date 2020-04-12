package com.qst.portal.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
@Service

public interface PortalPictureService {
	
	//处理图片上传
	Map uploadPicture(MultipartFile uploadFile, HttpServletRequest request);

	Map uploadFile(MultipartFile uploadFile, HttpServletRequest request);
}
