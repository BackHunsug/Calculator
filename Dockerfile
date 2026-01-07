# 1. 컴파일과 실행을 위해 JDK 이미지를 사용합니다.
FROM openjdk:17-jdk-slim

# 2. 컨테이너 내부 작업 디렉토리 설정
WORKDIR /app

# 3. 현재 폴더의 모든 소스 코드(.java 파일 등)를 컨테이너로 복사
COPY . .

# 4. Main.java 파일을 컴파일합니다.
# (패키지가 있다면 경로를 맞춰야 하지만, 없다면 아래 명령어로 충분합니다)
RUN javac Main.java

# 5. 프로그램 실행
# 메인 클래스 이름이 Main일 경우입니다.
CMD ["java", "Main"]