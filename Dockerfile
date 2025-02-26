# 1️⃣ 选择轻量级的 OpenJDK 17 运行环境
FROM openjdk:17-jdk-slim

# 2️⃣ 添加 spring 用户（提高安全性）
RUN addgroup --system spring && adduser --system --ingroup spring spring

# 3️⃣ 暴露 8080 端口
EXPOSE 8080

# 4️⃣ 设置 Java 运行环境变量
ENV JAVA_PROFILE=prod

# 5️⃣ 复制 JAR 文件到容器（注意路径调整）
COPY target/backend.jar /app.jar

# 6️⃣ 运行 Spring Boot 应用
ENTRYPOINT ["java", "-Dspring.profiles.active=${JAVA_PROFILE}", "-jar", "/app.jar"]
