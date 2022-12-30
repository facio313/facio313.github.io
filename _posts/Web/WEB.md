Web
- 논리적 공간으로 논리적 식별자 역할을 함 ex)한반도(명명 주소)
- 대화의 종단에 있는 peer들이 있음 ex)클라이언트(peer)와 서버(peer)

- 대화의 종단에 있는 Peer(적어도 두 개 이상)
- 클라리언트와 서버
- 서로 다른 역할을 가지고 있는 클라이언트와 서버라는 peer들이 대화를 하는 공간
- 둘이 서로 이해할 수 있는 언어 : html
- 클라이언트 : 질문하기(request)
- 서버 : 답변하기(response) - 꼭 하나일 필요는 없음
        - bit를 주고 받는데 이걸 포장하는 것 package
        - packaging 하는 방법이 protocol
        - protocol : http, smtp, imap, ftp(file transfer protocol)
    - peer 하나에 여러 서버가 있을 수 있음
    - 1서버는 html / 2서버는 file / 3서버는 mail
    - 역할에 따라 쪼개진 것 Tier
    - Peer : 물리적인 종단(물리적으로 식별)
        - 주소를 통해 Peer를 식별할 수 있음 - ip 
    - Tier : 논리적인 종단(논리적으로 식별)
        - 논리적으로 식별하는 것 - port number
        - 한 peer의 여러 서버들이 있을 수 있음 -> 그래서 그 서버들을 식별해주는 것이 port number

- port number 범위 : 0 ~ 65535(2의 16승-1)
    - well-known port : 0~1023 (80, 443 같은)
    - 이미 약속된 것이기 때문에 마음대로 사용할 수 없다


Internet
- 물리적 공간
- 대한민국

=====================================================

서버가 하는 것 : Port number를 Listening
IP:Port를 통해 특정 서버로 요청을 보냄
port number는 건물의 출입구라고 생각하면 됨
- 대덕인재개발원의 입구는 총 세 개
- 문 세 개는 다르지만 주소는 같음
통합개발환경을 설정할 때 가장 첫 번째로 포트 번호 설정
요청은 언제 올 지 모름
사람을 대신해서 요청을 24시간 감시할 서버, 몇 번 포트 넘버를 감시할 것인지
정적 : 이미 정해져서 고정된 것(페이지가 미리 만들어짐)
요청에 대한 결과가 정적일 수 없음
cs -> 2Tier
port
    - 정적 요청 -> WS
    - 동적 요청 -> WAS

raw데이터가 가공되면 content
DB에 저장된 raw데이터
클라이언트 - WS / WAS - DB =>(4티어)
            미들티어 =톰캣 =>(3티어)
하나의 어플리케이션이 동작하려면 적어도 n티어 구조

????????????당신의 최종 프로젝트의 n티어 n차수였냐???????????????

raw데이터를 가공하기 위해 갖고올 때 쓰는 언어 SQL

김치찌개 만들기
- 김치, 파, 돼지고기 : raw데이터
- 냉장고 : DB
- 가져오기  : sql
- 레시피 : 로직
- 요리하는 도구들 : java, python
- 요리하는 주체 : 어플리케이션
- 김치찌개가 만들어지는 공간 서버
- 요리하는 모습은 손님한테 보이지 않음 : 백그라운드 모듈
- 김치찌개 : content
- 냄비 : html
- 손님 : 클라이언트

html - css - js, jquery(프레임워크) = 눈에 보이는 영역
java, python - sql = 눈에 안 보이는 영역

브라우저 = html언어를 번역해주는 번역기

1. 표준 브라우저로 크롬 사용
2. F12로 개발자환경 다양하게 활용할 것임
3. DB(오라클), WAS(톰캣), IDE(이클립스) 필요함

브라우저별로 렌더링 엔진이 다름
브라우저는 html 소스를 번역해서 화면을 그리는 역할을 함
그래서 타겟이 되는 브라우저를 먼저 선정해야 함

=====================================================

java se에는 서블릿이 없음 / 네트워크를 사용하지 않는 stand-alone application(어떤 환경에 종속되지 않음 <-> web application - 웹에 종속됨)
java ee는 있음

찾기 버튼 - sysdm.cpl - 고급 - 환경변수 - 시스템 변수 JDK추가 / PATH에 bin 추가

왜 자바의 메인 메서드는 public static void를 사용할까?
자바의 메인메서드를 작성할 때는 public static void main(String[] args){}구조로 작성합니다. 왜 이런 구조를 갖게 되었는지 살펴보겠습니다.

public
public은 접근제어자입니다. 어느 클래스에서든 해당 객체를 참조할 수 있다는 뜻입니다. JVM(Java Virtual Machine)이 접근 하기 위해서 public을 사용해야만 합니다. 다른 접근 제어자를 사용하면 프로그램이 실행되지 않습니다.

static
static으로 뭔가를 선언하게 되는 경우, 자바가 컴파일 되는 시점에 정의됩니다(클래스 로드). 그리고 static 요소를 non-static 요소에서 호출하는 것은 불가능합니다.
main 메서드는 프로그램의 시작점. 프로그램이 실행되면 제일 먼저 호출되는 메서드이기 때문에 객체를 생성하지 않은 채로 바로 작업을 수행해야 하기 때문에 static이어야 합니다

void
타입이 void라는 것은 반환할 것이 없다는 의미입니다. 즉, 메인 메서드를 호출하는 JVM(Java Virtual Machine)에서 반환값을 요구하지 않으니 void타입을 사용합니다(멀티 스레드를 염두했기 때문).

CUI환경 상 인자가 넘어온다면 문자열로 넘어옴. 그 인자를 받기 위해서 parameter타입이 String임
한 개가 넘어오는지 몇 갠지 몰라서 배열로 받음

=====================================================
정적 언어 : 컴파일 시 변수 타입이 결정됨
동적 언어 : 런타임 시 변수 타입이 결정됨

classpath
패키지 명에 왜 다 안 써져 있을까? ex) D:\sample\kr\or\ddit가 패키지가 아니고 kr.or.ddit인가?
클래스를 표현하는 방법 : HelloJava같이 짧게 kr.or.ddit.HelloJava처럼 길게!
긴 것이 실제 이름(qualified name = binary name)
근데 왜 이 이름이 kr부터인가? 묵시적인 classpath로 지정되어 있었기 때문에
그래서 classpath란? 1. 클래스를 찾아가기 위한 경로의 시작점 2. 특정 클래스를 찾아내기 위한 검색의 시작점
1.kr.or.ddit 디렉토리 만들고 java kr.or.ddit.HelloJava
2.javac -d . HelloJava.java
3.상위폴더 가서 java -cp sample.kr.or.ddit.HelloJava
javac -d . -cp . HelloJava.java
D:\B_Util> java -cp ..\sample kr.or.ddit.HelloJava

=====================================================

servlet spec
- 웹 상에서 요청을 받고
- 웹으로 응답하는 것
- 이걸 extends하면 자신도 웹 상에서 요청을 받고 응답할 수 있음
  
콜 바이 아규먼트
콜 바이 레퍼런스

catalina_home 톰캣 클래스패스

비표준포트넘버 사용 시 명시적으로 표현해주어야 함

ssl/tls : secure layer -> 오고 가는 것들 암호화. 그때 쓰는 프로토콜 -> https
이걸 쓰려면 서버의 인증서가 있어야 됨.
정상적으로 쓰려면 사업자 등록이 돼있어야 함.
openssl을 이용해서 가짜 인증서를 만들 수 있음

직접 로그파일을 보기 보다는 요즘은 로그 프레임워크를 많이 씀(log4j 등)

톰캣 WAS에서 가장 중요한 폴더는 webapps(app base = doc base)
A(Application) == context
톰캣은 5개의 application을 사용 중이다. = 톰캣은 5개의 context를 사용 중이다.
contextpath는 webapps 안의 폴더 경로? 이름?
논리적인 주소체계 = 도메인, localhost 등
url은 논리적인 주소 체계, 직접적인 접근은 보안상 안 됨
컨텍스트의 상대 경로 = 서버 사이드의 절대 경로

=====================================================

정적요청과 동적요청

WAS가 필요한 이유
웹 어플리케이션은 stand alone이 아니기 때문에 그걸 운영해줄 수 있는 주체가 있어야 함
서블릿 api - classpath를 추가로 빌려서 쓰려면 tomcat이 필요함

classes 해당 어플의 첫 classpath

=======================================================
javac -d ../classes Watch.java (-cp는 이미 환경변수로 설정해놨다는데?..)

=======================================================

서비스 계열 요청
Do 계열 요청(7개)

request방식이 get이냐 post이냐

========================================================

서블릿, jsp, mvc(1,2), solid, s(단일책임원칙 - mvc2)

========================================================

HTTP 포로토콜
캐쉬 
- 정적자원을 캐싱하려고 하는 버릇이 있는데 동적자원을 캐싱하려고 할 때도 있음
  - 이때는 동적 자원을 못 받아오는 경우가 있을 수 있음

=========================================================
junit - test 프레임워크
test경로 설정(library에서 클래스패스 중복을 피하기 위해)
=========================================================
LinkedHashMap
=========================================================
JavaScript ----> Server ----> Java
            |             |
    1.Marshalling         |
    2.Serialization       |
                    3.Deserialization
                    4.Unmarshalling
-> Content-Type은 Header에 있고
-> Json은 Body에 있다.

=> 데이터 통신은 1,2,3,4의 반복임
==========================================================

12.13

답장의 성공여부를 response라인에 status code로 알려줌(응답상태코드)
400 : bad request
404 : not exist
406 : not acceptable
왜 숫자로? 더 빠르고 이해하기 쉬우니까

내용 response.body = contents body = message body
답장할 때 내용이 어떤 형식인지, 어떤 언어인지 알려주는 것이 필요함
왜냐하면 브라우저가 json, xml, html, text 등 unmarhsalling을 해야 하기 때문에
이런 meta-data를 담는 곳이 response.header

line - status code
header - meta-data
body - content

status에 뭐가 있고, 어떻게 활용?
meta-data에는 뭐가 있고, 클라이언트에게 뭐를 제공해줄 수 있는지?
body의 데이터를 기록하는 방법?
  - servlet에서 mvc 1에서 resp.getOutputStream, resp.getWriter -> out.print();를 body에다가 적은 것

==========================================================

406 is returned by the server when it can't respond based on accepting the request headers (ie they have an Accept header which states they only want XML).
415 is returned by the server when the entity sent in a request (content in a POST or PUT) has an unsupported mediatype (i.e. they sent XML).
so.. 406 when you can't send what they want, 415 when they send what you don't want.

406 if an Accept header was sent you cannot fullfill.
415 if a Content-Type is sent you cannot use.

===========================================================

flask, spring - framework

브라우저는 정적 사이트를 한 번 로드하면 캐쉬 데이터를 저장해서 속도를 보완함
새로운 거 있다면 저장해놓은 거 안 쓰고 200번으로 새로 보내줌
300번대 코드는 캐쉬들을 뒤지거나 새로운 걸 보내주거나
response header의 meta-data를 사용해서 캐쉬하지 마라!!고 304 등과 관련됨

URI(URL, URN, URC)
URN : 같은 이름이면 안 됨, 주소록 등이 있어야 됨
URC : 머더라..
식별성이 없음 그래서 URL 많이 씀
URL : 새로운 자리로 옮겨갔을 때 Moved라는 상태 코드와 새로운 자리에 대해 알려줘야 함 -> location header(새로운 위치 설정됨)
300번대는 그렇기에 사용자가 다시 무언가를 해야 함(새로운 위치로 가기 위해서)

===========================================================

three-way hand shake?
인사가 오고 가야 대화가 시작됨
c -> s 인사
c <- s 인사
c <=> s 통로 만들어짐
-> 얼마나 많은 연결이 있을지 모름..포트를 개방해야 하는데 개방에는 한계가 있음(0~65535)
=> 그래서 쓸 데 없는 것들은 끊어버립 -> http는 connectless + stateless => 웹은 실시간 양방향 통신이 불가능함
=> 상태를 유지하지 않음 => 누가 누군지 모름(한 번의 요청과 또 다른 요청이 한 클라이언트에서 발생했는지 알 수 없음)
    ex) 상태를 저장하지 않으면 장바구니를 사용하지 못함
=> 그래서 필요한 것이 session과 cookie
즉, http의 connectless와 stateless 때문에 session과 cookie 기술이 필요하게 됨
웹 소켓에서 사용되는 것이 100번대, http1.1에서 나온 하위 것 => connection이 계속 유지되고 있음
실시간 알림을 위해 웹 소켓을 사용해야 함
(스마트뱅킹에서도 보안과 실시간성이 필요함)
https://socketsbay.com/test-websockets- 웹소켓은 의도적으로 잇고 끊을 수 있음(Time이 connect 시 pending으로 바뀌고 disconnect 시 시간이 찍힘)

===========================================================

cache
cache reader
cache는 실시간성이 없음

웹에서는 실시간성이란 건 실시간 모방
그래서 필요한 것이 갱신 주기, 갱신 주기에 맞춰서 새로운 요청을 보내줄 뭔가가 필요함

============================================================

jstl
el
으아으아

String.format(String formatter->컨버젼 어쩌고 뭐라는 건지...);


=============================================================

12.14

퍼포먼스!

클라이언트 -> 서버
- 포장규칙성에 의거한 request
클라이언트 <- 서버
- response
  - line : status code가 있는데 성공 실패 여부를 알려줌
  - header : body의 contents에 대한 content-type도 있음(meta-data 중)
  - body : 실질적인 contents


2번째 주제 : 300번대 코드
location
redirection

============================================================

custom tag는 라이브러리를 추가해야 하지만 action tag는 내장되어 있음

입력 데이터
입력 데이터 처리
출력 데이터

https://dololak.tistory.com/151

forward에서 buffer(1개) C -> S(A -> B) -> C 
include에서 buffer(1개) C -> S(A -> B -> A) -> C
redirect에서 buffer(2개) C -> S(A) -> C -> S(B) -> C

==============================================================

마샬링과 직렬화의 차이!!

serialization vs deserialization

=========

optional
stream api
method reference


4 layer architecture
3 tier
model2

==============================================================
flow control 방법

http의 기본 속성이 어떻게 쓰이느냐에 따라 달라짐!
dispatch : 위임 어쩌고 구조
- forward
- include
redirect - 로그인 처리 과정

feat.buffer~

autoflush
- 만약 버퍼가 1kb이고 보낼 것이 1.5kb일 때 버퍼가 꽉차면 방출하고 0.5kb를 다시 넣어서 방출
- 그렇지만 forward에서 한 번 내보내면 commit됨.
- 어쩌고 저쩌고 했는데 못 들음

===============================================================

12.15

restful이란
request의 식별성, 행위성 어쩌고

EDD(Event Driven Development)



===========================================================

12.16
44page까지 나감

- 이번 주말 과제 -

44page까지 정독!!
06번 폴더까지 만든 jsp, servlet 파일 보면서~

45page - 기본 객체(다음 주 월요일)
클라이언트에게 명시적인 데이터 넘길 때 파라미터로 보냈음
파라미터가 아니라 다른 페이로드로는 어떻게?

예외는 가장 첫 번째 문장을 읽기!!
마지막 문단 가서 첫 번째 문장 읽기!!


스프링
타일즈?
?
마이바티스

forward와 include는 둘 다 dispatch 방식
둘 다 버퍼를 사용한다.
플러시 여부!
버퍼가 잘못 사용되면 서버 사이드에서 발생한 예외의 정보를 클라이언트에게 제대로 전달할 수 없다.

============================================================

M/S

jquery 함수 만드는 법
1. selecting 없이 쓸 수 있는 것들(element 없이도 사용 가능)
$.ajax, $.each 같은 것들
$.함수이름 = function(element){
    element
}

2. selecting해야만 쓸 수 있는 것들
.data 같은 것들
$.fn.함수이름 = function(){
  ~
  //return this하면 또 다름
}


MARSHALLING
java : objectmapper
javascript : stringify
UNMARSHALLING
java : 
javascript : parse

jquery plugin은 이름만 플러그인이고 걍 함수임
jquery가 없다면 쓸 수 없다고 해서 plugin
jquery ajaxForm plugin 나중에 사용해보기

https://kwonyang.tistory.com/2
https://jongqui.tistory.com/9
https://noritersand.github.io/servlet/servlet-request%EC%97%90%EC%84%9C-payload-body-request-body-%EC%9D%BD%EA%B8%B0/
https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=cacung82&logNo=220488543117

@FunctionalInterface - 람다 쓸 수 있음

==================================================================

12.19

클라이언트와 서버
- 포장 규칙성(packaging protocol)
  - Request
    - Line
    - Header
    - Body
      - content -> payload
        - parameter X이고 json일 때!(사칙연산자 - enum, functional interface)
  - Response
    - Line
      - Status Code *****
    - Header
      - content-type
      - mime
      - refresh - 화면 lock
        - 동기에서 작동, 비동기에서는 작동 x
      - cache control, pragam, express(?)
      - location
        - http의 connectless, stateless
        - location으로 이용하는 redirection
    - Body
      - content
- 이동
  - dispatch
  - redirect
- 버퍼
  
클라이언트 미들티어 데이터 주고 받는 과정
- 파라미터 대신에 경로 변수
- restful
  - uri는 자원에 대한 식별자의 역할만 함
  - 그 자원을 가지고 뭘 하겠다는 건 메서드로
  - 돌아오는 응답데이터에는 자원 이외 꾸밈이 없어야 함(json, xml)


프레임워크를 만드려면 scope가 꼭 필요함

프레임워크로 응용하는 것


el문법


기본 객체
scope의 종류

자바스크립트 window, document 객체는 선언한 적 없는데 쓸 수 있음 -> 이런 것들이 기본 객체
jsp에도 기본 객체가 있음




===================================================================

 세션이란?

 - 유일하게 개방된 통로
	(sql developer, 커넥션, 유일하게 개방된 통로)
	세션의 생명주기
	- 어디서 생성되고
	- 언제 생성되느냐


stateless는 저장구조가 없게 만듬(선민아 저녁 먹었어?)

클라이언트 사이드에 저장되는 정보 = Cookie

서버 사이드에 저장되는 정보 = session
- 대화가 시작할 때 생성됨
- 클라이언트가 서버에 보내는 최초의 요청에 의해서 서버 쪽에서 session이 생김
- 클라이언트가 여럿이라면? 각자의 식별성이 필요해지는데 이것이 session id
  - 즉 각 session에는 id가 부여됨
- 재질문 시 (아까 물어봤잖아요)를 답해야 함, 이때 그 식별자를 다시 보내줘야 함
- 그 식별자를 통해 대화의 내용을 복원함
  - 즉 식별자를 서버 뿐만 아니라 클라이언트에서도 갖고 있어야 함(Cookie)
- 응답데이터에 session id를 보내는데 클라이언트에서는 Cookie에 그 id가 있음

- 재질문 시 선민이누나는 대화의 내용을 복원해야 함
- 복원해서 응답해줌

=> session의 트랙킹 모드(로 인해 session이 계속 유지됨)

- 세션의 생명주기
1. 최초 id
2. ㅁ
3. ㅁ
4. session 종료
  - 로그아웃 : 강제 세션 만료
  - 브라우저 끄기
  - 쿠키 지우기
    - 사용자가 쿠키를 지웠는지 여부는 알 수 없음
    - 그래서 서버는 일정 시간을 설정해둠(톰캣은 30분)
      - 이것이 세션 만료 시간


브라우저를 끈다라는 건 브라우저의 쿠키를 삭제한다는 뜻인데 명확하지 않음
최신 브라우저들은 자동으로 제거해줌. 옛날 것들은 장담할 수 없음

====================================================================

12.20

session은 통로, 연결

생명주기(언제 생성되고 언제 소멸하는지)를 알아야 함
트랙킹모드를 통해 유지함(session id 재전송)

mybatis sqlsession
- connection : 통로를 연결
- close : 통로를 끊는 것

web에서는 유일한 커넥션으로 사용할 수 없음
왜냐하면 connectless이기 때문에ㅑ
명시적으로 생성하거나 끊을 수 없음
그래서 session을 시간의 의미로 표현한다

한 사람의 사용자가 하나의 에이젼트(브라우저)를 이용해서
현재 서버를 이용한 순간부터(처음 요청)
더 이상 사용하지 않겠다고 한 순간까지

서버에서는 session의 id를 이용해 트랙킹 모드(재전송)를 사용함
cookie : 가장 많이 사용됨
- 클라이언트의 저장소에 저장되어 관리됨 -> 클라이언트가 이걸로 뭘 할지 모름
url
- session parameter -> query string처럼 => 편지 봉투에다가 session의 id를 써서 보냄 (보안 취약!!)
ssl(secure socket layer)
- 위 두 가지 모드를 보완
- secure! 클라이언트와 서버 사이에 오가는 모든 데이터는 다 암호화됨
- 편지봉투에도 암호화 -> 아무나 해석할 수 없음
- ssl을 이용하려면 암호화를 해야 함
- 암호화를 알아야 함
  - 크립토 유틸즈 같은 거
- 사용하려면 클라이언트와 서버가 신뢰할 수 있어야 함
- 신뢰하려면 인증서가 필요함

재전송되면 계속 유지되는 session
but 어느 시점이 되면 사라짐
언제 소멸?
- 직접 로그아웃 버튼을 눌렀을 때
- timeout을 기본적으로 설정해놓음
  - timeout 이상의 갭에서 아무 일도 일어나지 않으면 만료되었다고 봄
- 브라우저를 종료했을 때
  - 클라이언트가 브라우저를 종료한 그 즉시 session이 만료되는가?
  - 그건 아님. 브라우저를 종료하면 다음 번 요청이 발생하지 않음
  - timeout을 checking을 하는데 timeout이 끝나면 그제서야 만료됨
  
  쿠키를 지우고 다시 로그인하면 이전 session이 그 즉시 만료되는가?
  쿠키를 지웠는지 안 지웠는지 서버는 요청이 없다면 모름
  바로 session이 만료되는 것이 아니고 timeout을 checking하고 끝나면 만료됨
  
  => 바로 소멸시키는 건 직접 로그아웃 버튼을 누를 때밖에 없음 그래서 보안상 로그아웃하고 나가는 게 맞음


  메세지 버블링
  event propagation : bubbling 방식




  자동이 안 되면 수동으로! redirect를 수동
  eventHandler에서는 항상 event를 잡아놔라


=================================================================
  WEB-INF 안에 있는 web.xml은 자식 xml(서버의 web.xml이 부모 xml)

file file[] files

==================================================================
12.21
쿠키 : 최소한의 대화를 클라이언트에 저장하는 것

예외
exception 상속
runtime 상속

context : 서블릿 주변을 둘러싸고 있는 모든 것들
CAC(Context Aware Computing)

pageContext : 제일 먼저 생성되는 객체

객체의 주기 관리는 내가 아니라 서버가 갖게 됨

IoC(Inversion Of Control) : 제어의 역전
모든 프레임워크의 밑바닥에 존재하는 것
container

json 기반 토큰 인증 구조를 사용해서 session을 안 쓰기도 함
session이라는 개념이 없어지면 session scope를 사용하지 않게 됨
session이 많아지면 서버가 무거워져서 부하가 걸림

flash attribute

가변 파라미터


jstl
cookie
인증구조...
또 뭐..

optional
stream

SPA framework
react, vuejs, 

토큰 : 하나의 문장에서 의미를 가질 수 있는 가장 작은 단위?


SOP(Same Origin Policy)

================================================================
12.22
--어제
가장 먼저 만들어지는 page Context 기본 객체
다른 모든 객체에 대한 정보가 있음
요청 분기 방식으로 흐름 제어할 수 있음
영역 관리 기능

request
session
다 page context가 갖고 있음
setAttribute만 있는 게 아님
scope 상수를 던져서 4개의 scope 다 건드릴 수 있음

영역 관리 기능
scope의 종류 4가지, 속성, 생존 범위
scope의 실체는 저장공간 => 즉 자료구조, 그 중 Map
scope는 4개의 기본 객체의 Map

application은 싱글톤 객체, 전체를 아우름
session 한 사람의 사용자에 대한 것
한 사람에 대해 독립적으로 관리할 수 잇는 공간
request 요청
page 한 페이지

해당 기본 객체가 소멸될 때 해당 scope도 소멸됨

속성 제어 시 쓸 수 있는 set get remove attribute
시스템의 부하를 줄이려면 remove!를 써야 함
trash attribute 방식(?)

el, jstl

속성이 없을 때 표현식 사용하면 개불편
el을 사용하면 개편함
하지만 제어문의 형태가 없다
그래서 나온 core tag인 jstl을 씀
하지만 model1에서는 el과 jstl이 더 불편쓰

=========================================================================
기본 객체, el, jstl => view를 위한 것

model2에서 controller는 요청만 담당
view는 응답만 담당

서블릿에서 jsp로 데이터를 넘길 때 최소한의 scope를 사용해야 함
page scope X
session scope X
application scope X
이런 식으로!

adapter pattern(wrapper pattern)

el에서는 static 메서드를 호출할 수 있다.
-statice 메서드
-리턴 값이 있을 것
-import 되어 있을 것

요청하는 방식이 2군데 이상이면 2군데 다 바꿔야 함
요청하는 방식이 1군데면 하나만 바꿔주면 됨
유지보수 측면

calendar는 필드 나가서 한 번씩은 다 사용함!
해놓은 거 모아놓기

!!!자동이 안 되면 수동으로!!!
!!!변경사항은 발생하더라도 수정사항은 최소화시켜야 한다!!!
!!!클라이언트가 보내는 데이터는 절대 믿으면 안 된다!!!

============================================================

java.lang => 가장 기본적으로 쓸 수 있는 것들
common의 Lang

인증 시스템에서는 잘못된 사용자에 대한 정보를 갖고 있을 필요가 없다.
그래서 redirect로 한다.



로그인과 같은 인증과 관련된 방식(로그아웃일지라도)은 post방식으로 해야됨
안 그럼 프레임워크 안에서 무시됨


=================================================================

서버사이드에서 쿠키를 갖고 노는 것(포츈쿠키)
- 쿠키 객체 생성(알맹이가 있어야 하기 때문에 기본 생성자가 없음)
- 쿠키는 서버가 갖고 있으면 안 되고 클라이언트가 갖고 있어야 함
  - resp에다가 add해줌
  - add는 계속 늘릴 수 잇음???
  - 한 개의 쿠키에 여러 가지를 넣을 수 잇음???
  - L/H/B -> response의 header에 넣어야 함(L에는 status code / B에는 content)
- 브라우저가 받으면 자기 냉장고(쿠키 저장소)에 넣어둠
  - 브라우저마다 저장소가 다름
  - 그래서 세션도 브라우저마다 따로 갖고 있음
- 쿠키를 통해 대화의 내용을 복원해야 함
  - 클라이언트의 다음 번 request에다가 저장해놓은 쿠키를 넣어서 보냄
  - session 유지(재전송)와 같은 단계를 밟음
- 서버가 그 요청을 받으면 요청 데이터 안의 쿠키를 꺼냄
  - L/H/B -> request의 header에 넣어야 함
  - 쿠키는 즉 header가 그냥 저장될 뿐인 것임


session vs cookie

자바스크립트에서 쿠키를 갖고 노는 것

===============================================================
프레임워크들이
adapter패턴을 많이 사용함
문제가 주어지면 adapter 패턴을 사용해봐봐

================================================================
domain구조
3레벨 www.naver.com(GTLD)
4레벨 www.naver.co.kr(NTLD) - kr이 제일 높은 레벨
blog.naver.com - blog는 host라고 함(제일 하위 레벨)


쿠키가 전송될 때 무조건 전송되는 것이 아니고 domain이 같아야 함
.naver.com 으로 설정되어 있는 쿠키들은
email.naver.com
blog.naver.com같이
naver 아래의 호스트에서 전송됨

www에만 보내는 재전송 선별 구조가 있음

==================================================================
12.23

===개발 가이드라인===
하지 말라 많고
하라는 것도 많고
데이터를 보내는 방식은 반드시 post로 보내라
근데 디자이너는 a태그로만 만듬.. 그대로는 불가능
하지만 hidden form이라는 것을 사용하면 a태그 비활성화하고 form 보내기

창호가 여러 개면 하나로 통일해라~
요청과 관련된 조건이 변경되더라도 기타의 a태그들은 건드릴 필요가 없어짐
대신 form을 통해!!! -> 변경사항에 유연하게 대처할 수 있음

여러 흐름 제어 구조를 통해 인증 구조를 만듬(dispatch, redirect 등)
a태그는 요청을 직접적으로 발생시키지 않음
hidden form!!!!


대조형 질문으로 많이 들어옴
쿠키 vs 세션
http의 단점 stateless 특서엥 따라 대화 유지가 안 돼서 누군가 기억해야 하는데
서버가 기억해야 한다면 session, session scope에 저장된 attribute
클라이언트가 기억해야 한다면 cookie
- 백단에서 어떻게 만들고 복원할 것인가?
- 필요하다면 프론트에서도 만들 수 있음


1. 쿠키 객체 생성
- 쿠키가 갖고 있는 상태 정보
  - name
  - value(중요)
    - 쿠키는 header로 감. 해당 문자열에 특수 문자가 있으면 인코딩을 해야 함... 상태복원을 한다면 디코딩
- optional
  - domain
    - 다음 요청에 포함시켜 재전송할지 여부
    - ??구조 활용
  - path
    - 다음 요청에 포함시켜 재전송할지 여부
    - depth구조 활용
*name이 식별자로서의 역할을 하지 않음!!!!
- name, value, domain, path 등까지 완전히 같아야 같은 것으로 인정

====================================================================

3 Tier에서
WAS와 DB의 문제!
- Client와 WAS의 포장 규칙성은 HTTP
- WAS랑 DB는???...
오라클에서는 둘 간의 통로를 어떻게든 수립하고 데이터를 주고 받았음
근데 회사가 힘들면 공짜인 MariaDB나 MySql.. 그럼 다 바꿔줘야 함
우리가 만든 application이 DB에 종속성이 생기게 됨
그렇게 되면 결합력이 높아지게 됨
HCLC원칙 - 결합력은 낮추고 응집력은 높여라
결합력이 높을 때 A가 바뀌면 B도 바껴야 하기 때문이다.
그걸 해결하기 위해 Interface가 필요함
Interface만 동일하면 그걸 사용하는 사람은 그냥 사용하면 됨
DB들의 사용법을 동일한 Interface로 통일하면 되는 일!

jre-rt.jar-java-sql에는 인터페이스밖에 없음
벤더(vendor) 안에 구현체가 포함됨
C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib
오라클 폴더 안에 ojdbc라는 드라이버가 있음
이것이 구현체이다.

인터페이스에 맞게 코드를 짜야 DB에 동속되지 않을 수 있음
그게 SQL


jquery trigger


그냥 clean은 정적자원 재배포
clean tomcat work directory는 전체 서블릿 소스 재작성

factory object design pattern
adapter(wrapper) pattern
singleton pattern

자바 소스가 아니면 컴파일 할 필요가 없다.
그래서 properties 파일은 컴파일 안 한다.


=================================================================

인터페이스를 왜 사용하는가? 
왜 인터페이스 분리의 원칙이 있는가?

사용목적
1. 협업 가능
- 인터페이스가 없었더라면 다오가 만들어지기 전까지 컨트롤러를 만들 수 없음
- 인터페이스가 있으면 컨트롤러를 먼저 만들 수 있음
2. 실행 코드의 캡슐화 -> 결합력 낮춤(HCLC)
- 실행 코드가 우리 눈에 안 보임

인터페이스를 분리하기 전과 후의 실제 경험을 문장으로 엮기

==================================================================

Service에 안 넣고, 왜 컨트롤러나 다오에다가만 넣는지 모르겠음.. service에 넣으면 될 것음

컨트롤러와 서비스 사이의 의존관계가 만들어져야 함

메서드 레퍼런스

===================================================================

Presentation layer -> View
Controller layer -> Controller / 주문만 받고 검증만 함
Business Logic layer(젤 중요) -> Service(주방장), 레시피대로 요리
Persistence layer -> DAO / 로직을 가지면 안 됨(요리 못함 ), 데이터에만 접근
Domain layer -> VO

Raw Data - 날 것...데이터베이스의 자료
Information(Model) - Recipe대로 요리한 것
Contents - 고객이 받아보는 요리

전형성이 보이는 것은 코드화 시킬 수 있음 -> 프레임워크(MyBatis, Lombok, Spring, React, Vuejs, jQuery)
DAO -> MyBatis(dao만 지원함) = Persistence Framework라고 부름
Domain -> VO(java Beans 규약 -> 전형성, 규칙성 -> Lombok), Properties
Controller -> Spring
View -> React, Vuejs, jQuery(좀 더 불편..)
* Service에는 전형적인 패턴이 존재하지 않아서 Framework가 없음, 미리 만들어놓을 수 있는 코드가 없음

이 Framework가 어떤 식인지 먼저 알아야 함(Diagram을 그려놓고 어느 곳에서 지원해주는가 보는 게 중요)

=========================================================================
메서드의 시그니처를 바꾸게 되면 많은 곳을 바꿔야 함
예를 들면, DAO의 한 메서드의 파라미터를 바꾸게 되면 interface, service interface, service impl, controller 다 바꿔야 함. 이것이 결합력

==========================================================================
sql injection 공격 방법=> asd' OR '1'='1
https://www.kisa.or.kr/2060204


#param# / $text$
{param} / ${text}

============================================================================

최프 때 다이어그램을 그려라

container : 객체의 생성과 소멸을 관리하는 것
sprin container

lsnrctl status

웹 어플 만들 때는 connection pooling이 필수임


객체 pooling도 많이 씀!!!! 알아두길
https://commons.apache.org/proper/commons-pool/
요기 코딩 한 번만 해봐!!!!


===================================================================  
2022-12-26

쓰레기 코드(중복 코드)가 나가버리면 DAO에 남는 게 별로 없음..
-framework-
MyBatis: DAO와 DB를 사이에서 여러 역할을 하는 프레임워크 - reflection
Lombok : VO를 만드는 데에 지원해주는 프레임워크 - reflection => 라이브러리하더라...
Hybernate / Validator : 제약조건 만드는 데에 지원해주는 프레임워크 - reflection
Spring : Controller 프레임워크
Tiles : View를 만드는 데에 지원해주는 프레임워크

제약 조건은 반영 못함

도큐먼트 만드는 이유
1. 의도 전달
2. 미리 코드 설계(나중에 코드 넣기가 더 쉬워짐)


MyBatis - 템플릿 어쩌고 디자인 패턴
sql 맵퍼, 데이터 맵퍼, ?
reflection 사용

추상 메서드 - 형태가 고정되어있지 않음, 구현 안 돼있으면 인스턴스 생성X

Arrays.stream()

=========================================================================

고정된 순서가 있는데 일부 코드가 달라져야 할 때 template method를 쓴다.
자세한 건 사진 참조
후크메서드
템플릿메서드 final로 고정(후크메서드 순서대로)
아무 때나 쓸 수 있는 건 아니고, 전형적인 순서가 있는 작업을 할 때!
JDBC..

reflection은 아주 중요하다!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
프레임워크 이해하기 위해 사용한 것
필드 나가서는 직접할 때 거의 없을 것
붕어빵틀은 없는데 붕어빵만 있을 때, 붕어빵틀을 찾아내자!

===============================================================================
maven - 빌드관리툴 - 중앙저장소라는 걸 갖고 있고 pom.xml(유일한 설정파일)에 설정 가능함
1. template project 지원
2. 의존성 관리 기능
- jar파일
plugin -> maven이 쓰는, 라이프 싸이클에서 사용하는 것
dependency -> 우리가, 코드에서 사용하는 것

ivy, grade 등등 다 빌드관리툴


svn - 형상관리 서버

sysdm.cpl


플러그인
설치 / 환경변수 / preference에서 maven-installation 메이븐 폴더 맞춰주기 / usersettings에서 repository 바꾸기
선생님 교재 참고

==================================================================================

2022-12-27

placeholder - 똑같은 기호라도 어디에서 사용하는가에 따라 달라짐

벤더가 제공해주는 어쩌고가 뭐야 그걸로 바로 받는다던대

maven에서 scope => 개발 영역, test-테스트만 / provided-배포 시 버림 / 생략, compile-전 영역 / runtime-개발 시 사용x / system-권하지 않음

Object-Oriented applicatoin
Relational Database
M





maven으로 불러와서 안 되면 라이브러리에 일일이 class열리나 확인하기. 안 되는 거 뭐가 있나 확인 후 qualifiedname 복사, 탐색기에 마지막 파일 이름 지우고 붙여넣기, 상위폴더 가서 지우기, 프로젝트에서 maven update project, 되나 보기

=========================================================================================
connection - DB에서는 session

pom.xml -> dbinfo.properties -> mabatis-config.xml -> mapper(memo.xml) -> MybatisUtils.java ->

facet 패턴


라이브러리 - 설정파일(무)
프레임워크 - 설정파일(유)


============================================================================================
log4j 사용방법


log메세지 일괄관리


Try-with-resources

=============================================================================================
1. domain layer 설계
2. mybatis(member.xml)
3. dao
4. service
5. controller
6. view

===============================================================================================
Call By Reference
Call by 

=============================================================================================

12.29
beanutils가 뭐하는 애인가?
ValidationUtils 다시 보기?
factory객체는?
.stream.forEach()~~~는??
람다식, 익명객체, 익명메서드(?)????
sqlsession이 하는 일은?
트랜잭션 다시 보기
innerjoin?
======================================================================================================
12.30

paging 알고리즘
내가 따로 구해보기

ROWNUM(의사 컬럼)

paging에는 항상 두 개의 쿼리문이 있어야 함(전체 조회가 무조건 있어야 함?)

@Slf4j
log.info(~~~);


oracle -> postgre

조건절은 INLINE VIEW에 넣는 게 아니다?
LIKE '%은대%' -> 속도가 좀 떨어지는 편 %%(패턴 매칭) 때문에

OGNL

창구의 단일화 => hidden form

======================================================================================================
SAAS

code fragment

call by reference


======================================================================================================
postgres 해보기