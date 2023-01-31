https 도메인/공인ip(비쌈)
http

공인ip 대역폭(BandWidth)
download, upload

서버 구축 시 업로드가 더 중요해짐

우리꺼는 그냥 사설 ip

공유기에 공인 ip가 하나 할당되어 있음
밖에서 공유기가 누군지 알아야 하기 때문에
공인 ip여도 한 달에 한 번, 보름에 한 번 바뀜(커멑 킬 때)
돈 주고 사면 고정이 됨
기본적으로 업로드 300메가 할당

NGROK -> https 한 개를 무료로 줌
(도메인명이 실행할 때마다 바뀜)

1.사이트 가서 회원가입
facio313@naver.com
b~

2.다운로드 받고 하라는 대로 하기
1. Unzip to install
On Linux or Mac OS X you can unzip ngrok from a terminal with the following command. On Windows, just double click ngrok.zip to extract it.

unzip /path/to/ngrok.zip
2. Connect your account
Running this command will add your authtoken to the default ngrok.yml configuration file. This will grant you access to more features and longer session times. Running tunnels will be listed on the endpoints page of the dashboard.

ngrok config add-authtoken 2L1pWx7a0LtR5PPEVhzGounn6c0_5deWYFVCD8LPLvoiTrFXQ
3. Fire it up
Read the documentation on how to use ngrok. Try it out by running it from the command line:

ngrok help
To start a HTTP tunnel forwarding to your local port 80, run this next:

ngrok http 80


네트워크 터널링
