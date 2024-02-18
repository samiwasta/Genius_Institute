import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  List<String> tags= [];
  List<String> options= ['IIT-JEE', 'NEET', 'MHT-CET'];

  int tag= -1;
  List<String> group= ['11th', '12th', 'Dropper'];

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 24,),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Personal Details',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 12,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Full Name',
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email Address',
                    ),
                  ),
                  SizedBox(height: 24,),
                  Text(
                    'Other Details',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Select Exams',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 8,),
                  ChipsChoice<String>.multiple(
                      value: tags,
                      onChanged: (val) => setState(() => tags = val),
                      choiceItems: C2Choice.listFrom(
                          source: options,
                          value: (i, v) => v,
                          label: (i, v) => v
                      ),
                      choiceActiveStyle: const C2ChoiceStyle(
                        color: Color(0xFFD2686E),
                        borderColor: Color(0xFFD2686E),
                        borderRadius: BorderRadius.all(Radius.circular(5),
                        )
                      ),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.black87,
                      borderColor: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(5),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text(
                    'Select Class',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 8,),
                  ChipsChoice.single(
                    value: tag,
                    onChanged: (val) => setState(() => tag = val),
                    choiceItems: C2Choice.listFrom(
                        source: group,
                        value: (i, v) => i,
                        label: (i, v) => v
                    ),
                    choiceActiveStyle: const C2ChoiceStyle(
                        color: Color(0xFFD2686E),
                        borderColor: Color(0xFFD2686E),
                        borderRadius: BorderRadius.all(Radius.circular(5),
                        )
                    ),
                    choiceStyle: const C2ChoiceStyle(
                      color: Colors.black87,
                      borderColor: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(5),
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
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/bottomNavigationBar');
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
