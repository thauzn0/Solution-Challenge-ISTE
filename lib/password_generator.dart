import 'package:flutter/material.dart';
import 'context_extension.dart';

import 'dart:math';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({Key? key}) : super(key: key);

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

String pass = "";

class _PasswordGeneratorState extends State<PasswordGenerator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: buildText(),
            ),
            Expanded(
              flex: 5,
              child: buildButton(),
            ),
          ],
        ),
      ),
    );
  }

  Row buildText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pass,
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1),
        ),
      ],
    );
  }

  Row buildButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RaisedButton(
          onPressed: () {
            setState(() {
              pass = generateRandomString(10);
            });
          },
          child: Text("Generate"),
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Password Generator"),
    );
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
