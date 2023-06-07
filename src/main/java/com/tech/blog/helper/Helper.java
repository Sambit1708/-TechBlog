package com.tech.blog.helper;

import java.io.*;

public class Helper {
	
	private static String imgPath = "C://Users//user//OneDrive//Desktop//JavaProject//ServletProjects//TechBlog//src//main//webapp//pics//";
	
	public static String getImgPath() {
		return imgPath;
	}

	public static boolean deleteFile(String path) {
		boolean status = false;
		
		try {
			File file = new File(imgPath+path);
			status = file.delete();
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return status;
	}
	
	public static boolean saveFile(InputStream is,String path) {
		boolean status = false;
		
		try {
			byte[] b = new byte[is.available()];
			is.read(b);
			FileOutputStream fos = new FileOutputStream(imgPath+path);
			fos.write(b);
			fos.flush();
			fos.close();
			status = true;
			
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return status;
	}
}
