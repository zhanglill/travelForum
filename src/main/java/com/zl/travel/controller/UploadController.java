package com.zl.travel.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zl.travel.util.ImageUpload;


@Controller
@RequestMapping("/imageUpload")
@ResponseBody
public class UploadController {

		/**
	     * ckeditor图片上传
	     * 
	     * @Title imageUpload
	     * @param request
	     * @param response
	     */
	    @RequestMapping("/imageUpload")
	    @ResponseBody
	    public void imageUpload(HttpServletRequest request, HttpServletResponse response) {
	        String DirectoryName = "upload";
	        try {
	            ImageUpload.ckeditor(request, response, DirectoryName);
	        } catch (IllegalStateException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }

}
