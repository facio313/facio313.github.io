MacOS SVN 연동

Subversion 설치
homebrew를 이용해서 설치 후 확인까지

$ brew install subversion

$ svn --version
체크아웃
체크아웃은 최초로 프로젝트 소스를 내려받을 때 사용하는 명령어다. git으로치면 clone쯤 되는 것 같다.
checkout을 co로 줄여서 사용할 수 있다. 체크아웃 할 때 생성한 svn 계정을 입력하면 된다..
$ svn co svn://0.0.0.1/project

업데이트
업데이트는 원격 리포지토리의 최신 변경 내역을 내려받을 때 사용하는 명령어다. git으로 치면 pull쯤 되는 듯..
update는 up으로 줄여서 사용할 수 있다.
$ svn update

커밋
당연히 커밋 전에는 변경내역을 추가해줘야 한다. svn add명령어로..
$ svn commit -m "커밋 메시지 입력"

로그 확인
커밋 히스토리를 살펴볼 수 있다
$ svn log

상태 확인
$ svn status

리포지토리 정보 확인
$ svn info

이외 명령어 확인
$ svn --help

출처 : https://gaemi606.tistory.com/entry/MacOS-SVN-%EC%97%B0%EB%8F%99

맥 터미널 명령어 모음
https://yozm.wishket.com/magazine/detail/746/

1. 탐색하기

우선 컴퓨터를 조작하는 데 있어서 가장 기본이 되는 ‘탐색’에 대한 명령어를 살펴볼게요!

ls : 현재 경로에 존재하는 파일/폴더 확인하기
ls는 list의 약자로, 현재 자신의 위치에 있는 파일과 폴더들을 확인하는 명령어. ls을 입력하고 엔터를 누르면, 해당 경로에 존재하는 여러 파일과 폴더들의 이름이 나타나는 것을 확인할 수 있을 것

pwd : 현재 위치한 경로 출력하기
pwd는 print working directory의 약자로, 현재 어떤 경로의 디렉토리에 있는지 출력해주는 명령어

cd : 디렉토리 이동하기
cd는 change directory의 약자로, 경로를 이동할 때 사용하는 명령어
만약 폴더 밖으로 이동하고 싶다면 cd 뒤에 ..을 입력
홈 : cd ~

2. 파일/폴더 관리하기

컴퓨터를 이용할 때 단순히 폴더에 들어가기만 하지는 않습니다. 직접 파일이나 폴더를 만들거나 수정하기도 하는데요, 터미널로 파일/폴더를 관리하는 방법을 살펴볼게요.

touch : 파일 생성하기
touch는 파일을 생성하는 명령어입
touch 뒤에 파일명을 적으면 됨

mkdir : 폴더 생성하기
mkdir은 make directory의 약자로, 새로운 폴더를 생성하는 명령어

cat : 파일 확인하기
cat은 concatenate의 약자로, 파일의 내용을 확인하는 명령어

rm : 파일 삭제하기
rm은 remove의 약자로, 파일을 삭제하는 명령어

rmdir : 폴더 삭제하기
rmdir은 remove directory의 약자로, 폴더를 삭제하는 명령어

rm -r : 파일을 갖고 있는 폴더 삭제하기
rmdir은 내부에 파일이 없을 때만 실행 가능한 명령어

폴더에 진입해서 내부의 파일을 다 삭제한 후에 rmdir을 실행해도 되지만 그러기엔 폴더 구조가 복잡하면 너무 번거로운 경우 rm -r 명령어를 사용
마이너스 표시를 붙이는 것은 옵션을 뜻함,
recursive를 뜻하는 r 옵션과 함께 rm 명령어를 실행하면 내부의 파일까지 같이 제거해줌.

cp : 파일/폴더 복사하기
cp는 copy의 약자로, 폴더/파일을 복사하는 명령어
cp 뒤에 복사할 파일/폴더와 원하는 경로/이름을 입력

mv : 파일/폴더 이동시키기, 이름 변경하기
mv는 move의 약자로, 파일이나 폴더를 이동시키는 명령어
이동 : mv 명령어 뒤에 이동시킬 파일과 이동시킬 디렉토리를 순서대로 입력

mv test /testdir

파일 이름 변경 : mv 뒤에 첫 번째로 파일 이름을 입력하고 두 번째로 (폴더가 아니라) 변경할 파일 이름을 입력

mv test test1

3. 기타 유용한 명령어

clear : 터미널 정리하기
clear는 터미널을 정리해주는 명령어

history : 이전에 사용한 명령어 확인하기
여기서 느낌표와 번호를 입력하면, 해당 번호에 맞는 명령어를 사용할 수 있다.

man : 명령어 매뉴얼 확인하기
man은 manual의 약자로, 원하는 명령어의 매뉴얼을 확인 가능
man 뒤에 살펴보고 싶은 명령어를 입력
원래 화면으로 나가고 싶다면, quit을 뜻하는 알파벳 q를 누르면 됨