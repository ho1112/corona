package com.sesoc.cl.util;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.Arrays;

import javax.tools.JavaCompiler;
import javax.tools.JavaFileObject;
import javax.tools.StandardJavaFileManager;
import javax.tools.ToolProvider;

import com.sesoc.cl.vo.Task_Answer;

public class JavaCodeCompiler {

	//Java Compiler 메소드
	public Boolean javaCompile(String filepath) throws IOException {
		System.setProperty("java.home", "C:\\Program Files\\Java\\jdk1.8.0_141\\jre");
        JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
        
        //파일명만 가져올 때
        String fileName_ok = filepath.substring(0,filepath.lastIndexOf("."));

        StandardJavaFileManager fileManager = compiler.getStandardFileManager(null, null, null);
        Iterable<? extends JavaFileObject> compilationUnits = fileManager.getJavaFileObjectsFromStrings(Arrays.asList(filepath));
        //에러를 담을 파일 생성
		File file = new File(fileName_ok+"_error.java");

		//스트림에 연결
		OutputStream os = new FileOutputStream(file);
		
		//출력스트림 라이터를 버퍼에 연결
		BufferedWriter br = new BufferedWriter(new OutputStreamWriter(os));
		
		//첫 번째 파라메터에 해당 버퍼인 br을 넣는 것이 핵심이다. (null로 주면 에러가 파일로 생성되지 않는다.) 
		JavaCompiler.CompilationTask task = compiler.getTask(br, fileManager, null/* diagnostics */, null, null, compilationUnits);
		
		boolean success = task.call();
		
		//버퍼 닫는다.
		br.close();
		
		//에러가 없다면 에러파일 삭제
		if(success) {
			file.delete();
		}
		
		fileManager.close();
//		System.out.println("컴파일 성공여부 : " + success);
		
		return success;
    }
	
	
	//Java Runtime 메소드
	public boolean RuntimeClassFile(String filepath, Task_Answer task_answer) {

		// String command = "javac -d :/Test/classes ";
		
		// command = command + "D:/Test/src/" + className+".java";
		
		boolean result = false;
		
		File file = new File(filepath);
		
		//파일명만 가져올 때
		int index = filepath.lastIndexOf("\\");
		String frontFilepath = filepath.substring(0, index);
		String backFilepath = filepath.substring(index+1, filepath.length());
		String replace_Filepath = frontFilepath + " " + backFilepath;
//		System.out.println("replace_Filepath : " + replace_Filepath);
        String fileName_ok = replace_Filepath.substring(3,filepath.lastIndexOf(".")); //확장자를 뗀다.
//      System.out.println("fileName_ok : " + fileName_ok);
        
		String command = "java -Dfile.encoding=UTF-8 -cp C:\\"+fileName_ok;  //cmd 명령프롬프트 상에서의 runtime 명령어
//		System.out.println("command : " + command);
		
		BufferedReader br = null;
        String line = null;
        
        String outputString = "";
        
		try {
			Process processor = Runtime.getRuntime().exec(command);
			
	        br = new BufferedReader(new InputStreamReader(processor.getInputStream()));
	        
			OutputStream os = processor.getOutputStream();
			OutputStreamWriter osw = new OutputStreamWriter(os);
			BufferedWriter bw = new BufferedWriter(osw);
			
			bw.write(task_answer.getInput_answer()); //여기에 입력값을 넣는다.
			bw.flush();
			bw.close();
	        
	        while((line = br.readLine()) != null) {
//	            System.out.println(line);
	            outputString = line;
	        }
	        byte[] byteValue = outputString.getBytes(System.getProperty("file.encoding"));
	        String convertValue = new String(byteValue);
//	        System.out.println("convertValue : " + convertValue);
//	        System.out.println("outputString : " + outputString);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(br != null) 
				try {
					br.close();
				} catch(Exception e) {
					e.printStackTrace();
				}
		}
		
		if(task_answer.getOutput_answer().equals(outputString)) {
			result = true;
		}
//		System.out.println("result : " + result);
		return result;
	}
}

