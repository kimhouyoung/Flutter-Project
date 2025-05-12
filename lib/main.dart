import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter 앱'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(150, 255, 99, 187),
          toolbarHeight: 60,
        ),
        body: CounterWidget(),
      ),
    );
  }
}


class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterState();
  }

}

class _CounterState extends State<CounterWidget> {
  int _count = 0;

  @override
  void initState() {
    super.initState();
  }
  void _listenTextEditor() {

     //
    print('$this._controller.text');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            child: TextField(
              onChanged: (text) {
                setState(() {
                  _count = text.replaceAll(RegExp(r'[^0-9]'), '').length;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  labelText: '여기에 텍스트를 입력해주세요.'
                ),
              ),
            ),
          Text('문자들 중, 숫자는 총 $_count개 입니다.')
          // Text('$_count', style: TextStyle(fontSize: 40),),
          // FloatingActionButton(
          //   onPressed: () => _updateCount(_count + 1),
          //   backgroundColor: Colors.green,
          //   child: Icon(Icons.plus_one),
          // ),
          // FloatingActionButton(
          //   onPressed: () => _updateCount(_count - 1),
          //   backgroundColor: Colors.red,
          //   child: Icon(Icons.exposure_minus_1),
          // ),
          // FloatingActionButton(
          //   onPressed: () => _updateCount(0),
          //   backgroundColor: Colors.grey,
          //   child: Icon(Icons.refresh),
          // )
        ],
      ),
    );
  }
  // void _updateCount(int count) {
  //   setState(() {
  //     this._count = count;
  //   });
  // }


}





