import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 500,
      decoration: BoxDecoration(
        border: Border.all(
            color: Color.fromARGB(255, 96, 94, 94),
            width: 1
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          Container(
            height: 90,
            decoration: BoxDecoration(
              border: Border(
                bottom:BorderSide(
                  color: Color.fromARGB(255, 96, 94, 94),
                  width: 1
                )
              ),
            ),
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
              border: Border(
                  bottom:BorderSide(
                      color: Color.fromARGB(255, 96, 94, 94),
                      width: 1
                  )
              )
            )
          ),
          Expanded(child: Text(''))
        ],
      ),
    );
  }

}