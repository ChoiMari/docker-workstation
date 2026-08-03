# 내 컴퓨터에 개발자용 '작업실' 꾸미기

* 작성된 기술 문서만 읽어도 전체 수행 내용을 파악할 수 있어야 한다.
* 터미널 조작 로그: 터미널에서 수행한 핵심 명령과 출력 결과를 기술문서(README.md)에 기록한다
* README.md만 보고도 전체 과정을 **재현**할 수 있도록 구성한다.

## 프로젝트 개요  

### 미션 목표(요약)  

* 이 과제는 **Linux CLI, Docker, Git/GitHub**를 활용하여, **개발 워크스테이션을 구축**하는 것을 목표로 한다.
* 터미널을 이용한 **파일 및 권한 관리**, **Docker**를 이용한 **컨테이너 기반 개발 환경 구축**,  
  Git/GitHub를 이용한 버전 관리와 협업 환경을 직접 구성하고 검증한다.
* **Dockerfile**을 작성하여 **커스텀 이미지**를 생성하고, **포트 매핑**을 통해 웹 서버를 실행한다.  
* **바인트 마운트**와 Docker **볼륨**을 활용하여 **소스코드 변경 반영**과 **데이터 영속성**을 확인한다.
* 각 과정의 **실행 결과**와 **로그**를 기록하여 **동일한 환경을 재현**할 수 있도록 문서화한다.
* 이를 통해 로컬 환경에 종속되지 않는 재현 가능한 개발 환경 구성 방법과 Docker의 이미지, 컨테이너 구조, git 기반 버전 관리의 기본 원리를 학습하는 것을 목표로 한다.

-> **재현성** & **개발 환경 격리성**을 갖춘 개발 환경 구축 학습이 목표

## 수행 항목 체크리스트

- [x] GitHub에 제출용 Repository를 생성
- [x] Git 설정(전역 X, local로 설정함, 공용 컴퓨터라서)
- [x] .gitignore 작성
- [x] 프로젝트 폴더 구조 설계
- [x] 운영체제 확인
- [x] CPU 아키텍처 확인
- [x] 쉘 확인
- [x] 터미널 확인
- [x] Git 버전 확인
- [x] OrbStack 설치/실행/Docker 엔진 실행 확인
- [x] docker 버전/데몬(엔진)/명령어 동작 확인
- [x] 터미널 기본 조작 실습
- [x] 절대 경로와 상대 경로 실습
- [x] 파일 권한 실습
- [x] Docker Context 확인
- [x] Docker 기본 운영 명령 실습
- [x] Docker 이미지 확인
- [x] Ubuntu 이미지 다운로드
- [x] Ubuntu 컨테이너 내부 진입
- [x] 컨테이너 목록 확인
- [x] 종료된 컨테이너 다시 시작
- [x] attach와 exec 차이 확인
- [x] 컨테이너 중지 및 삭제
- [x] Docker 로그 및 리소스 확인
- [x] 실습 컨테이너 정리
- [x] Dockerfile 기반 커스텀 웹서버 만들기
- [x] 포트 매핑 실습
- [x] 바인드 마운트 변경 반영 실습
- [x] Docker 볼륨 영속성 실습
- [x] 이미지와 컨테이너 차이 정리
- [x] Docker 운영 명령 최종 기록
- [x] Git 커밋 생성
- [x] GitHub Repository 연동
- [x] VSCode와 GitHub 연동
- [x] 트러블슈팅 최소 2건 작성
- [x] 보안 및 개인정보 점검
- [x] 재현성 점검

## 과제 제출 구조 결정

* 저장소 공개 범위를 public으로 설정
* 기본 브랜치 main으로 설정
* 저장소 루트에 README.md를 생성 및 작성
* README만 보고 전체 과정을 재현 할 수 있도록 구성한다.

### 프로젝트 폴더 구조

파일 이름만 보고 내용을 알 수 있도록 작성한다.

```shell
development-workstation/
├── app/
│   └── index.html  # 웹 페이지
├── assets/ # README 이미지
├── .gitignore
├── Dockerfile
└── README.md
```

## 실행 환경 확인

### 운영체제 확인

* 현재 운영체제를 확인한다.  

```Bash
uname -a
```

* 실행 결과

```Bash
Darwin c5r6s7.codyssey.kr 24.6.0 Darwin Kernel Version 24.6.0: Tue Apr 21 20:17:54 PDT 2026; root:xnu-11417.140.69.710.16~1/RELEASE_X86_64 x86_64
```

* macOS인 경우 운영체제 버전 확인

```Bash
sw_vers
```

* 실행 결과

```Bash
ProductName: macOS
ProductVersion: 15.7.7
BuildVersion: 24G720
```

### CPU 아키텍처 확인

```Bash
uname -m
```

* 실행 결과

```Bash
x86_64
```

### 쉘 확인

* 현재 로그인 쉘 확인

```Bash
echo $SHELL
```

* 실행 결과
  
```Bash
/bin/zsh
```

* 현재 실행 중인 쉘 확인

```Bash
ps -p $$
```

* 실행 결과
  
```Bash
  PID TTY           TIME CMD
72827 ttys000    0:00.11 -zsh
```

### 터미널 확인

* 사용 중인 터미널 프로그램을 확인
  
```Bash
echo $TERM_PROGRAM
```

* 실행 결과

```Bash
Apple_Terminal
# macOS Terminal
```

### Git 버전 확인

```Bash
git --version
```

* 실행 결과

```Bash
git version 2.53.0
```
