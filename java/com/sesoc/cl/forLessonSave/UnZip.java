package com.sesoc.cl.forLessonSave;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class UnZip {
	
	private String destDir = "C:\\CoronaSaveFolder\\passed_lesson\\text";
	private String sourceDir = "C:\\CoronaSaveFolder\\passed_lesson\\text"; 
	private String fileName;
	
	public UnZip(String fileName) {
		this.fileName = fileName;
	}

	public int start() {
		int result = 0;
		
		String zipFilePath = sourceDir + "\\" + fileName;
		result = unzip(zipFilePath, destDir);
		
		return result;
	}

	private int unzip(String zipFilePath, String destDir) {
		int result = 0;
		File dir = new File(destDir);
		// create output directory if it doesn't exist
		if (!dir.exists()) dir.mkdirs();
		FileInputStream fis;
		// buffer for read and write data to file
		byte[] buffer = new byte[1024];
		try {
			fis = new FileInputStream(zipFilePath);
			ZipInputStream zis = new ZipInputStream(fis);
			ZipEntry ze = zis.getNextEntry();
			while (ze != null) {
				String fileName = ze.getName();
				File newFile = new File(destDir + File.separator + fileName);
				System.out.println("Unzipping to " + newFile.getAbsolutePath());
				// create directories for sub directories in zip
				new File(newFile.getParent()).mkdirs();
				FileOutputStream fos = new FileOutputStream(newFile);
				int len;
				while ((len = zis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
				fos.close();
				// close this ZipEntry
				zis.closeEntry();
				ze = zis.getNextEntry();
			}
			// close last ZipEntry
			zis.closeEntry();
			zis.close();
			fis.close();
			result = 1;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	public void delete() {
		String rawFileName = fileName.substring(0, fileName.lastIndexOf("."));
		String vttFilePath = destDir + "\\" + rawFileName + ".vtt";
		File deleteFile = new File(vttFilePath);
		if (deleteFile.isFile()) deleteFile.delete();
	}
}
