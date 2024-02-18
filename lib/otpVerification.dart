import 'dart:math';

import 'package:flutter/material.dart';
import 'package:Genius/register.dart';

class OTPVerification extends StatefulWidget {
  final String phoneNumber;

  const OTPVerification({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late String _otp = '';
  late String _generatedOTP;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _generatedOTP = _generateOTP();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(child: SizedBox()),
              Text(
                'OTP verification code is sent to:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.phoneNumber,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enter 6-digit OTP:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'OTP',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter OTP';
                  }
                  if (value.length != 6) {
                    return 'OTP must be 6 digits';
                  }
                  return null;
                },
                onChanged: (value) {
                  setState(() {
                    _otp = value;
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Generated OTP: $_generatedOTP', // Display the generated OTP here
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
                          _verifyOTP(context);
                        },
                        child: Text(
                          'Verify OTP',
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
      ),
    );
  }

  Future<void> _verifyOTP(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    setState(() {
      _isLoading = false;
    });

    if (_otp == _generatedOTP) {
      Navigator.popAndPushNamed(context, '/register');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect OTP. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _generateOTP() {
    final random = Random();
    final otp = random.nextInt(900000) + 100000; // Generate a random 6-digit number
    return otp.toString();
  }
}
