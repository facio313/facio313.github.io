---
layout: post
title: Properties
description: 여러 설정 정보 등을 저장하는 properties에 대해 알아보자
date: 2022-10-31
published: true
categories: Java
tags: [properties, 환경설정]
---

# Properties
- 매개인자 등을 저장하는 확장자 파일로 애플리케이션의 환경 설정 정보, DB 연결 정보 등을 주로 저장한다.(xml, yml과 비슷하다)
- 설정 정보 등은 바뀔 수 있어 하드코딩하지 않고, 변경 시 재컴파일을 막을 수 있기에 사용한다.
- Hashtables의 하위 클래스인 Properties는 Map으로 Key와 Value를 갖고, 차이점으로 FileIO를 지원한다.

***

# 작성 예시
원래는 영어, 숫자, 특수문자.....만 됨
properties 문서는 'key값=value값'형식으로 작성합니다.
이 문서는 JDBC에서 사용할 DB접속정보를 저장한 문서입니다.
```
driver=oracle.jdbc.driver.OracleDriver
url=jdbc:oracle:thin:@localhost:1521:xe
username=in91
password=java
greeting=hello
```

***

# 사용 순서
1. 읽어온 정보를 저장할 Properties 객체를 생성한다.
2. 읽어올 파일명을 이용한 File 객체를 생성한다.
3. 파일 읽기를 수행할 FileInputStream 객체를 생성한다.
4. Properties 객체로 파일 내용을 읽는다.
5. 읽어와 key, value로 분류한 후 Properties 객체에 담아준다.
6. 읽어온 데이터를 출력 시 key 값만 읽어와 Enumeration, keySet, iterator 등을 이용한다.
   
***

# 예시
```
    Properties **prop** = new Properties();
    File file = new File("res/db.properties");
    
    try {
        FileInputStream fis = new FileInputStream(file);
        **prop**.load(fis);

        Enumeration<String> keys = (Enumeration<String>) **prop**.propertyNames();
        
        while(keys.hasMoreElements()) {
            String key = keys.nextElement();
            String value = **prop**.getProperty(key);
            System.out.println(key + " : " + value);
        }
        
        System.out.println("출력 끝...");
        
    } catch (IOException ex) {
        ex.printStackTrace();
    }
```
### JDBC Util에서 활용 예시1
```
    static Properties **prop**; // Properties객체변수 선언
	
	static {
		
		**prop** = new Properties();
		
		try {
			**prop**.load(new FileInputStream("res/db.properties"));
			
			Class.forName(**prop**.getProperty("driver"));
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패!!!");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
    public static Connection getConnection() {
		try {
			return DriverManager.getConnection(
					**prop**.getProperty("url"), 
					**prop**.getProperty("username"), 
					**prop**.getProperty("password"));
		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}
```
### JDBC Util에서 활용 예시2
```
	static ResourceBundle **bundle**;
	
	static {
		
		**bundle** = ResourceBundle.getBundle("db");
		
		try {

			Class.forName(bundle.getString("driver"));
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패!!!");
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection(
					**bundle**.getString("url"), 
					**bundle**.getString("username"), 
					**bundle**.getString("password"));
		} catch (SQLException ex) {
			ex.printStackTrace();
			return null;
		}
	}
```
