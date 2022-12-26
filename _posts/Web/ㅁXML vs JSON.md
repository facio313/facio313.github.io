XML vs JSON

데이터를 나타내는 방식
대표적인 것 XML
가장 많이 쓰이는 것 JSON

XML
- 데이터 값 양쪽으로 태그가 있음(HTML을 근본으로 했기에)
- XML 구분 : namespace
- XML 내 쿼리문 구분 : id

JSON
- 태그보다는 중괄호({}) 형식과 ','로 나열하기에 표현이 간단함
- 자바스크립트의 객체와 마찬가지로 key와 value가 존재할 수 있음
	- key값이나 문자열은 항상 쌍따옴표를 이용해 표기함
- 객체, 배열 등의 표기를 사용할 수 있음
- 원하는 만큼 중첩시켜 사용 가능
- null, number, string, array, object, boolean을 사용할 수 있음

1. name-value형식의 쌍
여러가지 언어들에서 object등으로 실현되었다.
{ String key : String value }
{
  "firstName": "Kwon",
  "lastName": "YoungJae",
  "email": "kyoje11@gmail.com"
}

2. 값들의 순서화된 리스트 형식
여러가지 언어들에서 배열(Array) 등으로 실현되었다.
[value1, value2, ...]
{
  "firstName": "Kwon",
  "lastName": "YoungJae",
  "email": "kyoje11@gmail.com",
  "hobby": ["puzzles","swimming"]
}

문제점
- ajax는 데이터만이 아니라 JavaScript 그 자체도 전달될 수 있음
- json데이터를 받았는데 그것이 JavaScript일 수 있고 실행될 수도 있음(악성스크립트일 수도)
	- 그래서 순수하게 데이터만 추출하기 위한 라이브러리를 따로 사용하기도 함