package com.sesoc.cl.web;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.board.PageNavigator;
import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.TaskRepository;
import com.sesoc.cl.dao.Task_SubmitRepository;
import com.sesoc.cl.util.JavaCodeCompiler;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;
import com.sesoc.cl.vo.Task_Answers;
import com.sesoc.cl.vo.Task_Submit;

@Controller
public class HomeworkController {
	
	@Autowired
	ClassRepository cRepo;
	@Autowired
	TaskRepository tRepo;
	@Autowired
	Task_SubmitRepository sRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	
	private List<ClassInfo> myTeacherList;
	private String rootDirectory = "C:\\CoronaSaveFolder\\task";
	private String taskDirectory = rootDirectory + "\\taskCode";
	private String submitDirectory = rootDirectory + "\\submitCode";
	private String tempDirectory = rootDirectory + "\\tempCode";
	
	@RequestMapping(value="/homeworkList", method=RequestMethod.GET)
	public String homeworkList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="countpage", defaultValue="6") int countPerPage,
			int classNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		//기한 지났으면 다 제출불가 처리 해야한다 여기서!
		int result = tRepo.closed_work();
		if(result != 0) {
//			System.out.println("기한 지난 과제들 제출불가 처리!");
		}
		//전체 글 개수
		int totalRecordCount = tRepo.getTaskCount(searchword,classNum);
		//페이징
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		//과제 목록 불러오기
		List<Task> taskInfoList = tRepo.selectAll(searchword,navi.getStartRecord(),navi.getCountPerPage(),classNum);
//		logger.info(taskInfoList.toString());
		
		String position = "student";
		
		for(ClassInfo i : myTeacherList) {
			if(classNum == i.getNum()) {
				position = "teacher";
				break;
			}
		}
		
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		Task_Submit tempSubmit = new Task_Submit();
		tempSubmit.setUser_id(id);
		List<Task> submittedTasks = tRepo.submittedTask(tempSubmit);
		
		for(Task s : submittedTasks) {
			for(Task t : taskInfoList) {
				if(t.getNum() == s.getNum()) {
					t.setSubmitted(true);
					break;
				}
			}
		}
		
		model.addAttribute("navi",navi);
		model.addAttribute("searchword",searchword);
		model.addAttribute("countPerPage",countPerPage);
		model.addAttribute("taskInfoList", taskInfoList);
		model.addAttribute("classNum", classNum);
		model.addAttribute("position", position);
		return "homework/homeworkList";
	}
	
	
	@RequestMapping(value="/homeworkCreateForm", method=RequestMethod.GET)
	public String homeworkCreateForm(int classNum,
			Model model,
			HttpServletRequest request) 
	{
//		logger.info("createHomework");
		System.out.println("클래스넘 : "+classNum);
		listCome(model, request);
		model.addAttribute("classNum", classNum);
		model.addAttribute("classFileName", getSavedFileName(classNum));
		return "homework/homeworkCreateForm";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/createHomework", method=RequestMethod.POST)
	public int createHomework(
			Task task,
			Task_Answers task_answers,
			Model model,
			HttpServletRequest request) 
	{
		int result = 0;
//		logger.info(task.toString());
//		logger.info(task_answers.getInput_answer().toString());
//		logger.info(task_answers.getOutput_answer().toString());
		
		//파일경로 = 루트+filePath + 파일명 + 확장자(java)
		String filepath = taskDirectory + "\\" + task.getQuestion_file() + ".java";
		File saveDirectory= new File(taskDirectory);
		
		if(!saveDirectory.isDirectory()) {
			saveDirectory.mkdirs();
		}
		
		File file = new File(filepath);
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		
		try {
			//과제를 파일로 저장 //
			fos = new FileOutputStream(file);
			osw = new OutputStreamWriter(fos);
			bw = new BufferedWriter(osw);
			bw.write(task.getCode(), 0, task.getCode().length());
			
			//저장한 파일을 서버DB에 기록
//			task.setQuestion_file(filepath);
//			System.out.println(task.toString());
			result = tRepo.insertTask(task);
			
			if(result != 0) {
				
				result = 0;
				
				//과제가 정상적으로 등록되면 과제의 입 출력 해답도 DB에 등록한다.
				Task recent_task = tRepo.recent_task();
				
				List<String> input_answers = task_answers.getInput_answer();
				List<String> output_answers = task_answers.getOutput_answer();
				
				//혹시모르니 예외처리(입력 값과 출력 값의 수가 같을 때만 동작하게 한다)
				if(input_answers.size() == output_answers.size()) {
					for(int i=0; i<input_answers.size(); i++) {
						Task_Answer task_answer = new Task_Answer(0, recent_task.getNum(), input_answers.get(i), output_answers.get(i));
						int result_answer = tRepo.insertAnswer(task_answer);
						if(result_answer != 0) {
//							logger.info("과제의 입출력 값 저장완료!");
							result = 1;
						} else {
//							logger.info("과제의 입출력 값 저장실패.");
							break;
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bw != null) bw.close();
				if(osw != null) osw.close();
				if(fos != null) fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(result == 0) {
			if(file.isFile()) file.delete();
			tRepo.deleteTask(task);
		}
		return result;
	}
	
	
	@RequestMapping(value="homeworkDetail", method=RequestMethod.GET)
	public String homeworkDetail(int homeworkNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		Task tempTask = new Task();
		tempTask.setNum(homeworkNum);
		tempTask = tRepo.selectOne(tempTask);
//		logger.info(tempTask.toString());
		
		String filepath = taskDirectory + "\\" + tempTask.getQuestion_file() + ".java";
		File file = new File(filepath);
		
		FileReader fr = null;
		BufferedReader br = null;
		String code = "";
		boolean fileReader = true;
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
			while(true) {
				String tempCode = br.readLine();
				if(tempCode == null) {
					break;
				} else {
					code += tempCode + "\n";
				}
			}
			br.close();
			fr.close();
		} catch (FileNotFoundException e) {
			fileReader = false;
			e.printStackTrace();
		} catch (IOException e) {
			fileReader = false;
			e.printStackTrace();
		}
		
		if(!fileReader) {
			model.addAttribute("classNum", tempTask.getClass_num());
			return "redirect:homeworkList";
		}
		
		tempTask.setCode(code);
		model.addAttribute("task", tempTask);
		
//		logger.info(tempTask.toString());
		return "homework/homeworkSubmitForm";
	}
	
	
	@ResponseBody
	@RequestMapping(value="testCode", method=RequestMethod.POST)
	public int testCode(String code, 
			int taskNum, 
			String fileName,
			String userId) 
	{
		int result = 0;
//		logger.info("code : " + code);
//		logger.info("taskNum : " + taskNum);
		
		List<Task_Answer> answers  = tRepo.io_receive(taskNum);
		
		String javaFilepath = tempDirectory + "\\" + userId + "\\" + fileName + ".java";
		String classFilepath = tempDirectory + "\\" + userId + "\\" + fileName + ".class";
		File saveDirectory= new File(tempDirectory + "\\" + userId);
		
		if(!saveDirectory.isDirectory()) {
			saveDirectory.mkdirs();
		}
		
		File javaFile = new File(javaFilepath);
		FileWriter fw = null;
		BufferedWriter bw = null;
		
		try {
//			logger.info(code);
			fw = new FileWriter(javaFile);
			bw = new BufferedWriter(fw);
			bw.write(code);
			bw.flush();
			bw.close();
			fw.close();
//			bw.write(code, 0, code.length());
			
			JavaCodeCompiler jcc = new JavaCodeCompiler();
			Boolean compileResult = jcc.javaCompile(javaFilepath);
			
			if(compileResult) {
				for(Task_Answer a : answers) {
					boolean runResult = jcc.RuntimeClassFile(javaFilepath, a);
					if(runResult) {
						result = 1;
					} else {
						result = 0;
						break;
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(javaFile.exists()) javaFile.delete();
		File classFile = new File(classFilepath);
		if(classFile.exists()) classFile.delete();
		if(saveDirectory.exists()) saveDirectory.delete();
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="submitHomework", method=RequestMethod.POST)
	public int submitHomework(String code, 
			int taskNum,
			String fileName,
			String userId) 
	{
		int result = 0;
		
		String savedFileName = userId + "_" + fileName;
		
		String filepath = submitDirectory + "\\" + savedFileName + ".java";
		File saveDirectory= new File(submitDirectory);
		
		if(!saveDirectory.isDirectory()) {
			saveDirectory.mkdirs();
		}
		
		File file = new File(filepath);
		FileWriter fw = null;
		BufferedWriter bw = null;
		boolean filesaveResult = false;
		
		try {
			fw = new FileWriter(file);
			bw = new BufferedWriter(fw);
			bw.write(code);
			bw.flush();
			bw.close();
			fw.close();
			filesaveResult = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		if(filesaveResult) {
			Task_Submit tempSubmit = new Task_Submit();
			tempSubmit.setTask_num(taskNum);
			tempSubmit.setUser_id(userId);
			tempSubmit.setSubmit_file(savedFileName);
			result = sRepo.insert_Submit(tempSubmit);
		}
		
		return result;
	}
	
	@RequestMapping(value="myhomeworkConfirm", method=RequestMethod.GET)
	public String myhomeworkConfirm(int homeworkNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		
		Task tempTask = new Task();
		tempTask.setNum(homeworkNum);
		tempTask = tRepo.selectOne(tempTask);
		
		Task_Submit tempSubmit = new Task_Submit();
		tempSubmit.setUser_id(id);
		tempSubmit.setTask_num(homeworkNum);
		tempSubmit = sRepo.selectOne(tempSubmit);
		
		String filepath = submitDirectory + "\\" + tempSubmit.getSubmit_file() + ".java";
		File file = new File(filepath);
		
		FileReader fr = null;
		BufferedReader br = null;
		String code = "";
		boolean fileReader = true;
		try {
			fr = new FileReader(file);
			br = new BufferedReader(fr);
			while(true) {
				String tempCode = br.readLine();
				if(tempCode == null) {
					break;
				} else {
					code += tempCode + "\n";
				}
			}
			br.close();
			fr.close();
		} catch (FileNotFoundException e) {
			fileReader = false;
			e.printStackTrace();
		} catch (IOException e) {
			fileReader = false;
			e.printStackTrace();
		}
		
		if(!fileReader) {
			model.addAttribute("classNum", tempTask.getClass_num());
			return "redirect:homeworkList";
		}
		
		tempTask.setCode(code);
		model.addAttribute("task", tempTask);
		
		return "homework/myhomeworkConfirm";
	}
	
	
	@RequestMapping(value="submittedHomeworkConfirm", method=RequestMethod.GET)
	public String submittedHomeworkConfirm(int homeworkNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		Task tempTask = new Task();
		tempTask.setNum(homeworkNum);
		tempTask = tRepo.selectOne(tempTask);
		
		model.addAttribute("task", tempTask);
		return "homework/submittedHomeworkConfirm";
	}
	
	
	@ResponseBody
	@RequestMapping(value="loadSubmittedList", method=RequestMethod.POST)
	public List<Task_Submit> loadSubmittedList(int homeworkNum) {
		
		Task tempTask = new Task();
		tempTask.setNum(homeworkNum);
		List<Task_Submit> tempSubmitList = sRepo.select_submitList(tempTask);
		
		for(Task_Submit s : tempSubmitList) {
			String filepath = submitDirectory + "\\" + s.getSubmit_file() + ".java";
			File file = new File(filepath);
			
			FileReader fr = null;
			BufferedReader br = null;
			String code = "";
			try {
				fr = new FileReader(file);
				br = new BufferedReader(fr);
				while(true) {
					String tempCode = br.readLine();
					if(tempCode == null) {
						break;
					} else {
						code += tempCode + "\n";
					}
				}
				br.close();
				fr.close();
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			s.setSubmit_code(code);
		}
		
		return tempSubmitList;
	}
	
	
	public String getSavedFileName(int classNum) {
		String result = null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
		String nowTime = dateFormat.format(cal.getTime());
		result = "Homework_" + classNum + "_" + nowTime;
		return result;
	}
	
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
