---
layout: post
title: Git(5)
date: 2022-12-30
published: false
description: 협업 툴 중 git의 branch에 대해 알아보자
categories: Git
tags: [git, 깃, github, branch, 브랜치]
---
# Branch
코드를 통째로 복사하고 나서 원래 코드와는 별개로 독립적인 개발을 진행하게 될 때가 있는데 이때 사용되는 개념이 브랜치이다. Git의 브랜치는 매우 가볍고 빠르다. Git은 브랜치를 만들어 작업하고 나중에 Merge하는 방법을 권장한다. 즉, 브랜치란 Main 흐름이 있는데 거기서 파생돼 다른 곳으로, 아니면 다른 방법으로 나아가고자 A, B의 흐름 줄기들을 새로 만드는 것이다.
            r--------A---------------------
====Main===================================
            ㄴ-------------------B---------

- 브랜치란 독립적으로 어떤 작업을 진행하기 위한 개념이다.

브랜치 관련 작업을 하다보면 master와 main 브랜치를 볼 수 있는데, 이 이름들은 다른 브랜치와 차이점이 없다. 다만 git init 시 자동으로 만들어진 브랜치이므로 그냥 쓰는 것이다. master라는 말은 master/slave와 같이 연상 단어의 어감이 좋지 않으니 자제하는 것이 좋다고 한다.

## 대략적인 순서
Main에서 작업하지 않을 때
처음인 경우 : clone -> remote -> branch -> checkout -> 작업
중간인 경우 : fetch, pull -> branch -> checkout -> 작업

물론 브랜치는 언제 만들어도 나중에 작업한 결과물을 add, commit, push할 때만 checkout해도 될 것이다.

- checkout은 다른 브랜치로 이동하는 것이다.

https://git-scm.com/book/ko/v2/Git-%EB%B8%8C%EB%9E%9C%EC%B9%98-%EB%B8%8C%EB%9E%9C%EC%B9%98%EB%9E%80-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80
나중에 찬찬히 읽어보자..

## Merge