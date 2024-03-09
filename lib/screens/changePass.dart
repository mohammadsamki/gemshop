import 'package:flutter/material.dart';

class PassChane extends StatefulWidget {
  @override
  _PassChaneState createState() => _PassChaneState();
}

class _PassChaneState extends State<PassChane> {
  var firstIcon = Icons.visibility_off;
  var secondIcon = Icons.visibility_off;
  bool isFirst = true;
  bool isSecond = true;
  String password = "";
  String confirmPassword = "";
  Color buttonColor = Color.fromARGB(100, 100, 100, 100);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text(
            'Create new password',
            style: TextStyle(fontSize: 30),
          ),
          Container(
            margin: EdgeInsets.only(left: 60, top: 10, right: 50),
            child: Text(
              'Your new password must be different from previously used password',
              style: TextStyle(
                  color: const Color.fromARGB(255, 77, 75, 75), fontSize: 17),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100, left: 30, right: 30),
            // forget pass form
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    obscureText: isFirst,
                    decoration: InputDecoration(
                      label: Text('password'),
                      // hintText: 'Password',dsfsf
                      suffixIcon: IconButton(
                          icon: Icon(firstIcon),
                          onPressed: () {
                            setState(() {
                              if (firstIcon == Icons.remove_red_eye) {
                                firstIcon = Icons.visibility_off;
                                isFirst = false;
                              } else {
                                firstIcon = Icons.remove_red_eye;
                                isFirst = true;
                              }
                            });
                          }),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      onChanged: (value) {
                        setState(() {
                          confirmPassword = value;
                        });
                        if (confirmPassword == password) {
                          setState(() {
                            buttonColor = Colors.black;
                          });
                        } else {
                          setState(() {
                            buttonColor = Color.fromARGB(100, 100, 100, 100);
                          });
                        }
                      },
                      obscureText: isSecond,
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        // hintText: 'Confirm password',
                        suffixIcon: IconButton(
                            icon: Icon(secondIcon),
                            onPressed: () {
                              setState(() {
                                if (secondIcon == Icons.remove_red_eye) {
                                  secondIcon = Icons.visibility_off;
                                  isSecond = false;
                                } else {
                                  secondIcon = Icons.remove_red_eye;
                                  isSecond = true;
                                }
                              });
                            }),
                      )),
                  SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: buttonColor),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('pass changed'),
                        content: const Text('AlertDialog description'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    // color: Colors.blue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
