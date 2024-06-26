---
layout: post
title: Template Method
description: Design pattern 중 하나인 Template Method pattern에 대해 알아보자
date: 2022-12-26
published: true
categories: DesignPattern
---
# Template
템플릿이란 정형화된 틀을 말한다. 어떤 것을 만들 때 안내 역할을 하는, 사용상의 형식으로 형판, 형틀 등을 뜯한다. 특정한 서식 구조를 만들어놓은 양식으로 프로그래밍을 할 때도 적용될 수 있다.

## 발단
코드에도 정형화된 pattern이 존재한다. 예를 들어 MVC Model2 구조에서 DAO에는 다음과 같은 코드들이 반복적으로 진행된다.
```
StringBuffer sql = new StringBuffer();
sql.append(" 쿼리문 ");

try(
    Connection conn = DriverManager.getConnection(url, user, password);
    PreparedStatement pstmt = conn.prepareStatement(sql.toString());
){
    ResultSet rs = pstmt.executeQuery(); // executeUpdate();
    while (rs.next()) {
        // rs 객체를 꺼내 담거나 표현할 코드
    }
    return;
} catch (SQLException e) {
    throw new RuntimeException(e);
}
```
위 코드에서 정리를 해보자면 다음과 같다.
1. 쿼리문을 작성한다.
2. Driver을 통해 DB에 연결하는 Connection객체를 생성한다.
3. 쿼리문을 실행하는 PreparedStatement객체를 생성한다.
4. ResultSet에 결과를 받아온다.
5. ResultSet의 결과를 꺼내 쓸 객체에 담는다.
6. Connection, Statement, ResultSet을 종료한다.

위 과정은 DB와 연결하여 원하는 raw data를 받아오는데 동일하게 쓰이는 것이다. 

그렇기에 DAO에 여러 CRUD가 있다면 중복된 코드는 쓰레기 코드가 된다. 코드 간결화, 가독성의 이유로 중복된 코드는 좋지 못한 인식과 불필요한 메모리 사용을 야기한다.

또한 Connection의 경우 여러 과정에 있어서 부하가 큰 작업이다. 서비스를 하며 여러 CRUD가 난무하게 되는데 그때마다 Connection 객체를 만들어 DB와 정보를 주고 받게 된다면 서버가 다운될 수도 있다. Connection pool 기술인 DBCP 라이브러리 등을 사용하여  부하를 줄인다.(나머지는 Connection pool 게시글을 참고하자)

중복과 반복이 많고 순서가 고정되어 있다면, 즉 정형화된 특정 pattern이 존재한다면 그것에 Template pattern을 적용할 수 있다.

## 설명
Template Method pattern를 GoF Design Patterns에서는 다음과 같이 정의한다.
- 알고리즘의 구조를 메소드에 정의하고, 하위 클래스에서 알고리즘 구조의 변경없이 알고리즘을 재정의 하는 패턴이다. 알고리즘이 단계별로 나누어 지거나, 같은 역할을 하는 메소드이지만 여러곳에서 다른형태로 사용이 필요한 경우 유용한 패턴이다. 즉 다형성과 관련된 디자인 패턴이다.

전제
1. 고정된 순서의 단계가 있는 작업
2. 순서는 같은데 특정 작업에서 해야 하는 형태가 다양하다.(다 같으면 적용 안 해도 됨)
  
Toby Spring은 다음과 같이 정의한다.
- 상속을 통해 슈퍼클래스의 기능을 확장할 때 사용하는 가장 대표적인 방법. 변하지 않는 기능은 슈퍼클래스에 만들어두고 자주 변경되며 확장할 기능은 서브클래스에서 만들도록 한다.

1. 슈퍼클래스(템플릿 클래스) : 순서가 고정된 전반적인 구조(template method + hook method)
2. 파생클래스 : 슈퍼클래스의 메서드에서 변경 사항이 일어나는 부분
3. template method : 알고리즘을 구성하는 메서드 목록과 그 호출 순서를 고정하고 서브클래스가 꼭 오버라이드해야 할 추상 메서드이다.
4. hook method : 추상 클래스에 들어있는(전체가 추상 메서드는 아니다), 아무 일도 하지 않거나 기본 행동을 정의하는 메소드로, 서브 클래스에서 오버라이드 할 수 있다. 추상클래스에서 구현되는 메서드긴 하지만, 기본적인 내용만 구현되어 있거나 아무 코드도 들어있지 않은 메서드이다.
```
public abstract class TemplateClass {

//	template method
	public final void template() { // 이것만 public -> 유일하게 쓸 수 있는 메서드
		stepOne();
		stepTwo();
		stepThree();
	}
	
//	hook method
	private void stepOne() {
		System.out.println("1단계");
	}
	protected abstract void stepTwo();
	
	private void stepThree() {
		System.out.println("3단계");
	}
}
```
슈퍼클래스의 경우 실체 간 공통 특성을 추출한 추상 클래스로 만들어 상속을 통해 자식클래스만 만들게 한다. 클래스 안에 template method를 만들어 순서를 고정시키고, final로 만들어 다른 곳에서 바꾸지 못하게 한다. 그 밑에 hook method를 만드는데, 그중 바꾸지 못하고 상속으로만 재정의할 수 있는 추상 메서드를 만든다. 다음과 같이 재정의할 수 있다.
```
public class DerivedClass1 extends TemplateClass {

	@Override
	protected void stepTwo() {
		System.out.println("A방식으로 구현된 2단계");
	}
}
```
```
public class DerivedClass2 extends TemplateClass {

	@Override
	protected void stepTwo() {
		System.out.println("B방식으로 구현된 2단계");
	}
}

```
자식 클래스에서 공통된 메서드인 stepTwo로 분류하여 다르게 재정의하였다. 이것을 main을 만들어 확인하면 다음의 결과가 나온다.
```
import java.util.Arrays;

public class Playground {
	public static void main(String[] args) {
		TemplateClass[] array = new TemplateClass[] {new DerivedClass1(), new DerivedClass2()};
		Arrays.stream(array).forEach(TemplateClass::template);
		
	}
}

# 1단계
# A방식으로 구현된 2단계
# 3단계
# 1단계
# B방식으로 구현된 2단계
# 3단계
```
이것 말고도 학생을 통해 예시를 들 수 있다. 학생(추상 부모 클래스)은 학교생활(template method)이 정형화되어있다. 등교(hook method1)를 하고 각자의 반에서 공부(abstract hook method2)하며 하교(hook method2)한다. 등교하고 공부한 후 하교하는 흐름은 같지만 반에서 공부하는 방식은 모두 다를 것이다. 근면성실하게 하는 학생(자식 클래스)이 있는 반면, 게으르게 하는 학생(자식 클래스)도 있다. 각자 공부하는 방법(override method2)이 있어서 보여주는 공부법도 다르다.

위에서 봤듯이 DAO에서는 정형화된 코드 방식이 존재한다. 그렇기에 이것을 쉽고 깔끔하게 만들어주는 MyBatis라는 framework가 존재한다. 이러한 것을 직접 만들어보자. => MyBatis 게시글
