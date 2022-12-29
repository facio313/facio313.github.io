---
layout: post
title: Front Controller
date: 2022-12-29
published: true
description: 디자인 패턴 중  하나인 Front Contoller 패턴에 대해서 알아보자
categories: Design Pattern
tags: [Desing Pattern]
---
# Front Controller
MVC 패턴의 컨트롤러에서 세부 컨트롤러들이 갖는 여러 가지 중복 코드들을 방지하고자 나온 패턴이다. 여러 클라이언트들의 요청이 다 달라서 그에 따른 컨트롤러도 다 다르다고 가정해보자. 하지만 같은 어플리케이션이다보니 요청을 받는 중복 패턴이 컨트롤러에 있을 것이다. 중복 코드가 한 두 줄이면 그냥 저냥 넘길 수 있지만 실제 서비스하는 어플리케이션은 그렇지 않다고 한다. 예를 들어, 요청 분석과 검증의 경우 그 패턴이 전형적이다. 그렇기에 각 컨트롤러로 직접 받기 보다는 앞에 얼굴 마담을 앞세워 일단 요청을 받고 분석하는 용도로 쓴 후 요청에 알맞는 다른 컨트롤러에게 일감을 넘기는 형식이 된다. 이것이 Front Controller이다. 이렇게 되면 Front Controller 외 다른 컨트롤러에서는 Servlet을 안 써도 되니 절약이다.

일단은 복습할 것이 너무 많아 여기까지만 쓴다.