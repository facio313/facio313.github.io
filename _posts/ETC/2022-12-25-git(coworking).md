---
layout: post
title: Git(coworking)
date: 2022-12-25
published: true
description: 협업 툴 중 git의 협업기능을 이용하자
categories: Git
tags: [git, 깃, github]
---
해당 내용은 브랜치를 공부한 이후 다시 작성한다.
# 깃으로 협업하기
깃허브에서 먼저 저장소가 만들어져 있어야 한다.
- main : 말 그대로 main이고 branch에서 변경된 것들을 합칠 것을 요청하여 승인되면 업데이트 된다.
- clone : 최신 main을 고대로 갖고 오는 거
- branch : 올릴 때만 쓰는 1회용으로  한 번 올리고 삭제해야 한다. clone하면 새로운 branch로 해야 한다. 
즉 매번 새롭게 해줘야 한다. branch를 삭제했다면 branch 이름을 다시 사용할 수 있다.
## 처음
1. 자주 쓸 폴더 하나를 협업할 폴더로 지정한다.
ex) 나는 Desktop에 있는 "git_co-working"폴더에다가 협업 파일들을 불러올 거야!
## 방법
2. 그 폴더로 들어가 main에 있는 파일을 똑같이 복제해온다.
```
git clone [주소]
git clone https://github.com/samchi31/Project202211
```
3. 들어가서 바꿀 거 바꾼다.
4. clone한 폴더 안에 명령어를 쳐서 다른 사람에게 요청할 것들을 올린다. 이때, branch를 설정해서 main에다가 올리지 않아야 한다.
```
git checkout -b [브랜치명]          브랜치명은 내가 알아서 정한다.
git status
git add .
git commit -m '간단한 커밋 내용'
git push -u origin [브랜치명]
```
5. github 홈페이지로 가서 해당 저장소로 들어가면 'Compare & pull request' 버튼이 떠있을 것이다.
안 떠있다면 pull request메뉴로 들어간다.
들어가서 저 버튼을 누른다.
6. Leave a comment라고 적힌 곳에 무엇을 바꾸었는지 자세하게 적는다.
옆에 Reviewers의 톱니바퀴 버튼을 눌러 누구에게 요청할지 정한다.
'Create pull request'버튼을 눌러 요청할 사람에게 보낸다.
7. 요청해달라고 조른다.
# 승인
1. 조르면 깃허브 사이트에서 프로젝트 들어간 다음 request 온 것을 본다. 
뭐가 바꼈는지 보고 add review인가 머시기해서 comment(댓글) approve(승인) request change(요청 다시 해라) 눌러준다.
2. 화면이 바뀌면 branch를 삭제해주거나 요청자에게 삭제하라고 한다.
* 최소 승인 인원을 정할 수 있다.
