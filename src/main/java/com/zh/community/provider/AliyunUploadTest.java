package com.zh.community.provider;

import com.aliyun.oss.OSSClient;

import java.io.File;
import java.net.URL;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * <p>
 * test阿里云oss
 * </p>
 *
 * @author zh
 */
public class AliyunUploadTest {

    public static void main(String[] args) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAI4FcjNJ7fUFxCjLy1T9HB";
        String accessKeySecret = "R430I5GxiqHTHBXQUoaxUxnT6Iwj24";
        String fileName = "1.jpg";
        String bucketName = "zh767";
        // 获取文件的后缀名
        String suffixName = fileName.substring(fileName.lastIndexOf("."));
        // 生成上传文件名
        String finalFileName = System.currentTimeMillis() + "" + new SecureRandom().nextInt(0x0400) + suffixName;
        String objectName = sdf.format(new Date()) + "/" + finalFileName;
        File file = new File(fileName);
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);

        ossClient.putObject(bucketName, objectName, file);
        // 设置URL过期时间为1小时。
        Date expiration = new Date(System.currentTimeMillis() + 3600 * 1000);
        // 生成以GET方法访问的签名URL，访客可以直接通过浏览器访问相关内容。
        URL url = ossClient.generatePresignedUrl(bucketName, objectName, expiration);
        ossClient.shutdown();
        System.out.println(url.toString());
    }
}
