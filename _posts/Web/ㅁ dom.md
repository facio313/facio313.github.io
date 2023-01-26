DOM이 뭐에요?
Documnet Object Model
HTML 문서는 <html></html>
그 안에 <head></head>와 <body></body>가 있음
head와 body는 단 하나씩만 있어야 함
name, id 등을 안 주고도 document.head / document.body로 부를 수도 있음
body 안에 div, h1, input 등등 넣음

HTML
|
|----------------|
HEAD            BODY
                 |
        |--------|---------|
        DIV     h1        INPUT ...

        이런 문서의 트리구조를 DOM이라고 부름