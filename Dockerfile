# 어떤 이미지를 사용해서 빌드 할 것인지 정의
# Docker hub에 있는 node의 최신 LTS(장기 지원) 버전 12 사용
FROM node:12

# 이미지 안에 애플리케이션 코드를 넣기 위해 디렉터리 생성
# 앱 디렉토리 생성
WORKDIR /usr/src/app

# 위 이미지는 이미 node.js와 npm이 설치되어 있으므로 의존성만 설치하면 된다.
# 앱 의존성 설치
COPY package.json ./

RUN npm install

# pm2 설치
RUN npm install -g pm2@latest

# Docker image 안에 앱의 소스코드를 넣기 위해 COPY 지시어를 사용
COPY . .

# 주입된 환경변수
ARG NODE_ENV

# NODE_ENV 환경 변수
ENV NODE_ENV=$NODE_ENV

# 앱이 3000 포트에 바인딩 되어 있으므로 EXPOSE 지시어를 사용하여 docker 데몬에 매핑
EXPOSE 3000

# 런타임을 정의하는 CMD로 앱을 실행하는 중요 명령어를 정의해야한다.
CMD ["pm2-runtime", "ecosystem.config.js"]
