package com.sesoc.cl.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.board.PageNavigator;
import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.PassedLessonRepository;
import com.sesoc.cl.forLessonSave.UnZip;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.SavedLessonInfo;

@Controller
public class PassedLessonController {
	@Autowired
	ClassRepository cRepo;
	@Autowired
	PassedLessonRepository pRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);
	
	@RequestMapping(value="passedLessonList", method=RequestMethod.GET)
	public String passedLessonList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="countpage", defaultValue="6") int countPerPage,
			@RequestParam(value="classNum", required=false)int classNum, 
			Model model, HttpServletRequest request) 
	{
		//전체 글 개수
		int totalRecordCount = pRepo.getPassedLessonCount(searchword,classNum);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		//조건에 해당하는 리스트 불러오기
		List<SavedLessonInfo> savedLessonInfos = pRepo.loadSavedLesson(searchword,navi.getStartRecord(),navi.getCountPerPage(),classNum);
		//		logger.info(savedLessonInfos.toString());
		
		listCome(model, request);
		
		System.out.println("countPerPage : "+countPerPage+" searchword : "+searchword);
		model.addAttribute("navi",navi);
		model.addAttribute("searchword",searchword);
		model.addAttribute("countPerPage",countPerPage);
		model.addAttribute("classNum", classNum);
		model.addAttribute("savedLessonInfos", savedLessonInfos);
		return "lesson/passedLessonList";
	}
	
	//디테일
	@RequestMapping(value="loadPassedLesson", method=RequestMethod.POST)
	public String loadPassedLesson(
			int class_Num,
			SavedLessonInfo savedLessonInfo,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		model.addAttribute("classNum", class_Num);
		model.addAttribute("savedLessonInfo", savedLessonInfo);
		
		logger.info("classNum : " + class_Num);
		logger.info("savedLessonInfo : " + savedLessonInfo);
		
		return "lesson/passedLessonPlay";
	}

	
	@ResponseBody
	@RequestMapping(value = "/unzipText", method = RequestMethod.POST)
	public int unzipText(String saved_code) {
//		logger.info("unzipText");
		int result = 0;
		
		UnZip zip = new UnZip(saved_code);
		result = zip.start();
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteText", method = RequestMethod.POST)
	public void deleteText(String saved_code) {
//		logger.info("deleteText");
		UnZip zip = new UnZip(saved_code);
		zip.delete();
	}

	@RequestMapping(value = "/audioPlay", method = RequestMethod.GET)
	public String audioPlay(HttpServletResponse response, String saved_audio) {
		try {
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(saved_audio, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String sourceDir = "C:\\CoronaSaveFolder\\passed_lesson\\audio";
		String fullPath = sourceDir + "\\" + saved_audio;
		File file = new File(fullPath);
		try {
			response.setContentType("audio/mpeg");
			response.setHeader("Accept-Ranges", "bytes");
			response.setHeader("Content-Range", "bytes " + 0 + "-" + (file.length()-1) + "/" + file.length());
			response.setContentLength((int)file.length());
			
			FileInputStream filein = new FileInputStream(file);
			ServletOutputStream sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@RequestMapping(value = "/captionPlay", method = RequestMethod.GET)
	public String captionPlay(HttpServletResponse response, String saved_code) {
//		logger.info("captionPlay");
		try {
			response.setHeader("Content-Disposition",
					"attachment; filename=" + URLEncoder.encode(saved_code, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String sourceDir = "C:\\CoronaSaveFolder\\passed_lesson\\text";
		String rawFileName = saved_code.substring(0, saved_code.lastIndexOf("."));
		String fullPath = sourceDir + "\\" + rawFileName + ".vtt";
		
		try {
			FileInputStream filein = new FileInputStream(fullPath);
			ServletOutputStream sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}