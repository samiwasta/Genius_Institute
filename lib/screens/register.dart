import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> tags = [];
  List<String> options = ['IIT-JEE', 'NEET', 'MHT-CET'];

  int tag = -1;
  List<String> group = ['11th', '12th', 'Dropper'];

  String name = "";
  String email = "";
  int classs = 0;
  List<int> exams = [];

  @override
  Widget build(BuildContext context) {
    print(tags);
    print(tag);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox()),
            Text(
              'Let us know more about you!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      name = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    onChanged: (text) {
                      email = text;
                    },
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Other Details',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Select Exams',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ChipsChoice<String>.multiple(
                    value: tags,
                    onChanged: (val) => setState(() => tags = val),
                    choiceItems: C2Choice.listFrom(
                        source: options,
                        value: (i, v) => v,
                        label: (i, v) => v),
                    choiceActiveStyle: const C2ChoiceStyle(
                        color: Color(0xFFD2686E),
                        borderColor: Color(0xFFD2686E),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.black87,
                      borderColor: Colors.black87,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Select Class',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ChipsChoice.single(
                    value: tag,
                    onChanged: (val) => setState(() => tag = val),
                    choiceItems: C2Choice.listFrom(
                        source: group, value: (i, v) => i, label: (i, v) => v),
                    choiceActiveStyle: const C2ChoiceStyle(
                        color: Color(0xFFD2686E),
                        borderColor: Color(0xFFD2686E),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.black87,
                      borderColor: Colors.black87,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        List<int> exams = [];
                        for (var exam in tags) {
                          exams.add(options.indexOf(exam));
                        }

                        final new_user = <String, dynamic>{
                          "batches": [],
                          "name": name,
                          "email": email,
                          'exams': exams,
                          'class': tag
                        };

                        await db
                            .collection("users")
                            .doc(phonenumber)
                            .set(new_user);

                        user = new_user;

                        // Save phonenumber and user in shared prefs qwerty

                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('phonenumber', phonenumber!);

                        Navigator.popAndPushNamed(
                            context, '/bottomNavigationBar');
                      },
                      child: Text(
                        'Continue',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        elevation: 0,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
