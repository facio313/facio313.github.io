https://rlakuku-program.tistory.com/19

패키지 : 자바의 집합
라이브러리 : 패키지의 집합(실체)
api : 이런 라이브러리를 제공해주는 것(경로)
라이브러리 - 설정파일(무)
프레임워크 - 설정파일(유)


framework vs library
=> IOC 패턴이 적용되어 있느냐 아니냐에 따라 다르다.
그럼 IOC가 머냐?
=>

framework : 개발자를 틀 안에 가두는 것
다른 형태의 코드가 나올 수 없음
지 맘대로 개발 못함
=> IOC가 적용이 됐느냐 아니냐
Inversion ov Control(제어의 역전)

IOC 머냐? => 제대로 답 못함 => Dependency Injection이라 하자(Solid의 d)

새로 만들지 말고 주입 받아라
톰캣=Servlet Container
누군가 Servlet을 객체화 시켜야 함
내가 안 해도 메서드들을 쓸 수 잇었음
그럼 누가?? => Servlet객체는 톰캣이 만들었다.
그걸 주입받아서 써왔던 것(request, response 등등)

즉 역전된 제어권이란 객체를 생성하는 제어권임
개발자의 객체 생성에 대한 권한이 자신이 아닌 다른 대상(Container)으로 옮겨가는 것

Container를 이해하느냐 못하느냐에 따라 실력이 많이 다름

