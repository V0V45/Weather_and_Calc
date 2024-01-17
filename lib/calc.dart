import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class TextAndButtons extends StatefulWidget {
  const TextAndButtons({super.key});

  @override
  State<TextAndButtons> createState() => _TextAndButtonsState();
}

class _TextAndButtonsState extends State<TextAndButtons> {
  String currentDigit = '';
  final textcontroller = TextEditingController();
  int firstDigit = 0;
  int secondDigit = 0;
  String action = '';

  @override
  void initState() {
    super.initState();
    textcontroller.text = currentDigit;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(),
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                style: TextStyle(color: Colors.white),
                controller: textcontroller,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(border: InputBorder.none),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('AC'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('+/-'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('%'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
                              child: Text('/'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}7';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('7'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}8';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('8'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}9';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('9'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}*';
                                  action = '*';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('X'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}4';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('4'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}5';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('5'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}6';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('6'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                currentDigit = '${currentDigit}-';
                                action = '-';
                                textcontroller.text = currentDigit;
                              },
                              child: Text('-'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}1';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('1'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}2';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('2'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}3';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('3'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                currentDigit = '${currentDigit}+';
                                action = '+';
                                textcontroller.text = currentDigit;
                              },
                              child: Text('+'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  currentDigit = '${currentDigit}0';
                                  textcontroller.text = currentDigit;
                                });
                              },
                              child: Text('0'),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(','),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  String result = '';
                                  for (var i = 0;
                                      i < currentDigit.length;
                                      i++) {
                                    if (currentDigit[i] == action) {
                                      int firstDigit = int.parse(
                                          currentDigit.substring(0, i));
                                      int secondDigit = int.parse(
                                          currentDigit.substring(
                                              i + 1, currentDigit.length));
                                      if (action == '*') {
                                        result = '${firstDigit * secondDigit}';
                                      }
                                      if (action == '+') {
                                        result = '${firstDigit + secondDigit}';
                                      }
                                      if (action == '-') {
                                        result = '${firstDigit - secondDigit}';
                                      }
                                    }
                                  }
                                  currentDigit = result;
                                  textcontroller.text = currentDigit;
                                  firstDigit = 0;
                                  secondDigit = 0;
                                });
                              },
                              child: Text('='),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Container(
        color: Colors.black,
        child: TextAndButtons(),
      ),
    ),
  ));
}
