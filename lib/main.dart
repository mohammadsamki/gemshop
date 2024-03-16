import 'package:flutter/material.dart';
import 'package:gemshop/firebase_options.dart';
import 'screens/intro.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/changePass.dart';
import 'screens/home.dart';

// void main() {
//   runApp(GemShop());
// }
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GemShop());
}

class GemShop extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/intro': (context) => IntroPage(),
        '/changePass': (context) => PassChane(),
        '/home': (context) => HomePage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final String title;

  // MyHomePage({Key key, this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
  static const String routeName = '/';
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          width: 430,
          // color: Colors.black.withOpacity(0.5),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg2.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 430,
          color: Colors.black.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  SizedBox(height: 450),
                  Text(
                    'Gem Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to Gem Shop',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // primary: const Color.fromRGBO(100, 100, 100, 0.9),
                      backgroundColor: const Color.fromARGB(255, 86, 86, 86),
                      // onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: const Color.fromARGB(255, 85, 85, 85),
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      // Navigator.of(context).pushNamed(MyHomePage.routeName);
                      Navigator.pushNamed(context, '/intro');
                    },
                    child: Text('Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        )
      ]),
    );
  }
}
////////////////
/////////////////
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:gemshop/firebase_options.dart';
// import './screens/firebaseExample/home.dart';
// import './screens/firebaseExample/login.dart';
// import './screens/firebaseExample/register.dart';
// import './screens/firebaseExample/logout.dart';
// import './screens/firebaseExample/fireStromeScreen.dart';
// import 'screens/firebaseExample/api.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MyApp());
// }
// // void main() {
// //   runApp(MyApp());
// // }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Firebase Auth',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       initialRoute: '/api',
//       routes: {
//         '/': (context) => MainScreen(),
//         '/api': (context) => DataFromApi(),
//         '/login': (context) => LoginScreen(),
//         '/register': (context) => RegisterScreen(),
//         '/home': (context) => HomeScreen(),
//         '/fireStromeScreen': (context) => FireStormScreen(),
//       },
//     );
//   }
// }
