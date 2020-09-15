package com.zh.community.controller;

import com.aliyun.oss.OSSClient;
import com.zh.community.dto.FileDTO;
import com.zh.community.provider.AliyunOSSProvider;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
@Slf4j
public class FileController {

    @Autowired
    private OSSClient ossClient;

    @Autowired
    private AliyunOSSProvider aliyunOSSProvider;


    @RequestMapping("/file/upload")
    @ResponseBody
    public FileDTO upload(HttpServletRequest request) {
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = multipartRequest.getFile("editormd-image-file");
        FileDTO fileDTO = new FileDTO();

        // 2. 准备上传API的参数
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String fileName = multipartFile.getOriginalFilename();
        String finalFileName = System.currentTimeMillis() + "" + new SecureRandom().nextInt(0x0400) + fileName;
        String filePath = sdf.format(new Date()) + "/" + finalFileName;

        // 3. 上传至阿里OSS
        try {
            ossClient.putObject(aliyunOSSProvider.getBucketName(), filePath, new ByteArrayInputStream(multipartFile.getBytes()));
        } catch (IOException e) {
            e.printStackTrace();
            // 上传失败
            fileDTO.setSuccess(0);
            fileDTO.setMessage("error");
            return fileDTO;
        }
        // 上传成功
        fileDTO.setMessage("done");
        // 文件名(即直接访问的完整路径)
        fileDTO.setSuccess(1);
        fileDTO.setUrl(aliyunOSSProvider.getUrlPrefix() + filePath);
        return fileDTO;
    }

/*    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String fileName = "1.png";
        String finalFileName = System.currentTimeMillis() + "" + new SecureRandom().nextInt(0x0400) + fileName;
        String filePath = sdf.format(new Date()) + "/" + finalFileName;
        System.out.println(filePath);
    }*/

}
