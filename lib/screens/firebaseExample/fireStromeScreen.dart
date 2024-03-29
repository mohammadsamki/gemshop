import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class DataFromFireStorm {}

class Teacher {
  String name;
  String adress;
  int age;
  List classes;
  List skills;
  Teacher(this.name, this.adress, this.age, this.classes, this.skills);

  void fromMap() {}
}

class FireStormScreen extends StatefulWidget {
  @override
  _FireStormScreenState createState() => _FireStormScreenState();
}

class _FireStormScreenState extends State<FireStormScreen> {
  List<Teacher> teachers = [];
  GlobalKey<FormState> _key = GlobalKey();
  String name = "";
  String adress = "";
  int age = 0;
  List classes = [];
  List skills = [];
  void getData() async {
    // FirebaseFirestore.instance.collection('teacher').get().then((value) {
    //   print(value.docs);
    // });
    List<dynamic> data = await getAllEntries('teacher');
    List<Teacher> fetchedTeachers = [];
    if (data != null) {
      fetchedTeachers = data.map((e) {
        return Teacher(
            e['name'], e['adress'], e['age'], e['classes'], e['skills']);
      }).toList();
    }
    print(fetchedTeachers);
//
    setState(() {
      teachers = fetchedTeachers;
    });
  }

  Future<List> getAllEntries(String collection) async {
    return (await FirebaseFirestore.instance.collection(collection).get())
        .docs
        .map((item) => item.data())
        .toList();
  }

  static Future addEntryWithAutogeneratedId(
      String collection, Map<String, dynamic> data) async {
    await FirebaseFirestore.instance.collection(collection).add(data);
  }

  void addEntry() async {
    Map<String, dynamic> data = {
      'name': name,
      'adress': adress,
      'age': age,
      'classes': classes,
      'skills': skills,
    };
    await addEntryWithAutogeneratedId('teacher', data);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fire Storm"),
      ),
      body: Column(
        children: [
          Center(
            child: Text("Fire Storm"),
          ),
          ElevatedButton(
              onPressed: () {
                print('test');
                getData();
                // print(getAllEntries('teacher'));
              },
              child: Text("Fire Storm")),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  Teacher teacher = teachers[index];
                  return ListTile(
                    title: Text(teacher.name),
                    subtitle: Column(
                      children: [
                        Text(teacher.adress),
                        Text('${teacher.age}'),
                        Text('${teacher.classes}'),
                        Text('${teacher.skills}'),
                        ElevatedButton(onPressed: () {}, child: Text("Delete")),
                        ElevatedButton(onPressed: () {}, child: Text("Edit"))
                      ],
                    ),
                  );
                }),
          ),
          SizedBox(height: 10),
          Form(
              key: _key,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {},
                    onSaved: (newValue) {
                      name = newValue!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {},
                    onSaved: (newValue) {
                      adress = newValue!;
                    },
                    decoration: InputDecoration(
                      labelText: 'Adress',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {},
                    onSaved: (newValue) {
                      age = int.parse(newValue!);
                    },
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {},
                    onSaved: (newValue) {
                      classes = [newValue];
                    },
                    decoration: InputDecoration(
                      labelText: 'Classes',
                    ),
                  ),
                  TextFormField(
                    validator: (value) {},
                    onSaved: (newValue) {
                      skills = [newValue];
                    },
                    decoration: InputDecoration(
                      labelText: 'Skills',
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          _key.currentState!.save();
                          addEntry();
                        }
                      },
                      child: Text("Submit"))
                ],
              )),
        ],
      ),
    );
  }
}
