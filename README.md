# 论坛项目

## 技术栈
```
Spring Boot 
MyBatis
MyBatis Generator
Lombok
Bootstrap
thymeleaf
okhttp3
fastjson
MySQL
flyway
Github OAuth
aliyun oss
```


## 本地运行手册
1. 安装必备工具  
JDK，Maven
2. 克隆代码到本地
```sh
git clone https://github.com/codedrinker/community.git
````
3. 运行打包命令
```sh
mvn package
```
4. 运行项目  
```sh
java -jar target/community-0.0.1-SNAPSHOT.jar
```
5. 访问项目
```
http://localhost:8887
```



```
运行 migrate 和 generator 的命令
```bash
mvn flyway:migrate
mvn -Dmybatis.generator.overwrite=true mybatis-generator:generate
```

###首页浏览
![img](https://zh767.oss-cn-beijing.aliyuncs.com/20200916/1600186170634524image-20200916000833897.png)