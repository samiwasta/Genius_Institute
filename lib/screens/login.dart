
import 'package:genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}


class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';

  void checkLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? phone = prefs.getString('phonenumber');
    if (phone != null) {
      phonenumber = phone;

      //fetch the user data from firebase
      final docRef = db.collection("users").doc(phonenumber);

      docRef.get().then(
            (DocumentSnapshot doc) async {
          if (!doc.exists) {
            Navigator.popAndPushNamed(context, '/register');
          }
          else {
            user = doc.data() as Map<String, dynamic>;

            Navigator.popAndPushNamed(context, '/bottomNavigationBar');
          }

        },
        onError: (e) => print("Error getting document: $e"),
      );
    }


  }

  @override
  Widget build(BuildContext context) {

    // check if already logged in if yes, go to bottomnavpage qwerty
    checkLogin();

    // to logout, simply clear the shared prefs


    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(child: SizedBox()),
            SvgPicture.asset(
              "assets/images/Logo.svg",
              height: 50,
              width: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: SvgPicture.asset(
                  "assets/images/study.svg",
                  height: 180,
                  width: 180,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFD2686E),
                ),
              ),
            ),
            const Center(
              child: Text(
                "to Genius Institute",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),
            const Center(
              child: Text(
                "Best Teacher | Affordable Pricing | Live Batches | DPP | Notes",
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black45,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xFFEEEEEE),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.black.withOpacity(0.13)),
                      ),
                      child: InternationalPhoneNumberInput(
                        onInputChanged: (PhoneNumber number) {
                          _phoneNumber = number.phoneNumber!;
                        },
                        cursorColor: Colors.black,
                        formatInput: false,
                        selectorConfig: const SelectorConfig(
                          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        ),
                        inputDecoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                          border: InputBorder.none,
                          hintText: 'Phone Number',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16,
                          ),
                        ),
                        initialValue: PhoneNumber(isoCode: 'IN'),
                        autoValidateMode: AutovalidateMode.onUserInteraction,
                        selectorTextStyle: const TextStyle(color: Colors.black),
                        ignoreBlank: false,
                        onInputValidated: (bool value) {
                          // Handle phone number validation if needed
                        },
                        inputBorder: InputBorder.none,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Perform your validation logic here
                                  Navigator.popAndPushNamed(context, '/otpVerification', arguments: _phoneNumber);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                elevation: 0,
                              ),
                              child: const Text(
                                'Continue',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
