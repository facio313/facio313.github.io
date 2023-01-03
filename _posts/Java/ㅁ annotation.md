annotation
meta annotation
marker interface : 메서드가 없는 annotation
marker annotation : 속성이 없는 annotation

 * annotation -> 개발자와 시스템에게 일정 정보를 제공하는 주석의 한 형태(comment -> 사람 대상)
 * 
 * marker annotation @WebServlet
 * single value annotation @WebServlet("/member/memberInsert.do") -> 속성의 이름이 value일 때만 가릴 수 있음
 * multi value annotation @WebServlet(value="/member/memberInsert.do", loadOnStartup=1)
 * 
 * custom annotation
 * 1. @interface 키워드로 선언된 클래스 정의
 * 2. RetentionPolicty를 통해 어노테이션의 사용 범위 설정
 * 3. Target으로 어노테이션 적용 대상 설정

