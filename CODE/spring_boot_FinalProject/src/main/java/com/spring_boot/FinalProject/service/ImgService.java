package com.spring_boot.FinalProject.service;

import java.io.File;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.spring_boot.FinalProject.controller.APIController;

@Service
public class ImgService {
	@Autowired
	APIController apiController;
    
    public String getFullPath(String filename) {
    	return apiController.uploadProfilePathImg() + filename;
    }

    public String storeImg(String userId, MultipartFile file) throws IOException {

        //String fileName = createFileName(file.getOriginalFilename());
    	String fileName = userId + file.getOriginalFilename().substring(file.getOriginalFilename().length() - 4, file.getOriginalFilename().length());
        
        File mk = new File(apiController.uploadProfilePathImg());	
        if (!mk.exists()) {
            mk.mkdirs();
        }
        Path copyOfLocation = Paths.get(apiController.uploadProfilePathImg() + StringUtils.cleanPath(fileName));

        Files.copy(file.getInputStream(), copyOfLocation, StandardCopyOption.REPLACE_EXISTING);
        
        return fileName;
    }


    private String createFileName(String fileName) {
        String uuid = UUID.randomUUID().toString();
        String storeFileName = uuid + "." + extractExt(fileName);
        return storeFileName;
    }

    private String extractExt(String fileName) {
        int position = fileName.lastIndexOf(".");
        return fileName.substring(position + 1);
    }
}
