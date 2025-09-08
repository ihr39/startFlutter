import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  final String name, code, amount;
  final IconData icon;
  final bool isInverted;
  final String order;

  final _blackColor = Color(0xFF1F2123);

  CurrencyCard({
    super.key,
    required this.name,
    required this.code,
    required this.amount,
    required this.icon,
    required this.isInverted,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    //-- 반드시 return 해줘야함
    return Transform.translate(
      offset: order == '1'
          ? Offset(0, 0)
          : (order == '2')
          ? Offset(0, -20)
          : Offset(0, -40),
      child: Container(
        //--overflow된 부분을 어떻게 처리를 할것인지
        clipBehavior: Clip.hardEdge, //-- hardEdge는 넘치는 부분이 사라짐
        //--컨테이너를 꾸미는 css
        decoration: BoxDecoration(
          color: isInverted ? Colors.white : _blackColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, //--가로축 정렬
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: isInverted ? _blackColor : Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        amount,
                        style: TextStyle(
                          color: isInverted ? _blackColor : Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        code,
                        style: TextStyle(
                          color: isInverted
                              ? _blackColor
                              : Colors.white.withOpacity(0.8),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Transform.scale(
                //--카드의 크기는 변하지 않고 아이콘만 크게 변하게 함
                scale: 2.2,
                child: Transform.translate(
                  //--아이콘을 이동시킴
                  offset: Offset(-5, 12), //--x와 y를 이동 시킴
                  child: Icon(
                    icon,
                    color: isInverted ? _blackColor : Colors.white,
                    size: 88,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
