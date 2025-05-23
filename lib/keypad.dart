import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'formatter/contact_formatter.dart';

class KeypadView extends StatefulWidget {
  static final List<String> _additionalKeypads = List.unmodifiable(['*','0','#',]);
  static final List<_ContactKeyWord> _keypadWords = [
    _ContactKeyWord.withAlphabet('1', ''),
    _ContactKeyWord.withAlphabet('2', 'ABC'),
    _ContactKeyWord.withAlphabet('3', 'DEF'),
    _ContactKeyWord('4', 'GHI', 'ㄱㅋ'),
    _ContactKeyWord('5', 'JKL', 'ㄴㄹ'),
    _ContactKeyWord('6', 'MNO', 'ㄷㅌ'),
    _ContactKeyWord('7', 'PQRS', 'ㅂㅍ'),
    _ContactKeyWord('8', 'TUV', 'ㅅㅎ'),
    _ContactKeyWord('9', 'WXYZ', 'ㅈㅊ'),
    _ContactKeyWord.onlyKey('*'),
    _ContactKeyWord('0', '+', 'ㅇㅁ'),
    _ContactKeyWord.onlyKey('#'),
  ];

  const KeypadView({super.key});

  @override
  State<KeypadView> createState() => _KeypadWidget();
}

class _KeypadWidget extends State<KeypadView> {
  final TextEditingController _editingController = TextEditingController();
  final TextInputFormatter _contactNumberFormatter = ContactNumberFormatter();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final GlobalKey textFieldKey = GlobalKey();
    final TextStyle keypadStyle = TextStyle(
      color: Colors.white,
      fontSize: size.height * 0.05,
      fontWeight: FontWeight.w500,
    );

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: size.height * 0.08,
          child: Padding(
            padding: EdgeInsets.only(right: size.height * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 10,
              children: [
                Icon(Icons.search, size: 45, color: Colors.white),
                Icon(Icons.more_vert, size: 45, color: Colors.white),
              ],
            ),
          ),
        ),
        SizedBox(height: 160),
        SizedBox(
          width: double.infinity,
          height: size.height * 0.13,
          child: SizedBox(
            child: TextField(
              inputFormatters: [
                ContactNumberFormatter()
              ],
              controller: _editingController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.height * 0.06,
                color: Colors.white,
              ),
              enabled: false,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 1.565,
              physics: NeverScrollableScrollPhysics(),
              children: [
                for (final keyWord in KeypadView._keypadWords)
                  TextButton(
                    onPressed: () {
                      final text = _editingController.text + keyWord.key;
                      this._editingController.text = this._contactNumberFormatter.formatEditUpdate(
                          TextEditingValue.empty, TextEditingValue(text: text)
                      ).text;
                      if(_editingController.text.length == 3) {
                        _editingController.text += '-';
                      }else  if(_editingController.text.length == 8) {
                        _editingController.text += '-';
                      }
                    },

                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      side: BorderSide.none,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [keyWordWidget(keyWord, size)],
                    ),
                  ),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.videocam, color: Colors.green, size: 40),
            ),
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(Icons.call, color: Colors.white, size: 40),
            ),
            IconButton(
              onPressed: () {
                _editingController.text = _editingController.text.substring(
                  0,
                  _editingController.text.length - 1,
                );
              },
              icon: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(Icons.backspace, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget keyWordWidget(final _ContactKeyWord contactKeyWord, Size size) {
    final childr = [
      Text(
        contactKeyWord.key,
        style: TextStyle(color: Colors.white, fontSize: size.height * 0.04),
      ),
    ];
    if (contactKeyWord.consonant != null) {
      childr.add(
        Text(
          contactKeyWord.consonant!,
          style: TextStyle(fontSize: size.height * 0.0143, color: Colors.grey),
        ),
      );
    }
    if (contactKeyWord.alphabet != null) {
      childr.add(
        Text(
          contactKeyWord.alphabet!,
          style: TextStyle(fontSize: size.height * 0.015, color: Colors.grey),
        ),
      );
    }
    return Column(children: childr);
  }
}

class _ContactKeyWord {
  final String _key;
  final String? _alphabet;
  final String? _consonant;

  _ContactKeyWord(this._key, this._alphabet, this._consonant);

  _ContactKeyWord.onlyKey(final String key) : this(key, null, null);

  _ContactKeyWord.withAlphabet(final String key, final String alphabet)
    : this(key, alphabet, null);

  String get key => this._key;

  String? get alphabet => this._alphabet;

  String? get consonant => this._consonant;
}

// return Column(
//   children: [
//     SizedBox(
//       height: 100,
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Icon(Icons.search, size: 45, color: Colors.white),
//           Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
//           Icon(Icons.more_vert, size: 45, color: Colors.white),
//         ],
//       ),
//     ),
//     SizedBox(height: 240),
//     Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         TextButton(
//           onPressed: () {},
//           child: Container(
//             alignment: Alignment.center,
//             child: Column(
//               children: [
//                 Text(
//                   '$number',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 40,
//                   ),
//                 ),
//                 Text(
//                   '$kor',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//                 Text(
//                   '$eng',
//                   style: TextStyle(
//                     color: Colors.grey,
//                     fontSize: 15,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//
//           [
//           Expanded(
//             child: Center(
//               child: GridView.count(
//                 crossAxisCount: 3,
//                 padding: EdgeInsets.symmetric(horizontal: 60),
//                 children: [
//                     TextButton(
//                       onPressed: () {},
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '1',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               '  ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//
//                       ),
//                     ),
//                   },
//
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '2',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ABC',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '3',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'DEF',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '4',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ㄱㅋ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               'GHI',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '5',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ㄴㄹ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               'JKL',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '6',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ㄷㅌ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               'MNO',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '7',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ㅂㅍ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               'PQRS',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               '8',
//                               style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 40,
//                               ),
//                             ),
//                             Text(
//                               'ㅅㅎ',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                             Text(
//                               'TUV',
//                               style: TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 15,
//                               ),
//                             ),
//                           ],
//                         ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           Text(
//                             '9',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40,
//                             ),
//                           ),
//                           Text(
//                             'ㅈㅊ',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             'WXYZ',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           Text(
//                             '*',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           Text(
//                             '0',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40,
//                             ),
//                           ),
//                           Text(
//                             'ㅇㅁ',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                           Text(
//                             '+',
//                             style: TextStyle(
//                               color: Colors.grey,
//                               fontSize: 15,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Column(
//                         children: [
//                           Text(
//                             '#',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 80,
//             height: 80,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.green,
//               ),
//               child: Icon(Icons.call, color: Colors.white, size: 40),
//             ),
//           ),
//         ],
//       ),
//     ),
//   ],
// );
