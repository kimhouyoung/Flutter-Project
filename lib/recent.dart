import 'package:assignment2/button/recent_toggle_button.dart';
import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => RecentTO();
}

class RecentTO extends State<Recent> {
  ExpansionTileController? _expandContorller;
  static final int maximumRecent = 2;

  @override
  void initState() {
    super.initState();
    _expandContorller;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        height: 1000,
        child: ColoredBox(
          color: Colors.black,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 100),
            child: Column(
              children: [
                Text('전화', style: TextStyle(color: Colors.white, fontSize: 70)),
                Text(
                  '전화번호가 저장된 연락처 ${maximumRecent}개',
                  style: TextStyle(color: Colors.white38, fontSize: 30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 70),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.add, size: 45, color: Colors.white),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
                      Icon(Icons.search, size: 45, color: Colors.white),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 13)),
                      Icon(Icons.more_vert, size: 45, color: Colors.white),
                    ],
                  ),
                ),
                Column(
                  children: [
                    for (int count = 1; count <= maximumRecent; count++)
                      ToggleButton(
                        onUpdate: (controller) {
                          setState(() {
                            _expandContorller?.collapse();
                            _expandContorller = controller;
                          });
                        },
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
