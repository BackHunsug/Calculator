# [1단계: 빌드 스테이지]
FROM gradle:8.5-jdk17 AS build
WORKDIR /app

# 1. 라이브러리 설정 파일만 먼저 복사
COPY build.gradle settings.gradle ./

# 2. 라이브러리만 미리 다운로드 (소스 코드가 없어도 의존성만 미리 빌드)
# 이 단계가 캐싱되어 다음 빌드부터는 다운로드 과정을 건너뜁니다.
RUN gradle build -x test --no-daemon > /dev/null 2>&1 || true
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