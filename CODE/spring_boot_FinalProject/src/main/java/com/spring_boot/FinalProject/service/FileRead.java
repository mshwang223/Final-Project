package com.spring_boot.FinalProject.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.stereotype.Service;

@Service
public class FileRead {
	
	// TEXT 파일 읽어서 문자열 반환하는 함수
	public String fileRead(String filePath, String filePathName) {
		String result = "";
		
		try {
			File file = new File(filePath + filePathName);
			FileReader fr = new FileReader(file + ".txt");
			BufferedReader br = new BufferedReader(fr);
			
			String line = "";
			while ((line = br.readLine()) != null) {
				result += line + "<br>";
				
			}
			
			br.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
