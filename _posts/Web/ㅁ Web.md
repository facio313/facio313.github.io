---
layout: post
title: Web
description: 
date: 2022-11-24
published: true
categories: Web
tags: [Web, 인터넷, 웹]
---
간략한 설명만 하도록 하고 다음의 키워드는 게시글을 통해 자세히 기술할 것이다.
- Web
- 클라이언트
- request
- 서버
- response
- Peer
- IP
- Tier
- Port Number
- packaging
- protocol
- Internet

# Web
논리적 공간으로 논리적 식별자 역할(ex) 한반도(명명 주소))을 하고 대화의 각 종단에는 peer(클라이언트, 서버)가 있다. 쉽게 말해 클라이언트와 서버가 대화를 하는 논리적 식별 공간으로 서로 다른 역할을 가지고 있는 peer가 대화하는 공간이다. 이 둘은 서로 이해할 수 있는 언어인 html을 사용하여 클라이언트는 서버에 질문과 요청(request)하고 서버는 답변(response)한다. Web이라는 개념은 물리적 공간을 뜻하는 Internet(ex) 대한민국)과 대비된다. 정리하자면 다음과 같다. 
 - 논리적 식별 공간
   - 클라이언트 : request
   - 서버 :response
 - 물리적 종단 : Peer
   - 물리적 식별자 : ip
   - 주소를 통해 식별 가능
   - ex) 192.168.35.51
 - 논리적 종단 : Tier
   - 논리적 식별자 : port number
   - 한 Peer에 여러 서버들이 있을 수 있다. 그것들을 식별해주는 것이 port number
   - 1521(oracle), 8080(tomcat), 80(http 기본, 433(http 기본), 0~1023번대 초반(well-known)

 - 언어 : html 등

# Server
서버는 Web에서 클라이언트와 반대되는 종단에 있는 주체로 클라이언트의 요청에 대해 답변하는 역할을 한다. 서버가 꼭 하나일 필요는 없다. 서버는 bit 단위의 자료를 주고 받는데, 자료를 포장하는 것을 packaging이라고 하고 packaging하는 방법을 protocol이라고 한다. 정리하자면 다음 과 같다
- 주고 받는 데이터 : bit
- 데이터 포장하기 : packaging
- 포장 방법 : protocol(규약) - http, smtp, imap, ftp(file transfer protocol)
- peer 하나에 여러 서버가 있을 수 있다.
 - 1서버 : html / 2서버 file / 3서버 mail ...
 - 그것을 식별해주는 것이 port number
