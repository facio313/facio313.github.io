DTO
data transfer object
필드, getter/setter(존재 시 가변)만 존재
레이어(controller service 등) 간 전달용 객체
속성값이 모두 같다고 해서 같은 객체가 아님

VO
value object 
표현용 객체이기 때문에 불변객체임
생성자를 이용해 값이 부여됨
속성값이 모두 같으면 같은 객체
getter/setter 이외의 로직 가질 수 있음