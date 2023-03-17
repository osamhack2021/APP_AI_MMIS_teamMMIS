# MMIS (군 급식 정보 체계)
<img src =https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/logo.jpg width = "80%">
  
## 시연 영상 
- [인공지능 단독시연영상](https://drive.google.com/file/d/1mA1Q2unX9jvko6GCk5LNBHOBurG__kLh/view?usp=sharing), 
- [프로젝트 시연영상](https://drive.google.com/file/d/1iIOrjTJ4Cf9QrEbhqQJdLYdunUYrFjCF/view?usp=sharing)

## 보다 자세한 정보
- [발표자료(pdf)](https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/MMIS%20%EC%B5%9C%EC%A2%85.pdf)
- [발표자료(show)](https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/MMIS%20%EC%B5%9C%EC%A2%85.show)

## notice!!
- 위에서 server 파일이 AI/WEB/APP에 대한 backend입니다. 
- 별도로 AI/server 파일에 인공지능 독립적으로 실행 시킬 수 있는 플라스크 서버가 있습니다. 

# 📖프로젝트 개요
## 프로젝트 개발 동기

- 대규모 부대의 경우, 부대의 총 취식인원 수집이 불가능함에 따라 전 병력을 기준으로 조리를 진행합니다. 따라서 과도한 잔반이 발생합니다.
- 장병들이 병영식 관련 정보 수집하거나, 의견을 전달하는데 있어서 불편함이 발생합니다.
- 최근 군내 부실 급식 등의 군내 급식 문제가 이슈화되고 있고, 이는 각 부대의 급식 모니터링의 미비 때문입니다. 

## 프로젝트 설명
MMIS는 장병들을 위한 군급식 정보 모바일 앱/웹 플렛폼입니다. 최신화된 기술환경에 맞춰 인트라넷 및 수기 식에 머물러 있는 병영식 정보 수집, 불취식신청을 포함한 식수 인원 파악 등 장정들이 해야하는 병영식 관련 행정 처리를 일반 스마트폰 및 웹에서 처리할 수 있습니다. 급식 이용자 및 관리자 모두에게 유용한 정보를 제공합니다. 추가적으로, 본 플렛폼을 통해 얻은 데이터들을 인공지능에 학습시켜 최종적으로 식단 구성을 도와주는 인공지능을 개발했습니다.      

## 프로젝트 목표
본 프로젝트는 민간에서 이용중인 급식앱 "김급식"을 모티프로 삼았습니다. "김급식"처럼, 병영식 정보 전달 및 군대 환경에 적합화한 기능을 제공할 수 있는 방향으로 프로젝트를 진행했습니다.   
저희 플랫폼은 장병들이 편리하게 정보를 수집하는 것을 넘어, 장병들의 병영식 관련 의견 게시를 활성화시켜 최종적으로 음식물 쓰레기 줄이기, 급식 정보 접근성 향상, 부실급식 문제해결 및 급식 질 개선을 목표로 합니다.   

# 💡개발 과정

### 카카오 오븐
[관리자 웹페이지 카카오 오븐](https://ovenapp.io/view/bMQKnCvUUOJyRndtkSEfVuVbqoQtTQly/)

[사용자 앱 카카오 오븐](https://ovenapp.io/view/unFCimnqD5RSn7hPpC1XvYZWyt8vbjU7/)

### API  
[API 명세서](https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/api_sheet.hwp)

### 서비스 플로우
<img src =https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/myapp_flow.jpg width = "80%" height = "80%">
<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/admin_flow.jpg width = "80%" height = "80%">
   

# 📝기능 설계
## 핵심기능
### 📱사용자 모바일 앱
- 급식을 이용하는 사용자들을 위한 앱

#### 정보 수집
|사진|설명|
|:----------:|:---------|
|<img src = https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/homepage.png width ="200" height = "400">   <img src  = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/menu.png width ="200" height = "400">|1. 메인페이지 메뉴 스크롤 뷰 게시 성분 함유 메뉴 표시 </br></br></br></br><br width = "33%">2. 클릭시 한 끼 단위의 자세한 식단 정보|



#### 불취식 관리/ 공제내역
|사진|설명|
|:----------:|:---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/noteating.png width = "200" height = "400">        <img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/record.png width = "200" height = "400">|<br width = "33%">1. 매 끼니마다 편리하게 취식/불취식 신청 </br></br></br></br><br width = "33%"> 2. 한달 단위의 관리 가능|


#### 장병 의견 전달
|사진|설명|
|:----------:|:---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/request.png width = "200" height = "400">    <img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/survey.png width = "200" height = "400">|<br width = "33%">1. 메뉴, 애로사항 관련 건의사항 게시 </br></br></br></br><br width = "33%"> 2. 관리자 페이지에서 생성한 설문조사 실시|

#### AI 실험실  
|사진|설명|
|:----------:|:---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/AI.png width = "200" height = "400">    <img src = https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/ai_result.png width = "200" height = "400">|<br width = "33%">1. 사용자가 선호하는 메뉴 조합 입력 </br></br></br></br><br width = "33%"> 2. 식단 점수 및 대체 추천 식단 출력|


#### 부대 급식 자랑
|사진|설명|
|:----------:|:---------|
|<img  src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/post.png width = "200" height = "400">    <img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/eachpost.png width = "200" height = "400">|1. 각 부대별 급식 사진 게시 </br></br></br></br><br width = "33%"> 2. 장병들 끼리의 의견 공유|



## 💻관리자 웹
- 부대별 급식 담당자를 위한 관리자 웹(앱 모드 지원)


#### 로그인 및 회원가입 기능
|사진|설명|
|----------|---------|
|<img src =https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managelogin.png width = "800" height = "300">|군번과 비밀번호로 로그인|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managesign.png width = "800" height = "300">|군번과 비밀번호로 회원가입| 

#### 메뉴관리   
|사진|설명|
|----------|---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managemenu.png width = "800" height = "300">|날짜마다 조/중/석식 메뉴를 입력|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managemenudetail.png width = "800" height = "300">|메뉴 데이터가 없을 경우 상세 영양성분을 입력|


#### 식수인원 관리   
|사진|설명|
|----------|---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managenumber.png  width = "800" height = "300">|모바일 앱을 통해 입력받은 식수 인원 확인|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managelist.png width = "800" height = "300">|식수 인원 명단 확인|


#### 공지사항/건의사항/설문조사 관리   
|사진|설명|
|----------|---------|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/manageann.png  width = "800" height = "300">|각종 공지 전달|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/suggestion_admin.png  width = "800" height = "300">|건의사항 답변 및 건의사항 수령|
|<img src = https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS/blob/main/assets/managesurvey.png  width = "800" height = "300">|메뉴 관련 선호도 등 부대 장병들 의견, 설문조사 생성 및 결과 조회|


#### AI 실험실 
- 앱과 동일한 기능 사용가능 
- 추천된 메뉴로 적합한 식단 구성에 도움

|사진|설명|
|----------|---------|
|<img src  = https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/assets/ai_admin.png width = "800" height = "300">|메뉴 조합 제공 전 AI 실험실에 메뉴를 입력|



## 🤖AI

1. 메뉴 조합 추천 인공지능 
- 국방 공공데이터에 저장된 메뉴를 비슷한 메뉴끼리 분류한 것을 바탕으로 새로운 메뉴 조합을 추천해 주는 모델입니다. 예들들어 국방부 식단에 저장된 계란찜을 사용자가 선택했을 때 메뉴 조합 추천 인공지능이 계란 후라이나 계란 수란 등의 열량과 메뉴 이름면에서 비슷한 메뉴를 추천해 줍니다.    
- 사용자가 메뉴 조합을 입력할 시, 이와 유사한 메뉴 조합을 추천합니다.

2. 조합 평가 인공지능
- 기존과 다른 메뉴 조합이 있을 시 그 조합의 종합점수를 산출합니다. 기존의 메뉴를 다른 조합으로 한 끼니를 만들었을 때 그 한 끼니의 종합 평가를 점수를 산출해 내는 모델입니다. 
- supervised learning으로 모델을 학습시켰습니다. 학습을 위한 데이터는 한 끼니의 여러 점수(맛, 메뉴가 나온 빈도 등)를 활용하고 이를 바탕으로 기존 조합의 평가 점수를 regression해서 학습시켰습니다. 

3. 급식이 1.0.0
- 1번 모델과 2번 모델을 융합해 사용자가 메뉴 조합을 입력할 시, 그 메뉴 조합의 예상 점수와 더불어 인공지능이 추천해준 새로운 조합들 중 점수가 더 높은 점수의 메뉴를 추천해 줍니다. [인공지능 시현영상보러가기](https://drive.google.com/file/d/1mA1Q2unX9jvko6GCk5LNBHOBurG__kLh/view?usp=sharing)

# 프로젝트 전망
## 기대효과

1. 사용자의 편리함 상승
   
   * 각종 공지사항, 오늘의 메뉴, 식단의 세부 정보를 앱을 통해 빠르고 정확하게 확인   

   * 또한, 기존 복잡했던 조사 방법이 앱에서 이루어져 장병 간 조사 참여를 전달하는 불편함이 감소   
      
2. 적극적인 의사소통   

   * 특정 메뉴에 한해, 때때로 진행되었던 설문 조사 대신, 언제든 자유롭게 메뉴를 평가하고, 의견을 전달

   * 특히 사용자 선호 메뉴 조합 추천을 통해 병영식에 대한 장병들의 더욱 적극적인 참여가 예상됨

3. 관리자의 업무 간편화    

   * 관리자는 각종 정보들을 일일이 생활관 단위로 전달할 필요 없이 앱을 통해서 일괄적으로 전달이 가능

   * 관리자 홈페이지를 통해 각종 조사 결과 및 건의사항을 한 곳에서 손쉽게 확인이 가능

4. 군 급식 수준 상승   

   * 불취식 인원을 정확히 파악하여 불필요한 자원 낭비를 줄이고 이를 활용해 더욱 질 좋은 병영식 제공 가능

   * 부대 병영식 자랑이 확대되면, 부대 간 병영식 비교를 통해 군 전반적 병영식 수준 상승이 기대됨

5. 부대 급식 모니터링 시스템 
   * 우리 부대 급식 자랑을 통해, 군 내의 급식 제공 형태를 모니터링 할 수 있음. 
   
   * 더 좋은 급식을 제공하기 위한 선의의 경쟁을 촉진할 수 있음.

6. 민간에서의 활용성 

   * 학교, 대형 식당 등 급식과 관련된 기관에서 폰 프로젝트를 활용할 수 있음. 
   
7. flutter web 오픈 소스 

   * flutter web은 현재 활용 초기 단계로 템프릿 등의 자료가 많지 않음.
   
   * 본 관리자 웹 페이지는 flutter web의 좋은 예시가 될 수 있음. 




## 컴퓨터 구성 / 필수 조건 안내 (Prerequisites)
1. ECMAScript 6 지원 브라우저 사용
2. 브라우저 지원 버전:
- Google Chrome 버전 77 이상
- Microsoft Edge 버전 84 이상
3. 앱 지원 버전:
- Andriod 11
- IOS 14

## 기술 스택 (Technique Used) 
### Artificial Intelligence

<table>
<tbody>
    <tr>
        <td>
            <div align="center"><a href="https://www.python.org" target="_blank"> <img src="https://www.python.org/static/img/python-logo@2x.png" alt="python" height="40"/> </a><br>Python</br></div>
        </td>
        <td>
            <div align="center"><a href="https://www.tensorflow.org/" target="_blank"> <img src="https://www.gstatic.com/devrel-devsite/prod/vfe8af62599ec445552c3fb43608c37ff46463c9fce3b14d8ee63b2e71edddffd/tensorflow/images/lockup.svg?dcb_=0.6050776491075445" alt="tensorflow" height="40"/> </a><br>Tensorflow</br></div>
        </td>
        <td>
            <div align="center"><a href="https://keras.io/" target="_blank"> <img src="https://keras.io/img/logo.png" alt="keras" height="40"/> </a><br>Keras</br></div>
        </td>
        <td>
            <div align="center"><a href="https://flask.palletsprojects.com/en/2.0.x/" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flask/flask-original.svg" alt="flask" width="40" height="40"/> </a><br>Flask</br></div>
        </td>
    </tr>
</tbody>
</table>

### APP/Web Front-end

<table>
<tbody>
    <tr>
        <td>
            <div align="center"><a href="https://flutter.dev/" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/flutter/flutter-original.svg" alt="flutter" width="40" height="40"/> </a><br>Flutter</br></div>
        </td>
        <td>
            <div align="center"><a href="https://gradle.org/" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/gradle/gradle-plain.svg" alt="gradle" width="40" height="40"/> </a><br>Gradle</br></div>
        </td>
    </tr>
</tbody>
</table>

### Web Back-end

<table>
<tbody>
    <tr>
        <td>
            <div align="center"><a href="https://www.mysql.com/" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a><br>MySQL</br></div>
        </td>
        <td>
            <div align="center"><a href="https://nodejs.org" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/nodejs/nodejs-original-wordmark.svg" alt="nodejs" width="40" height="40"/> </a><br>Node.js</div>
        </td>
        <td>
            <div align="center"><a href="https://expressjs.com" target="_blank"> <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/express/express-original-wordmark.svg" alt="express" width="40" height="40"/> </a><br>Express</div>
        </td>
        <td>
            <div align="center"><a href="https://git-scm.com/" target="_blank"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a><br>Git</div>
        </td>
    </tr>
</tbody>
</table>


## 개발 프로젝트 사용법 (Getting Started)

<p>step1. MMIS 저장소를 클론합니다.</p>

```bash
$ git clone https://github.com/osamhack2021/APP_AI_MMIS_teamMMIS.git
```
<br>
<p>step2. 클론한 폴더로 이동하고 패키지를 설치합니다.</p>


```bash
// 개발 Web 보기
$ cd /workspaces/APP_AI_MMIS_TEAMMMIS/WEB(FE)/admin
$ flutter run -d chrome
/// 배포용 빌드
$ flutter build web

// 개발 App 보기
$ cd /workspaces/APP_AI_MMIS_TEAMMMIS/APP(FE)/myapp
$ flutter run (등록된 기기로 실행)
/// 배포용 빌드
$ flutter build apk

// 서버 실행
$ cd /workspaces/APP_AI_MMIS_TEAMMMIS/
$ cd server
$ cd node app.js
$ cd forever start app.js
```
<br>


## 팀 정보 (Team Information)
- 최윤호(팀장 : 프론트엔드) (potatohead12@gmail.com), Github Id: potatohead12
- 문철운(팀원 : 프론트엔드)(heiyin315@gmail.com), Github Id: cjfdns007
- 성민(팀원 : 백엔드) (pho0570@gmail.com), Github Id: mini-777
- 성준혁(팀원 : 백엔드) (sungjjh9707@gmail.com), Github Id: sungjjss9707
- 최민호(팀원 : 인공지능) (minhochoi.korea@gmail.com), Github Id: Paspachu
- 홍유찬(팀원 : 인공지능) (hychan0709@gmail.com), Github Id: onlyshine

## 저작권 및 사용권 정보 (Copyleft / End User License)
 * [MIT](https://github.com/osamhack2021/APP_WEB_AI_MMIS_teamMMIS/blob/main/license.md)

