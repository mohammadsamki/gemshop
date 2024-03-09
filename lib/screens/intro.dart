import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<String> _images = [
    'assets/images/image1.jpeg',
    'assets/images/image2.jpeg',
    'assets/images/image3.jpeg',
    // Add more image paths as needed
  ];
  final List<String> _titles = [
    'Welcome',
    'How it works',
    'How it works',
  ];
  final List<String> _subTitles = [
    'This is the first page',
    'This is the second page',
    'This is the third page',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 482),
              Container(
                height: 450,
                width: 430,
                color: const Color.fromARGB(255, 59, 59, 59),
                child: Column(
                  children: [
                    SizedBox(height: 250),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 116, 115, 115),
                        // onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text('Shopping now',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 90),
            height: 650,
            width: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(
                      _titles[index],
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      _subTitles[index],
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 60),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                        height: 450,
                        width: 250,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 100),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                0 == index ? Colors.white : Colors.black,
                            radius: 5,
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            backgroundColor:
                                1 == index ? Colors.white : Colors.black,
                            radius: 5,
                          ),
                          SizedBox(width: 5),
                          CircleAvatar(
                            backgroundColor:
                                2 == index ? Colors.white : Colors.black,
                            radius: 5,
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
