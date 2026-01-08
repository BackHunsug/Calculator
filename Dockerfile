# 1. 실행에 필요한 JDK 환경 설정
FROM amazoncorretto:17-al2-jdk

# 2. 컨테이너 내부 작업 폴더
WORKDIR /app

# 3. Gradle 빌드 결과물(jar)을 컨테이너로 복사
# 프로젝트 이름-버전.jar 파일이 build/libs 폴더에 생깁니다.
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 4. 애플리케이션 실행
# 프리티어 메모리 보호를 위해 최대 512MB 제한 설정
ENTRYPOINT ["java", "-Xmx512m", "-jar", "/app/app.jar"]