import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'searchScreen.dart';
import 'homeContent.dart';
import 'cartScreen.dart';
import 'profileScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _mode = "Black Mode";
  var modeColor = Colors.white;
  var buttonColor = Colors.black;
  var buttonTextColor = Colors.black;
  int _selectedIndex = 0;
  int _selectedIndexBottom = 0;
  var textInfo = 'you tapped the image';
  bool isPressed = false;
  bool accIsPressed = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onItemTappedBottom(int index) {
    setState(() {
      _selectedIndexBottom = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget accesItems = Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: const Color.fromARGB(255, 229, 229, 229)))),
            width: 280,
            margin: EdgeInsets.only(top: 20, left: 0),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 180),
                    child: Text(
                      'Jacet',
                      style: TextStyle(fontSize: 15),
                    )),
                Text(
                  '48',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.navigate_next_outlined)
              ],
            ),
          ),
          Container(
            width: 280,
            margin: EdgeInsets.only(top: 20, left: 0),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 180),
                    child: Text(
                      'Jacet',
                      style: TextStyle(fontSize: 15),
                    )),
                Text(
                  '48',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.navigate_next_outlined)
              ],
            ),
          ),
          Container(
            width: 280,
            margin: EdgeInsets.only(top: 20, left: 0),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 180),
                    child: Text(
                      'Jacet',
                      style: TextStyle(fontSize: 15),
                    )),
                Text(
                  '48',
                  style: TextStyle(color: Colors.grey),
                ),
                Icon(Icons.navigate_next_outlined)
              ],
            ),
          ),
        ],
      ),
    );
    List<Widget> _widgetOptions = <Widget>[
      homeScreen,
      ListView(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  SizedBox(
                    height: 100,
                    width: 40,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    child: Container(
                        width: 250,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 236, 235, 235),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            filled: true,
                            labelText: 'Search',
                            fillColor: const Color.fromARGB(255, 236, 235, 235),
                            prefixIcon: Icon(Icons.search),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 100,
                    width: 30,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                        width: 50,
                        height: 50,
                        color: Color.fromARGB(255, 236, 235, 235),
                        child: Icon(
                          Icons.filter_list,
                          size: 35,
                        )),
                  )
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed = false;
                        print(isPressed);
                        if (isPressed == true) {
                          accesItems = accesItems;
                          print(accesItems);
                        }
                        if (isPressed == false) {
                          accesItems = Container();
                          print(accesItems);
                        }
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 0, top: 10),
                      child: Image.asset('assets/images/acess.png'),
                      // Text('accessories'),
                    ),
                  ),
                  accesItems,
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10),
                    child: Image.asset('assets/images/acess.png'),
                    // Text('accessories'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10),
                    child: Image.asset('assets/images/acess.png'),
                    // Text('accessories'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10),
                    child: Image.asset('assets/images/acess.png'),
                    // Text('accessories'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 0, top: 10),
                    child: Image.asset('assets/images/acess.png'),
                    // Text('accessories'),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
      cartScreen,
      profileScreen,
    ];
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 25),
                  child: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                    size: 30,
                  )),
              Container(
                margin: EdgeInsets.only(top: 8, left: 18),
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 3.5,
                ),
              )
            ],
          ),
        ],
        title: Text(
          "Gemstore",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,

        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: modeColor,
                border: Border(
                    bottom:
                        Divider.createBorderSide(context, color: Colors.white)),
              ),
              child: Container(
                margin: EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?cs=srgb&dl=pexels-mohamed-abdelghaffar-771742.jpg&fm=jpg'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, top: 40),
                      child: Column(
                        children: [
                          Text(
                            'user name ',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: buttonTextColor),
                          ),
                          Text(
                            'data@gmail.com',
                            style: TextStyle(
                                color: buttonTextColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Discover'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.check_outlined),
                    title: Text('My Orders'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('My Profile'),
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 300,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                      ),
                      onPressed: () {
                        setState(() {
                          if (modeColor == Colors.white) {
                            modeColor = Colors.black;
                            buttonColor = Colors.white;
                            buttonTextColor = Colors.white;
                            _mode = "White mode";
                          } else {
                            modeColor = Colors.white;
                            buttonColor = Colors.black;
                            _mode = "Black mode";
                            buttonTextColor = Colors.black;
                          }
                        });
                      },
                      child: Text(_mode))
                ],
              ),
            ),

            // ListTile(
            //   title: const Text('Home'),
            //   selected: _selectedIndex == 0,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(0);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Business'),
            //   selected: _selectedIndex == 1,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(1);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
            // ListTile(
            //   title: const Text('Schoolll'),
            //   selected: _selectedIndex == 2,
            //   onTap: () {
            //     // Update the state of the app
            //     _onItemTapped(2);
            //     // Then close the drawer
            //     Navigator.pop(context);
            //   },
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
        onTap: _onItemTappedBottom,
        currentIndex: _selectedIndexBottom,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
      body: _widgetOptions.elementAt(_selectedIndexBottom),
    );
  }
}
