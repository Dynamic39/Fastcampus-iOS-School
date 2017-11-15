# 아이돌 프로파일 앱 작성
##  목적: 기초적인 로그인 기능 구현 및 Plist 데이터 활용


### 적용되는 문법 : Plist Data Model, UserDefault, AutoLayout, 

1. 로그인 기능 구현하기
	* Xcode의 싱글뷰 어플리케이션을 새로 생성 한다.
	* StoryBoard에 기본적인 UI를 배치한다.<Br>(로그인 및 신규 가입을 위한 TextField, Button, 앱로고등)
	* StoryBorad에 UI를 배치한 후, AutoLayout을 설정한다. 설정 기준은 아이폰8 사이즈를 기준으로 하여, 아이폰 8+에도 적용 가능하게 한다.
	* 로그인 시, 데이터를 조회하여, 데이터 유무 및 비밀번호 일치 여부를 확인한다.
	* 아이디가 조회되지 않는 경우, 신규 가입이 진행 될 수 있도록 알람을 띄워준다.

2. 신규가입 기능 구현하기
	* 새로운 ViewController 를 생성하여, 간단한 UI를 구성하여 준다.
	* 아이디의 중복 확인을 하여주고, 비밀번호가 틀리지 않도록 일치 여부를 확인하여 준다.
	* 로그인이 완료되면, 회원가입 완료 창을 띄워주고, 기존 로그인 화면으로 이동하여 준다.

3. 테이블뷰에 DataModel 화한 자료를 업로드 하기
	* 새로운 ViewController를 생성하여, 간단한 UI를 구성한다.
	* Plist를 활용하여, DataModel작업을 진행하여, 코드로써 구현될 수 있도록 작업하여 준다.
	* 각 indexPath별로 지정된 데이터가 입력될 수 있도록 CustomCell을 만들어서 구현하여 준다.
	* tableView가 호출 될때, CustomCell에 있는 Data를 가져와서 표현하여 준다.

4. 해당 기능 구현으로 학습한 점
	* 기초적인 변수의 선언
	* IF, For 문등의 활용
	* UserDefaults 의 기능 활용
	* AlertViewController 활용
	* ViewController 간의 화면 이동 방법
	* Autolayout 활용(Storyboard)
	* TableView 기초 학습
	* DataModel을 활용한, Data 가공 및 활용 실습


