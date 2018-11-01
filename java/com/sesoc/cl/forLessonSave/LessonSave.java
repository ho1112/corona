package com.sesoc.cl.forLessonSave;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.json.simple.JSONObject;

public class LessonSave {

	private long rawStartTime;
	private boolean firstOfFile = true;
	private String prevJsonCode;
	
	private Map<String, Object> lectureData;
	
	private String savedFileName;
	private String directory = "C:\\CoronaSaveFolder\\passed_lesson\\text";
	
	private String zipName;
	private String fileName;

	public LessonSave(String savedFileName, long startTime) {
		this.savedFileName = savedFileName;
		rawStartTime = startTime;
		lectureData = new HashMap<>();
	}

	// 이클립스 실행시 파일 저장
	public boolean initSaveFile() {
		boolean result = false;
		
		zipName = directory + "\\" + savedFileName + ".zip";
		fileName = directory + "\\" + savedFileName + ".vtt";
		
		File pathFile = new File(directory);
		if (!(pathFile.isDirectory())) pathFile.mkdirs();
		
		
		String txt = "﻿WEBVTT\r\n" + "\r\n";
		
		File file = new File(fileName);
		if (!(file.exists())) trueFile(txt, false);
		
		result = true;
		return result;
	}


	/**
	 * 자막 저장 코드 part = 각 파트별 이름으로 저장 status = input : 재생중, end면 종료
	 */
	@SuppressWarnings("unchecked")
	public boolean savePart(String partName, Object part) {
//		System.out.println("part: " + part);
		boolean result = false;
		
		String nowTime = captionTime(rawStartTime);
//		System.out.println("startTime: " + startTime);
		
		boolean endOfFile = false;
//		System.out.println("part: " + part);
		switch (partName) {
		case "initProjectExplorer":
			lectureData.put("projectExplorer", part);
			return true;
		
		case "initActivedEditor":
		case "activatedEditorChange":
			Map<String, String> activedEditor = (Map<String, String>) part;
			lectureData.put("nowPath", activedEditor.get("path"));
			lectureData.put("nowCode", activedEditor.get("code"));
			break;
			
		case "projectChange":
		case "projectDelete":
		case "projectAdd":
			lectureData.put("projectExplorer", part);
			break;
			
		case "codeChange":
			lectureData.put("nowCode", part);
			break;
			
		case "consoleChange":
			lectureData.put("changedConsole", part);
			break;
			
		case "chatMessage":
			lectureData.put("chatMessage", part);
			break;
			
		case "":
			endOfFile = true;
			break;
		}
		
		String jsonCode = JSONObject.toJSONString(lectureData);
		result = writeFile(jsonCode, nowTime, endOfFile);
		
		return result;
	}
	
	/**
	 * 자막 시간 계산 메소드 00:00:00:000
	 */
	public String captionTime(long rawStartTime) {
		long nowTime = System.currentTimeMillis();
		long lessonTime = nowTime - rawStartTime;
		Long chenge = new Long(lessonTime);
		String chenge2 = chenge.toString();
		
		if(firstOfFile || chenge2.length() < 3) {
			return "00:00:00.000";
		} else {
			String stringMiliSecond = chenge2.substring(chenge2.length() - 3, chenge2.length());
			String stringTime = chenge2.substring(0, chenge2.length() - 3);
			if (stringTime.isEmpty()) {
				stringTime = "0";
			}
			long resultTime = Long.parseLong(stringTime);
			String hour = String.format("%02d", (int) resultTime / 3600);
			String minute = String.format("%02d", (int) resultTime % 3600 / 60);
			String second = String.format("%02d", (int) resultTime % 3600 % 60);
			String startTime = hour + ":" + minute + ":" + second + "." + stringMiliSecond;
			return startTime;
		}
	}
	
	/**
	 * 강의 현재 상황 파일에 저장
	 * @param jsonCode
	 * @param nowTime
	 * @param endOfFile
	 * @return
	 */
	public boolean writeFile(String jsonCode, String nowTime, boolean endOfFile) {
		boolean result = false;
		
		String txt;
		if(firstOfFile) {
			txt = nowTime + " --> ";
			prevJsonCode = jsonCode;
			firstOfFile = false;
		} else {
			if(endOfFile) {
				txt = nowTime + "\r\n" + prevJsonCode;
				System.out.println("파일 끝");
			} else {
				txt = nowTime + "\r\n" + prevJsonCode + "\r\n" + "\r\n" + nowTime + " --> ";
				prevJsonCode = jsonCode;
			}
		}
		result = trueFile(txt, endOfFile);
		
		return result;
	}
	
	// 파일 생성 코드
	public boolean trueFile(String txt, boolean endOfFile) {
		boolean result = false;
		
		try {
			BufferedWriter bw = new BufferedWriter(new FileWriter(fileName, true));
			// 파일 안에 문자열 쓰기
			bw.write(txt);
			// 이어서 덮어씨우기
			bw.flush();
			// 파일 만들기 종료
			bw.close();
			if (endOfFile) zipInput();
			result = true;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// 파일 압축 프로그램
	public void zipInput() {
		Path safety = new File(fileName).toPath();
		ZipEntry zipEntry = new ZipEntry(safety.getFileName().toString());
		try {
			FileOutputStream fos = new FileOutputStream(new File(zipName));
			ZipOutputStream zop = new ZipOutputStream(fos);
			FileInputStream fis = new FileInputStream(new File(fileName));
			zop.putNextEntry(zipEntry);
			byte[] buffer = new byte[1024];
			int len = -1;
			while ((len = fis.read(buffer, 0, 1024)) != -1) {
				zop.write(buffer, 0, len);
			}

			// 객체 닫기
			if (zop != null) {
				zop.closeEntry();
				zop.close();
			}
			if (fos != null)
				fos.close();
			if (fis != null)
				fis.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		File deleteFile = new File(fileName);
		if (deleteFile.isFile()) deleteFile.delete();
	}
}