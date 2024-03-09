import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget homeScreen = Container(
  child: ListView(
    children: [
      Column(
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 30),
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 28.5,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25.5,
                          child: CircleAvatar(
                            backgroundColor: Colors.brown,
                            child: Icon(
                              Icons.female,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Women')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 50),
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 223, 223),
                        child: Icon(
                          Icons.male,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Men')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 50),
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 223, 223),
                        child: Icon(
                          Icons.nat,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Accessories')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 50),
                child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 226, 223, 223),
                        child: Icon(
                          Icons.functions,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Beauty')
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Stack(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: Image.asset('assets/images/image5.png')),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(left: 190, top: 30),
                child: Text(
                  'this is new collection 2024',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30, left: 50),
                child: Text(
                  'Feature Products',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 50),
                child: Text(
                  'show all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: 290,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 160,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.jpeg',
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'this is new ',
                      ),
                      Text(
                        '\$80.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.jpeg',
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'this is new ',
                      ),
                      Text(
                        '\$80.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.jpeg',
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'this is new ',
                      ),
                      Text(
                        '\$80.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.jpeg',
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'this is new ',
                      ),
                      Text(
                        '\$80.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 160,
                  // color: Colors.red,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/image1.jpeg',
                        height: 200,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'this is new ',
                      ),
                      Text(
                        '\$80.0',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Image.asset('assets/images/image6.png'),
          ),
        ],
      ),
    ],
  ),
);
