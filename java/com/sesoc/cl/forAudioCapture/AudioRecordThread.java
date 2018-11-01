package com.sesoc.cl.forAudioCapture;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ServerSocket;
import java.net.Socket;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;

public class AudioRecordThread implements Runnable {
	
	private ServerSocket serverSocket = null;
	private int WR_PORT = 8890;
	private Socket socket;
	private InputStream is;

	private boolean stopCapture = false;
	
	private String directory = "C:\\CoronaSaveFolder\\passed_lesson\\audio";
	private String savedFileName;
	
	// 파일 내보내기
	// 녹음된 wav파일과 녹음 후 컨버팅할 mp3파일의 경로설정
	private File tempFile;
	private File wavFile;
	private File result;

	// 오디오파일의 포맷지정
	AudioFileFormat.Type fileType = AudioFileFormat.Type.WAVE;
	
	FileOutputStream fos;

	public AudioRecordThread(String savedFileName) {
		this.savedFileName = savedFileName;
	}

	@Override
	public void run() {
		try {
			serverSocket = new ServerSocket(WR_PORT);
			serverSocket.setReuseAddress(true);
			socket = serverSocket.accept();
			serverSocket.close();
			System.out.println("레코드쓰레드 서버소켓 생성완료");
			is = socket.getInputStream();
			
			captureAudio();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(serverSocket != null) serverSocket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// ButeArrayOutputStream에 마이크로부터 입력받은 오디오 데이터를 저장하는 메소드
	public void captureAudio() {
		File pathFile = new File(directory);
		if (!(pathFile.isDirectory())) pathFile.mkdirs();
		
		tempFile = new File(directory + "\\" + savedFileName + ".dat"); // 소켓으로 받아온 데이터 실시간으로 저장할 임시 dat파일
		wavFile = new File(directory + "\\" + savedFileName + ".wav"); // dat --> wav
		result = new File(directory + "\\" + savedFileName + ".mp3"); // wav파일을 컨버팅한 최종 mp3파일
		
		// 캡쳐의 모든 설정
		AudioFormat audioFormat = getAudioFormat(); // ex)PCM_SIGNED 44100.0 Hz, 16 bit, stereo, 4 bytes/frame, little-endian
		
		System.out.println(audioFormat);
		
		// ex)PCM_SIGNED 44100.0 Hz, 16 bit, stereo, 4 bytes/frame, little-endian
		System.out.println("서버캡쳐쓰레드 실행");
		try {
			// stop버튼이 눌릴 때까지 루프, dat 파일로 실시간 저장
			byte tempBuffer[] = new byte[60000];
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			int cnt = 0;

			fos = new FileOutputStream(tempFile, true);
			
			while (!stopCapture) {
				cnt = is.read(tempBuffer, 0, tempBuffer.length);
				if (cnt == tempBuffer.length) {
					baos.write(tempBuffer, 0, cnt); // 계속 저장
//					System.out.println("축적바이트 : " + baos.size());

					if (baos.size() > tempBuffer.length) { // 메모리 초과 방지를 위해 일정 데이터가 축적되면 스트림 새로 생성
						byte audioData[] = baos.toByteArray(); // 저장데이터를 배열로 출력
						fos.write(audioData);
						baos = new ByteArrayOutputStream();
					}
				} // end if
			} // end while
			
		} catch (Exception e) {
//			e.printStackTrace();
			System.out.println("음성소켓 강제 종료");
		} finally {
			try {
				System.out.println("녹음끝");
				fos.close();
				byte[] b = new byte[(int) tempFile.length()];
	
				FileInputStream fis = new FileInputStream(tempFile);
				fis.read(b);
				fis.close();
				ByteArrayInputStream bais = new ByteArrayInputStream(b);
				InputStream audioIs = bais;
	
				AudioInputStream ais = new AudioInputStream(audioIs, getAudioFormat(), tempFile.length());
				System.out.println("파일저장시작");
				AudioSystem.write(ais, fileType, wavFile);
				ais.close();
				System.out.println("파일저장 끝");
				boolean result1 = mp3Converter.WavToMp3(wavFile, result);
				if (result1 == true) {
					tempFile.delete();
					wavFile.delete();
					System.out.println("컨버팅 완료");
				}
				close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}// end captureAudio method
	
	
	// 허용되는 매개변수 값을 넣어서 AudioFormat 생성
	private AudioFormat getAudioFormat() {
		float sampleRate = 44100.0F;
		// 비트레이트 8000,11025,16000,22050,44100
		int sampleSizeInBits = 16;
		// 8,16
		int channels = 2;
		// 채널 1,2
		boolean signed = true; // stereo false면 프로그램 작동 안함
		// true,false
		boolean bigEndian = false; // false면 little-endian
		// true,false
		// <-->little-endian : 메모리 시작주소가 하위바이트부터 기록
		// window,리눅스는 리틀 엔디안 but,네트워크를 통해 전송되는 것은 빅 엔디안이다.
		return new AudioFormat(sampleRate, sampleSizeInBits, channels, signed, bigEndian);
	}// end getAudioFormat
	
	public void stop() {
		// 마이크 캡쳐 종료
		stopCapture = true;
		System.out.println("음성소켓 정상 종료");
	}
	
	private void close() {
		try {
			if(is != null) is.close();
			if(socket != null) socket.close();
			Thread.currentThread().interrupt();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}