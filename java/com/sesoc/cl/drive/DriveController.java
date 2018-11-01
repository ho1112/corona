package com.sesoc.cl.drive;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.cl.board.Board;
import com.sesoc.cl.board.Board_File;
import com.sesoc.cl.board.PageNavigator;
import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.UsersRepository;
import com.sesoc.cl.util.FileService;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Users;


/**
 * Handles requests for the application home page.
 */
@Controller
public class DriveController {
	@Autowired
	DriveRepository repo;
	
	@Autowired
	UsersRepository ur;
	
	final String uploadPath = "/drivefile";
	
	@Autowired
	ClassRepository cRepo;
	
	@RequestMapping(value="driveList")
	public String driveList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchtype", defaultValue="title") String searchtype,
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="countpage", defaultValue="9") int countPerPage,
			Model model, HttpServletRequest request, int classNum){
		this.listCome(model, request);
		//전체 자료실 게시글 수 가져오기
		int totalRecordCount= repo.getDriveCount(searchtype,searchword, classNum);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		List<Drive> drivelist = repo.selectDriveAll(searchtype,searchword,navi.getStartRecord(),navi.getCountPerPage(),classNum);
		
		//해당 페이지 게시글의 첨부파일 리스트 생성
		List<List<Drive_File>> dfList = new ArrayList<>();
		List<Drive_File> onelist = new ArrayList<>();
		for(Drive d :drivelist){
			onelist = repo.selectDrive_fileAll(d.getNum());
			dfList.add(onelist);
		}
		
		model.addAttribute("navi",navi);
		model.addAttribute("classNum",classNum);
		model.addAttribute("countPerPage",countPerPage);
		model.addAttribute("searchword",searchword);
		model.addAttribute("searchtype",searchtype);
		model.addAttribute("driveList", drivelist);
		model.addAttribute("dfList",dfList);
		return "driveList";
	}
	
	//업로드 폼으로 이동
	@RequestMapping(value = "driveWrite", method = RequestMethod.GET)
	public String uploadForm(Model model, HttpServletRequest request, int classNum) {
		this.listCome(model, request);
		model.addAttribute("classNum",classNum);
		return "driveWrite";
	}

	//업로드폼에서 등록버튼을 누르면
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(Model model,HttpServletRequest request, MultipartFile file1, MultiFiles multiFiles, HttpSession session, 
			String title, String content,int classNum) {
		this.listCome(model, request);
		int seq = repo.seq();
		String user_id = (String) session.getAttribute("loginId");
		Drive drive =  new Drive(seq, classNum, user_id , title, content, "", "", "", 0);
		int i = repo.insert(drive); //드라이브DB
		System.out.println("업로드 : "+drive);
		//파일 다중 첨부시  for문으로 돌려서 insert 저장
		if(i == 1 && file1 != null){
			Drive_File df = new Drive_File(0,"","",seq,0);
			for(MultipartFile file : multiFiles.getFile1()) {
				String originalName = file.getOriginalFilename();
				String savedFileName = FileService.saveFile(file, uploadPath);
				df.setOriginal_filename(originalName);
				df.setSaved_filename(savedFileName);
				System.out.println("드라이브 파일 "+df);
				repo.insert_file(df);
			}//for
		}
		model.addAttribute("classNum",classNum);
		return "redirect:driveList";
	}
	
	
	//수정 폼으로 이동
	@RequestMapping(value = "driveUpdateForm", method = RequestMethod.GET)
	public String updateForm(int num, Model model, HttpServletRequest request, int classNum) {
		this.listCome(model, request);
		System.out.println("업뎃 폼 이동 : "+classNum);
		Drive drive = repo.selectOne(num);
		List<Drive_File> list = repo.selectDrive_fileAll(drive.getNum());
		model.addAttribute("drive", drive);
		model.addAttribute("list", list);
		model.addAttribute("classNum",classNum);
		return "driveUpdate";
	}
	
	//수정
	@RequestMapping(value = "driveUpdate", method = RequestMethod.POST)
	public String update(Model model, HttpServletRequest request, MultiFiles multifiles, MultipartFile file1, String user_id, String title, String content,
			int num, CheckOriginalFileNames fileNames,int classNum) {
		this.listCome(model, request);
		Drive drive = repo.selectOne(num);
		drive.setTitle(title);
		drive.setContent(content);
		repo.updateOne(drive);
		System.out.println("업뎃 컨트롤러"+drive);
		//게시판 num과 같은 drive_file리스트를 가져옴
		List<Drive_File> list = repo.selectDrive_fileAll(num);
		
		//삭제 처리 
		if(fileNames.getOriginal_filename() != null){
			for(Drive_File driveFile : list) {
				int check = 0; //스위치
				String originalSavedFile = driveFile.getOriginal_filename();
				for(String original_filename : fileNames.getOriginal_filename()) {
					if(originalSavedFile.equals(original_filename)) {
						//첨부된 파일 이름과 DB에 저장된 이름을 검사해서 같으면 스위치 걸어줌
						check = 1;
					}
				}
				if(check == 0) {
					//첨부된 파일이름이 DB안에 없을경우 기존파일을 일단 삭제
					FileService.deleteFile(uploadPath+"/"+driveFile.getSaved_filename());
					repo.deleteFile(driveFile.getNum());
				}
			}
		}
		
		//파일이름 null로 넘어오면
		if(fileNames.getOriginal_filename() == null){
			//기존 파일 전부 다 삭제
			for(Drive_File driveFile : list) {
				FileService.deleteFile(uploadPath+"/"+driveFile.getSaved_filename());
				repo.deleteFile(driveFile.getNum());
			}
		}
		
		//수정 처리
		if(!(file1 == null)){
			//삽입 처리와 같은 방식으로 수정 처리 시작
			Drive_File df = new Drive_File(0,"","",drive.getNum(),0);
			for(MultipartFile file : multifiles.getFile1()) {
				String originalName = file.getOriginalFilename();
				String savedFileName = FileService.saveFile(file, uploadPath);
				df.setOriginal_filename(originalName);
				df.setSaved_filename(savedFileName);
				repo.insert_file(df);
			}
		}
		model.addAttribute("classNum",classNum);
		return "redirect:driveList";
	}
	
	//삭제
	@RequestMapping(value = "driveDelete", method = RequestMethod.GET)
	public String delete(Model model, HttpServletRequest request, MultiFiles multifiles, MultipartFile file1, String user_id, String title, String content,
			int num, CheckOriginalFileNames fileNames, int classNum) {
		this.listCome(model, request);
		//게시판 num과 같은 drive_file리스트를 가져옴
		List<Drive_File> list = repo.selectDrive_fileAll(num);
		
		//삭제 처리
		for(Drive_File driveFile : list) {
			FileService.deleteFile(uploadPath+"/"+driveFile.getSaved_filename());
			repo.deleteFile(driveFile.getNum());
		}
		//게시글 삭제
		repo.delete_drive(num);
		model.addAttribute("classNum",classNum);
		return "redirect:driveList";
	}
	
	
	//게시판 글 자세히 보기
	@RequestMapping(value="driveDetail", method = RequestMethod.GET)
	public String driveDetailForm(int num, Model model, HttpServletRequest request,int classNum) {
		this.listCome(model, request);
		repo.updateHit(num);
		Drive drive = repo.selectOne(num);
		List<Drive_File> list = repo.selectDrive_fileAll(drive.getNum());
		//작성자의 프로필 사진 가져오기
		String id = drive.getUser_id();
		Users u = new Users();
		u.setId(id);
		u =ur.selectOne(u);
		String userImg = u.getImg_name();
				
		model.addAttribute("userImg",userImg);
		model.addAttribute("drive", drive);
		model.addAttribute("list", list);
		model.addAttribute("classNum",classNum);
		return "driveDetail";
	}
	
	//다운로드 로직
	@RequestMapping(value="download", method=RequestMethod.GET)
	public String download(int num, HttpServletResponse response){
		
		Drive_File fileDrive = repo.selectFileOne(num);
		//다운로드 수 갱신
		repo.updateDownCount(num);
		
		String original_fileName = fileDrive.getOriginal_filename();
		String saved_fileName = fileDrive.getSaved_filename();
		try {
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(original_fileName, "UTF-8"));
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + saved_fileName;
		//파일 가져오기
		FileInputStream filein = null;
		//브라우저로 내보내기
		ServletOutputStream sout = null;
		try {
			filein = new FileInputStream(fullPath);
			sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		String img_name = (String)session.getAttribute("userImg");
		model.addAttribute("img_name", img_name);
		model.addAttribute("id", id);
		List<ClassInfo> myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
