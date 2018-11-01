package com.sesoc.cl.forAudioCapture;

import java.io.File;

import it.sauronsoftware.jave.AudioAttributes;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.EncodingAttributes;

//jave라이브러리 이용
public class mp3Converter {
	//컨버팅 될 mp3파일 설정
	public static boolean WavToMp3(File fileWav, File fileMp3){ 
		AudioAttributes audio = new AudioAttributes(); 
		audio.setCodec("libmp3lame"); 
		audio.setBitRate(new Integer(128000)); //비트레이트 
		audio.setChannels(new Integer(2)); //채널
		audio.setSamplingRate(new Integer(44100)); //샘플링레이트 
		EncodingAttributes attrs = new EncodingAttributes(); 
		attrs.setFormat("mp3"); //포맷지정 
		attrs.setAudioAttributes(audio); 
		Encoder encoder = new Encoder();
		try
		{
			encoder.encode(fileWav, fileMp3, attrs); 
			System.out.println("컨버팅 중..."); 
			return true; 
		}
		catch (Exception e) 
		{ 
			System.out.println("에러에러"); 
			System.out.println(e.getStackTrace()); 
			return false; 
		}//end catch 
	}//end WavToMp3
}//end mp3Converter