# 공식 Nginx 이미지 중 Alpine Linux 기반 경량 이미지를 사용한다.
FROM nginx:alpine

# 이미지의 목적을 식별하기 위한 OCI 표준 메타데이터를 추가한다.
LABEL org.opencontainers.image.title="docker-workstation-web"
LABEL org.opencontainers.image.description="Custom Nginx image for Docker workstation assignment"

# 이미지의 실행 환경을 식별하기 위한 환경 변수를 설정한다.
# 현재 정적 HTML 동작에는 직접 사용되지 않지만,
# 컨테이너 내부에서 환경 정보를 확인할 수 있다.
ENV APP_ENV=development

# 호스트 프로젝트의 app 디렉터리 내용을
# Nginx의 기본 정적 웹 문서 경로로 복사한다.
COPY app/ /usr/share/nginx/html/

# 컨테이너 내부에서 Nginx가 80번 포트를 사용한다는 정보를 기록한다.
# EXPOSE만으로 호스트와 실제 연결되지는 않는다.
EXPOSE 80

# Nginx가 정상적으로 HTTP 응답을 반환하는지 주기적으로 검사한다.
HEALTHCHECK --interval=10s --timeout=3s --start-period=5s --retries=3 \
    CMD wget -qO- http://localhost/ || exit 1