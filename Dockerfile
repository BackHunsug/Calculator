# 1. 베이스 이미지 설정
FROM amazoncorretto:17-al2-jdk

# 2. 소스 파일 복사
COPY Calc.java .

# 3. 컴파일
RUN javac Main.java

# 4. 실행
CMD ["java", "Main"]
