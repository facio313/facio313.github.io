scope 영역
- page(jsp)
  - ex) 대전
- request
  - ex) 대한민국
- session
  - ex) 아시아
- application
  - ex) 지구

request의 중요한 내장객체
정말 중요
1. pageContext(page scope)
2. request(request scope)
3. session(session scope)
4. application(application scope)
   
중요한 메서드
setAttribute(String name, Object value);
getAttribute(String name);
getParameter(String name);
---
1. response
2. out


스크립트 태그
<%! %> 선언문(전역 변수 + 전역 메서드 정의)
<%  %> 스크립틀릿(자바 문법)
<%= %> 표현문(값 화면 출력)

요청파라미터, http 파라미터, query string 다 같은 말

- 패킷을 어떻게 전송할지 정하는 프로토콜 중 하나 HTTP
- 클라이언트가 서버에 request를 보냄

request 안
- 자원식별(명사) - URI, URL - 무엇을
- method(동사) - get, post - 어떻게 하기 위해
  - CRUD를 하기 위해서는 get, post만 있어서는 안 됨
    - C = post
    - R = get
    - U
    - D
- meta data(부사, 형용사 등)

편지와 같음
- 편지지
- 편지봉투

Request Line
- URI, URL
- method
Request Header
- meta data
  - Accept★★★★★★★★★★★★★★ : 클라이언트는 이런 식으로 응답을 받겠다!
  - Accept-Encoding : 아무렇게나 압축해서 보내면 클라이언트는 못 알아듣는다, 이렇게 보내니 너도 이렇게 보내죠라
  - Accept-Language : 응답 시 이런 언어로 말해죠라~ locale code(언어, 지역)
  - Cache-Control : 캐싱을 어떻게 할 것인가?! jsp에 대해선 no-cache로
  - Connection : 기본적으로 HTTP-connectless방식
      - keep-alive하면 연결을 살려준다!
      - HTTP-connectless는 너무 비효율적이다! 절반 정도면 켜두겠다. - keep-alive
      - 서버와 브라우저 같의 약속이라 개발자가 건드리는 게 아님
      - connectless만 기억하삼(forward와 redirect의 결정적 차이점을 만들어내는 것)
      - Request Body(해당 자원을 가지고 뭘 할 거냐에 따라 달라짐 - method의 종류에 따름)
  - cookie★★★★★★★★★ : 클라이언트쪽에 저장되는 것(관리 권한이 클라이언트쪽에 있다), JSessionID가 먼지는 몰겠지만 서버로 계속 전송됨(서버에서 만들어짐)
    - 세션 트랙킹 모드 : 클라이언트와 서버가 같이 사용할 수 있는 것
    - session은 cookie와 쩔어질 수 없는 개념 -> 로그인한 상태에서 쿠키를 지우고 새로고침하면 로그아웃됨
  - User-Agent★★★★★★★ : 현재 클라이언트가 사용하고 있는 시스템 정보
    - 밸런싱 서버가 요청을 받고 클라이언트가 어떤 환경에서 요청을 보냈는지 파악한 후 redirect해서 각 환경에 맞는 곳을 가리킴
      - ex) 휴대전화로 naver.com에 접속하면 네이버의 밸런싱 서버는 휴대전화임을 알아낸 후 m.naver.com으로 redirect한다.
Request Body
- 존재할 수도 - post
  - C(reate)
  - U(date)
- 안 할 수도 - get
  - R(etrieve)
  - D(elete)

get과 post는 표준 메서드

request 안의 parameter만 잘 꺼낸다고 능사가 아님
request 기본 객체 잘 보기!

캐쉬 
- 정적자원을 캐싱하려고 하는 버릇이 있는데 동적자원을 캐싱하려고 할 때도 있음
  - 이때는 동적 자원을 못 받아오는 경우가 있을 수 있음
- 피시방 같은 곳에서 하면 보안 문제 가능성

request의 패키징 규칙
메서드 종류
바디의 존재 여부
등등!! 매우매우 중요

preflight request - options
- 상대가 post, get 같이 공통적인 게 아닌 다른 메서드를 받아들일 수 있는가에 대해 알아보기 위해 사전 요청을 취해보는 것?

★★★★★★get방식에서 한글이 깨지면 서버의 connector!!!  usebody~~ 시점을 뒤로 미룸