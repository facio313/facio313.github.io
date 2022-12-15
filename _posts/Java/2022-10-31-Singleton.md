---
layout: post
title: Singleton
description: 디자인 패턴, 싱글톤을 왜 사용하는지 알아보자
date: 2022-10-31    
published: true
categories: Java
tags: [Singleton, 디자인패턴, 싱글톤]
---

# Singleton pattern
  - 객체(인스턴스)를 한 개만 만들어지도록 하는 프로그래밍 방법
  - new 생성자()로 인스턴스를 만들지 못하고 아래 사용 방법을 이용해야 한다.
   
- 장점
  - 객체 생성 시마다 메모리 영역을 할당 받아야 하는데 한 번만 만들어 쓰므로 메모리 낭비를 방지한다.
  - 싱글톤 인스턴스는 static 전역 객체여서 다른 클래스에서도 데이터 공유가 가능하다.
   
- 단점
  - 많은 데이터를 공유시켜 다른 클래스들 간의 결합도가 높아져 객체 지향 설계 원칙 중 '개방-폐쇄 원칙'에 위배된다. 
  - 멀티 스레드 사용 시 동기화 처리가 안 되면 인스턴스가 2개 생긴다.
   

# Singleton 클래스 생성 방법
1. 자기 클래스의 참조 변수를 멤버 변수로 선언한다.(이 변수는 private static으로 지정한다)
   
2. 생성자를 private으로 한다.(외부에서 생성자에 대한 접근을 막는다. 즉, 외부에서 new 키워드를 이용하여 객체를 생성하는 것을 막기 위해서)
   
3. 객체(인스턴스)는 내부에서 생성하여 이 생성된 객체를 받환하기 위한 메서드를 만든다.(이 메서드의 접근 제어자는 static, 이름은 보통 getInstance()로 지정한다.)
   
    ```
    // Interface는 Class로 바꿔도 된다
    private static Interface 변수; 
    private 생성자() {

    }
    public static Interface getInstance() {
        if (변수 == null) { //  아직 한 번도 객체가 생성되지 아니함
            변수 = new 생성자();
        }

        return 변수;
    }
    ```
   
# Singleton 클래스 사용 방법
- 타 클래스에서 사용하는 방법
   
    ```
    private Interface 변수;
    변수 = 구현클래스.getInstance();
    ```
   
- JDBC 예시 - Dao에서 싱글톤을 사용한 뒤 Service도 싱글톤을 만들 때
   
    ```
    private DaoInterface dao;
    private static ServiceInterface service;
    private Service생성자() {
       dao = Dao구현클래스.getInstance();
    }
    public static ServiceInterface getInstance() {
        if (service == null) {
            service = new Service생성자();
        }
        return service;
    }
    ```