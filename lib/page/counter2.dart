import 'package:example/page/counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterWidget2 extends StatefulWidget {
  const CounterWidget2({super.key});

  //StatefulWidget 상태가 있는 위젯
  @override
  State<StatefulWidget> createState() { // <- 만들고 한번만 호출
    return _CounterState();
  }
}
//상태가 바뀌는
class _CounterState extends State<CounterWidget2> {
  int _count = 0;

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
          Text('$_count', style: TextStyle(fontSize: 40),),
          FloatingActionButton(
            onPressed: () => _updateCount(_count + 1),
            backgroundColor: Colors.green,
            child: Icon(Icons.plus_one),
          ),
          FloatingActionButton(
            onPressed: () => _updateCount(_count - 1),
            backgroundColor: Colors.red,
            child: Icon(Icons.exposure_minus_1),
          ),
          FloatingActionButton(
            onPressed: () => _updateCount(0),
            backgroundColor: Colors.grey,
            child: Icon(Icons.refresh),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CounterWidget())
                );
              },
              child: Icon(CupertinoIcons.return_icon)
          )
        ]
       ),
      ),
    );
  }
void _updateCount(int count) {
  setState(() {
    this._count = count;
  });
 }
}





