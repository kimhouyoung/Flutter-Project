import 'package:example/page/counter.dart';
import 'package:example/page/counter2.dart';
import 'package:flutter/material.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Row(
       children: [
         ElevatedButton(
             onPressed: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => CounterWidget())
               );
             },
             child: Text('counter1로 이동')
         ),
         ElevatedButton(
             onPressed: () {
               Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => CounterWidget2())
               );
             },
             child: Text('counter2로 이동')
         )
       ],
     ),
    );
  }
}
