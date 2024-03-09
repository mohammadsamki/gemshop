import 'package:flutter/material.dart';
// import 'searchScreen.dart';
import 'homeContent.dart';
import 'cartScreen.dart';
import 'profileScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  int _selectedIndexBottom = 0;
  var textInfo = 'you tapped the image';
  bool isPressed = false;

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
    List<Widget> _widgetOptions = <Widget>[
      homeScreen,
      Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              GestureDetector(
                child: Image.asset(
                  'assets/images/bg.jpeg',
                  width: 200,
                ),
                onTap: () {
                  setState(() {
                    if (!isPressed) {
                      isPressed = true;
                      textInfo = 'you tapped the';
                    } else {
                      isPressed = false;
                      textInfo = '';
                    }
                  });
                },
              ),
              Text(textInfo),
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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              selected: _selectedIndex == 0,
              onTap: () {
                // Update the state of the app
                _onItemTapped(0);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: _selectedIndex == 1,
              onTap: () {
                // Update the state of the app
                _onItemTapped(1);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Schoolll'),
              selected: _selectedIndex == 2,
              onTap: () {
                // Update the state of the app
                _onItemTapped(2);
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
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
