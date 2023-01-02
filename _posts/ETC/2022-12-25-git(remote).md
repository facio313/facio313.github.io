---
layout: post
title: Git(remote)
date: 2022-12-25
published: false
description: 협업 툴 중 git의 remote 기능을 이용해보자
categories: Git
tags: [git, 깃, github]
---
git(4)을 보면 remote에 대해서 설명해놓았다. 해당 글을 읽고 실제로 쓸 때 어떻게 쓰는지 알기 위해 이 글을 읽으면 좋을 것 같다. 이 글을 쓰는 이유는, 이론적인 것도 있지만 그보단 실제론 어떻게 저장소를 갖고와 작업할 수 있는지 알기 위함이다. 일단 나의 상황은 학원에서 여러 소스와 블로그 글을 작성하고 github의 repository에 push한다. 그리고 주말에 집에서 블로그 글이나 코드리뷰를 하는데 일일이 복사하고 repository를 이상하게 건드리는 것 같다. 학원-리모트 저장소-집 이렇게 이어져야 하며 모든 작업은 다른 곳에서도 똑같이 할 수 있도록 하기 위함이다.

# Repository 만들기
git의 중계 사이트격인 github에 리모트 저장소를 만들어야 다른 곳에서 쓸 수 있다. 로컬 저장소를 쓰는 것보다 네트워크 어딘가에 리모트 저장소를 만들어서 쓰면 다른 곳에서도 작업할 수 있다. 물론 로컬 저장소도 서버화되어 있다면 쓸 수 있겠지만 그럴 여력이 없으니 차치하고 시작한다.  
1. github에 로그인 후 repository 메뉴로 가서 New를 누른다.
2. 이름을 적고 기타 설정을 마친다.
3. 다음과 같이 적용한다.
```
- 새로 만드는 경우
#는 안 해도 된다.
# echo "# test" >> README.md
git init
# git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/facio313/test.git
git push -u origin main
```

## 존재하는 저장소인 경우
```
git remote add origin https://github.com/facio313/test.git
git branch -M main
git push -u origin main
```
중간에 니가 누군지 모르게써..이러면 user.name과 user.email.을 초반에 git config --global 명령어를 쳐서 애초에 적용시키든지, 그때마다 쳐주든지 한다.  





# 토큰 인증 에러
https://dev.classmethod.jp/articles/resolving-github-token-authentication-errors/