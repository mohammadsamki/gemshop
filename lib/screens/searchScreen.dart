import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var textInfo = 'you tapped the image';
bool isPressed = false;
Widget searchScreen = Column(
  // mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Row(
      children: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        GestureDetector(
          child: Image.asset(
            'assets/images/bg2.jpeg',
            width: 200,
          ),
          onTap: () {
            if (!isPressed) {
              isPressed = true;
              textInfo = 'you tapped the image';
            } else {
              isPressed = false;
              textInfo = '';
            }
          },
        ),
        Text(textInfo),
      ],
    ),
  ],
);
