# Multi-stage build for Vue.js frontend
FROM node:20-alpine AS builder

# 작업 디렉토리 설정
WORKDIR /app

# package.json과 package-lock.json 복사
COPY package*.json ./

# 의존성 설치
RUN npm install

# 소스 코드 복사
COPY . .

# 프로덕션 빌드 생성
RUN npm run build

# Production stage
FROM node:20-alpine AS production

# serve 패키지 전역 설치
RUN npm install -g serve

# 작업 디렉토리 설정
WORKDIR /app

# 빌드된 파일 복사
COPY --from=builder /app/dist ./dist

# 포트 노출
EXPOSE 3000

# 환경변수 설정
ENV NODE_ENV=production

# 서버 실행
CMD ["serve", "-s", "dist", "-l", "3000"]
