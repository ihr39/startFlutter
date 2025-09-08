import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/currency_card.dart';

void main() {
  runApp(App()); //--시작점이라 무엇을 return할 것인지 정해야함
}

//--데이터가 변경될때마다 위젯이 변경됨 :실시간으로 변한 데이터를 보여주는것
class App extends StatefulWidget {
  //--위젯 그 자체
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  /*
  //--버튼을 클릭하면 카운터가 증가
  int counter = 0;
  List<int> numbers = [];

  void onClicked() {
    setState(() {
      //--굳이 여기 안에 넣지 않아도 된다(setState()만 있으면 작동한다) 근데 가독성을 위해 넣는게 좋다
      //--State에게 데이터가 바뀌었다고 알려줌 => 다시 위젯을 빌드함
      numbers.add(numbers.length);
    });
  }
  */

  bool showTitle = true;

  void toggleTitle() {
    setState(() {
      showTitle = !showTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    //--context는 위젯 트리에 대한 모든 정보를 가지고 있음
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        //--테마를 한번에 지정
        textTheme: TextTheme(titleLarge: TextStyle(color: Colors.red)),
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFF4EDDB),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //--column에서 main-이 수직
            children: [
              showTitle ? MyLargeTitle() : Text("nothing"),
              IconButton(
                onPressed: toggleTitle,
                icon: Icon(
                  Icons.remove_red_eye,
                ), //--클릭하면 initState->build false되면 dispose
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyLargeTitle extends StatefulWidget {
  const MyLargeTitle({super.key});

  @override
  State<MyLargeTitle> createState() => _MyLargeTitleState();
}

class _MyLargeTitleState extends State<MyLargeTitle> {
  int count = 0;

  //--반드시 build 메소드 보다 먼저 호출!! 오직 한번만 호출
  @override
  void initState() {
    //--상태를 초기화하기 위한 메소드: 부모쪽을 초기화할 때 사용 변수가 초기화 된다
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  void dispose() {
    //--위젯이 스크린에서 제거될 때 호출되는 메서드
    // TODO: implement dispose
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    //--context는 text의 모든 부모 요소를 가지고 있음 이걸 사용하기 위해 context에 접근
    print('build');
    return Text(
      "My Large Title",
      style: TextStyle(
        fontSize: 30,
        color: Theme.of(
          context,
        ).textTheme.titleLarge?.color, //--값이 존재한다는 것을 알려줌 !: 확실히 존재 ?:있을수도?
      ),
    );
  }
}

/*
//--단지 UIfmf cnffur
//--위젯 사용을 위해 확장 연결 그럼 이제 App은 위젯이 됨
//--build method는 위젯의 UI를 만드는 것
class App extends StatelessWidget {
  const App({super.key});
  //--StatelessWidget는 화면에 위젯을 보여주는 용도
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //--네비게이션 바를 사용하기 위한 건물의 뼈대
        //--색을 지정하고 싶다면 #은 0xFF뒤에 숫자 Color.fromRGBO()
        backgroundColor: Color(
          0xFF181818,
        ), //--단순히 red, black을 사용하고 싶다면 Colors.-으로
        body: SingleChildScrollView(
          //-- 화면에 넘치면 스크롤 할 수 있게 해줌
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20), //--수직/수평 지정
            child: Column(
              //--수직구조로 텍스트가 쌓여있음
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //--children list에 있는 것들을 사용한다
                Row(
                  //--한 줄의 내용(옆으로 두고싶을 때)
                  mainAxisAlignment:
                      MainAxisAlignment.end, //-- Row의 MainAxis는 수평
                  children: [
                    //--한 줄의 내용을 뭘로 할것인지
                    SizedBox(
                      //--맨 위에 사이즈가 100인 빈 박스를 만든다
                      height: 180,
                    ),
                    Column(
                      //--텍스트가 여러개로 사용
                      crossAxisAlignment:
                          CrossAxisAlignment.end, //--column의 MainAxis는 수직
                      children: [
                        //--아래 텍스트를 사용
                        Text(
                          "Hey, Selena",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8), //--투명도
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 0),
                Text(
                  "Total Balance",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 22,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "\$5 194 482", //--변수가 아니라는 것을 알려주기 위해 $\를 사용 => $로 인식
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: //--하나가 크고 하나가 작으면 main-은 글자가 중앙정렬 없으면 끝부분에 위치
                      MainAxisAlignment.spaceBetween, //--두개를 떨어트림(최대한)
                  children: [
                    Button(
                      text: "Transfer",
                      bgColor: Color(0xFFF1B33B),
                      textColor: Colors.black,
                    ),
                    Button(
                      text: "Request",
                      bgColor: Color(0xFF1F2123),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Row(
                  //--세로축 시작에 정렬할 것인지 끝에 할 것인지
                  crossAxisAlignment:
                      CrossAxisAlignment.end, //--세로축 정렬을 어떻게 할건지 의미
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wallets",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "View All",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                CurrencyCard(
                  name: 'Euro',
                  code: 'EUR',
                  amount: '6 482',
                  icon: Icons.euro_rounded,
                  isInverted: false,
                  order: '1',
                ),
                CurrencyCard(
                  name: 'Bitcoin',
                  code: 'BTC',
                  amount: '9 785',
                  icon: Icons.currency_bitcoin,
                  isInverted: true,
                  order: '2',
                ),
                CurrencyCard(
                  name: 'Dollar',
                  code: 'USD',
                  amount: '428',
                  icon: Icons.attach_money_outlined,
                  isInverted: false,
                  order: '3',
                ),
              ],
            ),
          ),
        ),
      ),
    ); //--구글 스타일인지(Material-) 아니면 애플 스타일인지(Cuper-) 기본 설정이므로 필수
  }
}
*/
