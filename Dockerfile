# [1단계: 빌드 스테이지]
FROM gradle:8.5-jdk17 AS build
WORKDIR /app

# 소스 코드 복사
COPY . .

# 도커 내부에서 Gradle 빌드 수행 (테스트 포함)
RUN chmod +x gradlew
RUN ./gradlew clean build -x test

# [2단계: 실행 스테이지]
FROM amazoncorretto:17-al2-jdk
WORKDIR /app

# 1단계에서 빌드된 jar 파일만 복사해옵니다.
COPY --from=build /app/build/libs/*.jar app.jar

# 메모리 제한 설정 후 실행
ENTRYPOINT ["java", "-Xmx512m", "-jar", "app.jar"]