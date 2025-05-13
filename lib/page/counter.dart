import 'package:example/page/counter2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  //StatefulWidget 상태가 있는 위젯
  @override
  State<StatefulWidget> createState() { // <- 만들고 한번만 호출
    return _CounterState();
  }
}
//상태가 바뀌는
class _CounterState extends State<CounterWidget> {
  int _numberCount = 0;

  @override
  void initState() { // <- 초기 상태 한번만 호출
    super.initState();
  }

  @override
  //여러번 호출됨
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: TextField(  //onChange, Controller
              onChanged: (text) {
                //정규표현식 방법
                setState(() {
                  _numberCount = text.replaceAll(RegExp(r'[^0-9]'), '').length;
                });
                //아스키코드
                // setState(() {
                //   _numberCount = 0;
                //   for(int i = 0; i < text.length; i++) {
                //     var word = text[i];
                //     var wordCode = word.codeUnits[0];
                //     if(wordCode >= 48 && 57 >= wordCode) {
                //       _numberCount++;
                //     }
                //     for(int num = 0; num <= 9; num++) {
                //       if(word == num.toString()) {
                //         _numberCount++;
                //         break;
                //       }
                //     }
                //   }
                // });
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '여기에 텍스트를 입력해주세요.'
              ),
            ),
          ),
          Text('문자들 중, 숫자는 총 $_numberCount개 입니다.'),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterWidget2())
                );
              },
              child: Icon(CupertinoIcons.return_icon)
          )
        ],
       ),
      ),
    );
  }
}





