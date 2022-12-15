---
layout: post
title: Forward vs Redirect
description: 둘 다 페이지 전환 시 사용되는 기술인데 뭐가 다를까?
date: 2022-11-30
published: true
categories: Network
tags: [network,forward, redirect,네트워크,포워드,리다이렉트]
---
웹페이지에서 다른 웹페이지로 전환되는 기술에는 두 가지가 있다. 바로 Forward와 Redirect이다. 지금부터 이 둘의 차이를 알아보자~

# Forward
Forward는 url이 변화하지 않고 서버 안에서, 즉 Web Container 내부에서만 페이지가 이동되는데, 클라이언트에서는 페이지 이동의 변화를 알 수 있는 단서를 얻을 수 없다. 그래서 처음 요청한 url만 볼 수 있고, 이동한 페이지의 url은 볼 수 없다. Web Container 내부에서 이동하기 때문에 동일한 Web Container에 있는 페이지로만 이동이 가능하다. 현재 실행중인 페이지와 forward에 의해 호출될 페이지는 request와 response 객체를 공유한다. 
### 조심!
- 게시글 작성, 회원 가입 등 데이터를 전송해서 DB에 등록해야 할 때,
- 새로고침해도 요청 정보가 그대로 살아있기 때문에,
- 요청이 여러 번 전달돼서 전부 등록돼 시스템에 변화가 생길 수 있다.
- 그래서 Forward를 쓸 때는 시스템에 변화가 생기지 않는 단순 조회 요청이 적합하다.
- ex) 글 목록 조회, 검색
## 봉사 상세 예시(from 봉사 목록)
- 목록jsp에 있는 특정 글 클릭 시, 그 글의 아이디(volId)를 volDetail.do로 보낸다.
- volDetail.do에서 doGet이 실행되면 volDetail.jsp로 request를 보내준다.
```
@WebServlet("/volDetail.do")
public class VolDetailController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String volId = request.getParameter("volId");
		
		IVolService service = VolService.getInstance();
		VolunteerVO vv = service.getDetail(volId);
		
		request.setAttribute("vv", vv);
		request.getRequestDispatcher("/WEB-INF/volunteer/volDetail.jsp").forward(request, response); // session ?????
		
	}	
```

# Redirect
Redirect는 서버(Web Container)로 요청이 들어오면, 다시 클라이언트(웹 브라우저)에게 다른 페이지로 이동하라고 명령을 내린다. 클라이언트는 그 '다른 페이지'로 주소를 바꾸고 이동하게 된다. 해당 주소로 가면 Web Container가 바뀌고 request와 response 객체가 새롭게 생성된다.  
(같은 Web Container로 다시 요청 보내는 것도 가능한가? 이건 그냥 forward인가?) ㅇㅇ가능하다. 마지막에 하는 것은 forward가 맞다
1. 클라이언트가 서버(url1)에 요청을 보낸다.
2. 서버(url1)는 redirect할 url2로 응답한다.
3. 클라이언트는 url2를 받고 서버(url2)에 새로운 요청을 보낸다.
즉, 처음 생긴 request와 response는 소멸(?)하고 새로운 request와 response를 생성한다.
## 봉사 등록 예시(from 봉사 상세)
- doGet으로 volRegister(봉사 등록 화면)을 보여준다.
- volRegister.jsp에서 받아온 파라미터 값을 가져와 insert를 해준다.
- insert의 성공메세지를 담아 클라이언트에게 클라이언트에게 보여줬다가 volList.do를 호출해 목록으로 다시 돌아가게끔 한다. 원래 남아있던 request객체 대신 새로운 request객체가 생성돼서 volList.do부터 시작하게 된다.
```
@MultipartConfig
@WebServlet("/volRegister.do")
public class VolRegisterController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/volunteer/volRegister.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		VolunteerVO vv = new VolunteerVO();
		
	
		// 파라미터 값 가져오기
		String volTitle = request.getParameter("volTitle");
		
		// 서비스 객체 생성하기
		IVolService service = VolService.getInstance();

		vv.setVolTitle(volTitle);
		
		int cnt = service.registerVol(vv);
		
		String msg = "";
		if (cnt > 0) {
			msg = "성공";
		} else {
			msg = "실패";
		}
		
		request.getSession().setAttribute("msg", msg);
		response.sendRedirect(request.getContextPath() + "/volList.do);
	}
}
```

# 두 개의 차이를 알았다면!
request.setAttribute vs session.setAttribute
scope 4개? 알아야 함


https://doublesprogramming.tistory.com/63
https://mangkyu.tistory.com/51