package com.sesoc.cl.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.web.multipart.MultipartFile;

public class FileService {
	//파일을 하드디스크에 저장 (경로는 uploadPath)
	public static String saveFile(MultipartFile upload, String uploadPath) {
		if(upload.isEmpty()) return null;
			File path = new File(uploadPath);
			
			if(!path.isDirectory()) {
				path.mkdirs();
			}
			String originalFile
			= upload.getOriginalFilename();
			String temp = UUID.randomUUID().toString();
			
			String filename;
			String ext;
			String savedFilename;
			int lastIndex = originalFile.lastIndexOf(".");
			filename = originalFile.substring(0,lastIndex);
			if(lastIndex == -1) {
				ext = "";
				savedFilename = filename + "_" + temp;
			} else {
				ext = originalFile.substring(lastIndex+1);
				savedFilename = filename + "_" + temp + "." + ext;
			}
			
			
			File serverFile = null;
			serverFile = new File(uploadPath + "/" + savedFilename);
			try {
				upload.transferTo(serverFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return savedFilename;
	}
	
	//아이디 이름으로 파일을 하드디스크에 저장 (경로는 uploadPath)
		public static String originalSaveFile(MultipartFile upload, String uploadPath, String id) {
			if(upload.isEmpty()) return null;
				File path = new File(uploadPath);
				
				if(!path.isDirectory()) {
					path.mkdirs();
				}
				String originalFile
				= upload.getOriginalFilename();
				
				String ext;
				String savedFilename;
				int lastIndex = originalFile.lastIndexOf(".");
				if(lastIndex == -1) {
					ext = "";
					savedFilename = id;
				} else {
					ext = originalFile.substring(lastIndex+1);
					savedFilename = id + "." + ext;
				}
				
				File serverFile = null;
				serverFile = new File(uploadPath + "/" + savedFilename);
				try {
					upload.transferTo(serverFile);
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return savedFilename;
		}
		
		//default 이미지 저장
		public static String defaultSaveFile(String uploadPath, String id) {
			File path = new File(uploadPath);
			if(!path.isDirectory()) {
				path.mkdirs();
			}
			String defaultPath = uploadPath + "/" + id + ".jpg";
			URL url;
			try {
				url = new URL("https://www.drupal.org/files/profile_default.jpg");
				BufferedImage img = ImageIO.read(url);
				File file = new File(defaultPath);
				ImageIO.write(img, "jpg", file);
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String originalName = id +".jpg";
			return originalName;
		}
		
		
	//파일 삭제
	public static boolean deleteFile(String fullPath){
		boolean result = false;
		
		System.out.println("풀패스 "+fullPath);
		
		File delFile = new File(fullPath);
		if(delFile.isFile()){
			delFile.delete();
			result = true;
		}
		return result;
	}
}
