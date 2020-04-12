package com.qst.portal.controller;

import com.qst.common.utils.JsonUtils;
import com.qst.portal.service.PortalPictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController
public class PortalPictureController {

	@Autowired
	private PortalPictureService portalPictureService;
	
	@RequestMapping(value = "/pic/upload", method = RequestMethod.POST)
	public String makeImagesUpload(@RequestParam(value = "imagesFile", required = false) MultipartFile uploadFile,
						HttpServletRequest request){
		Map getResult = portalPictureService.uploadFile(uploadFile,request);
		String result = JsonUtils.objectToJson(getResult);
		return result;
	}
}
