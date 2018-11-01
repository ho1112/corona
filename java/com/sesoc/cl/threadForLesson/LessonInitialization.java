package com.sesoc.cl.threadForLesson;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sesoc.cl.forAudioCapture.AudioRecordThread;
import com.sesoc.cl.forLessonSave.LessonSave;

/**
 * 클래스 Thread의 초기화 메소드를 모아논 클래스
 * @author LSY
 */
public class LessonInitialization {
	
	public String getSavedFileName(String classNum) {
		String result = null;
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd-hh_mm_ss");
		String nowTime = dateFormat.format(cal.getTime());
		result = classNum + "-" + nowTime;
		
		return result;
	}
	
	/**
	 * Eclipse와의 Stream이 잘 구축되었는지 확인을 위해 Eclipse에 성공 메세지 전달
	 * @param oos 
	 * @return Eclipse에 메세지 전송에 성공하면 true, 아니면 false
	 */
	public void initStreamCheck(ObjectOutputStream oos) {
		try {
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("initResult", "success");
			oos.writeObject(sendMapToEclipse);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public AudioRecordThread startAudioRecord(ObjectOutputStream oos, String savedFileName) {
		
		AudioRecordThread recordThread = new AudioRecordThread(savedFileName);
		new Thread(recordThread).start();
		
		try {
			System.out.println("2번째소켓 생성 요청");
			Map<String, Object> sendMapToEclipse = new HashMap<>();
			sendMapToEclipse.put("checkSocket", "openSocket");
			oos.writeObject(sendMapToEclipse);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return recordThread;
	}
	
	
	/**
	 * Eclipse연결 시 Project Explorer의 정보를 로딩 
	 * @param lessonSave 
	 * @param currentLessonPage 
	 * @param ois 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public void getInitProjectExplorer(ObjectInputStream ois, CurrentLessonPage currentLessonPage, LessonSave lessonSave) {
		try {
//			System.out.println("initProjectExplorer");
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initProjectExplorer":
				List<List<Map<String, Map<String, String>>>> projectExplorerList = (List<List<Map<String, Map<String, String>>>>)receiveMapFromEclipse.get("list");
				currentLessonPage.setProjectExplorerList(projectExplorerList);
				lessonSave.savePart("initProjectExplorer", projectExplorerList);
				break;
			}
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
//		System.out.println("End");
	}
	
	/**
	 * Eclipse연결 시 활성화 되어 있는 Editor의 정보를 로딩 
	 * @return Eclipse로 부터 정보를 받아서 CurrentLessonPage객체에 저장을 완료했으면 true, 실패하면 false
	 */
	@SuppressWarnings("unchecked")
	public void getInitActivedEditor(ObjectInputStream ois, CurrentLessonPage currentLessonPage, LessonSave lessonSave) {
		try {
//			System.out.println("InitActivedEditor");
			Map<String, Object> receiveMapFromEclipse = (Map<String, Object>)ois.readObject();
			String action = (String)receiveMapFromEclipse.get("action");
			switch(action) {
			case "initActivatedEditor":
				String path = (String) receiveMapFromEclipse.get("path");
				String code = (String) receiveMapFromEclipse.get("code");
				currentLessonPage.setNowPath(path);
				currentLessonPage.setNowCode(code);
				Map<String, String> tempMap = new HashMap<>();
				tempMap.put("path", path);
				tempMap.put("code", code);
				lessonSave.savePart("initActivedEditor", tempMap);
//				System.out.println("init activated path : " + path);
//				System.out.println("init activated code : " + code);
				break;
			}
//			System.out.println("End");
		} catch (ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
	}
	
}