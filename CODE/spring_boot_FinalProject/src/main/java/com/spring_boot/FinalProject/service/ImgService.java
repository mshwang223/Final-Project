package com.spring_boot.FinalProject.service;

import com.spring_boot.FinalProject.model.UserVO;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class ImgService {
    @Value("${userImg.dir}")
    private String fileDir;

    public String getFullPath(String filename) {
        return fileDir + File.separator + filename;
    }

    public String storeImg(MultipartFile file) throws IOException {

        String fileName = createFileName(file.getOriginalFilename());
        File mk =new File(fileDir);
        if (!mk.exists()) {
            mk.mkdirs();
        }
        Path copyOfLocation = Paths.get(fileDir + File.separator + StringUtils.cleanPath(fileName));

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
