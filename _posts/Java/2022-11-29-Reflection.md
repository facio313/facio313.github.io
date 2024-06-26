---
layout: post
title: Reflection
description: JDBC할 때 쓰던 Reflection! 그게 무엇이고, 대체 왜 쓰는 것인가?!
date: 2022-11-29
published: true
categories: Java
tags: [리플렉션, relfection, java]
---
JSP MemberDAOImpl 참고
JSP ReflectionDesc 참고
# Reflection
구체적인 클래스 타입을 알지 못해도 그 클래스의 메서드, 타입, 변수들에 접근할 수 있도록 해주는 자바 API이다. 런타임에 실행되고 있는 클래스를 가져와서 실행해야 하는 경우 동적으로 객체를 생성하고 메서드를 호출하는 방법으로 자바의 리플렉션은 클래스, 인터페이스, 메서드를 찾을 수 있고, 객체를 생성하거나 변수를 변경하거나 메서드를 호출할 수 있다.

불확실성을 기반으로 하는데, 언제나 예외가 생길 수 있음.

### 정리
- 클래스의 정보(타입, 메서드, 변수)를 알 수 있다.
  -  PC - Mainboard - CPU, GPU, Memory의 상속구조를 갖는 클래스들이 있다.
  -  CPU일 때, Mainboard의 클래스 정보를 알고 싶다!
  -  이때, 리플렉션 기법을 사용하면 된다~

### 적용
- MyBatis: DAO와 DB를 사이에서 여러 역할을 하는 프레임워크
- Lombok : VO를 만드는 데에 지원해주는 프레임워크
- Hybernate / Validator : 제약조건 만드는 데에 지원해주는 프레임워크

### 구체적인 상황
코드를 작성할 시점에는 어떤 타입의 클래스를 사용할지 모르지만, 런타임 시점에 지금 실행되고 있는 클래스를 가져와서 실행해야 하는 경우, 프레임워크나 IDE에서 이런 동적인 바인딩을 이용한 기능을 제공한다. intelliJ의 자동완성 기능, 스프링의 어노테이션이 리플렉션을 이용한 기능이다.

## Class : PC -> Mainboard -> CPU, GPU, Memory
```
public class Mainboard extends PC {
    String madeBy = "";
    int age = 0;
    int usage = 0;

    public Mainboard(){
        super();
        madeBy = "reference";
        age = 1;
        usage = 1;
    }

    public void setUsage(){
        this.usage = 35;
    }
}
```
### 생성자 찾기
```
Class mainboard = Class.forName("Mainboard");
Constructor constructor = mainboard.getDeclaredConstructor();
```
- forName은 클래스 객체를 갖고오는 메서드
- getDeclaredConstructor()를 이용해 클래스로부터 인자가 없는 생성자를 가져올수 있다.
### 메서드 찾기
```
Class mainboard = Mainboard.class;
Method[] methodList = mainboard.getDeclaredMethods();    
System.out.println(methodList[0].invoke(mainboard.newInstance())) // 35
```
- invoke() 메소드를 사용하면 Method 객체를 실행할 수 있다.
- 첫번째 인자는 호출하려는 객체, 두번째 인자는 전달할 파라미터 값을 준다.
### 필드 가져오기
```
Class mainboard = Mainboard.class;
Field[] field = mainboard.getDeclaredFields();

Mainboard mainboard = new Mainboard();
field[0].set(mainboard, "galaxy");
System.out.println(field[0].get(mainboard));  // galaxy
```
- set() 메소드를 사용해서 객체의 변수를 변경할 수 있다..
### 필드 변경
```
Class mainboard = Mainboard.class;
Field[] field = mainboard.getDeclaredFields();
System.out.println(field[0]);   // 출력 : String reflection.Mainboard.madeBy
```
## JDBC에서 쓰이는 경우
### 드라이버 로딩
```
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
```
- OracleDrive클래스의 객체를 갖고 와서 사용하게 된다!
  - **갖고 오면 Connection 객체를 쓸 수 있게 된다.**
- 자바와 오라클은 완전히 다른 시스템이기 때문에 드라이버를 불러와야 한다.
   