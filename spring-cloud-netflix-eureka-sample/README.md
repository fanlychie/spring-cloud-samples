# spring-cloud-netflix-eureka-sample

Spring Cloud Netflix Eureka 示例项目，项目结构：

```html
spring-cloud-netflix-eureka-sample（父项目）
|
|
|__ eureka-server（Eureka 服务器端应用）
|
|
|__ order-service（Eureka 客户端服务提供者应用）
```

# 环境配置

找到并打开系统的 hosts 文件（windows 系统的路径为 C:\Windows\System32\drivers\etc\hosts），在最后添加如下行：

```java
127.0.0.1 peer1 peer2 peer3
```

# 快速启动示例项目

双击执行 `quick-start.bat` 批处理文件。