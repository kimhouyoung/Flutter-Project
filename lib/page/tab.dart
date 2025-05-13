import 'package:example/page/counter.dart';
import 'package:example/page/counter2.dart';
import 'package:flutter/material.dart';

class MyTab extends StatelessWidget {
  const MyTab({super.key});


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(//화면 상단에 위치한 거 보여주기
            bottom: TabBar(
                tabs: [
                  Tab(
                    child: Text('Counter'),
                  ),
                  Tab(
                    child: Text('Counter2'),
                  )
                ]
            ),
          ),
          body: TabBarView(
            children: [
              CounterWidget(),
              CounterWidget2()
            ],
          ),
        )
    );
  }
}