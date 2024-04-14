import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(child: SizedBox()),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFFD2686E),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '1. Acceptance of Terms:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'By accessing or using this application, you agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use this application.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '2. Use License:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Permission is granted to temporarily download one copy of the materials (information or software) on this application for personal, non-commercial transitory viewing only. This is the grant of a license, not a transfer of title, and under this license, you may not:\n \t1. Modify or copy the materials.\n \t2. Use the materials for any commercial purpose or for any public display (commercial or non-commercial).\n \t3. Attempt to decompile or reverse engineer any software contained on this application.\n \t4.Remove any copyright or other proprietary notations from the materials.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3. User Responsibilities:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'You are responsible for ensuring that your use of this application complies with all applicable laws and regulations. You must not misuse this application by knowingly introducing viruses, trojans, worms, logic bombs, or other material that is malicious or technologically harmful.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '4. Limitations of Liability:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'In no event shall the application or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption) arising out of the use or inability to use the materials on the application, even if the application or an authorized representative has been notified orally or in writing of the possibility of such damage.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '5. Indemnification:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'You agree to indemnify and hold harmless the application, its affiliates, officers, directors, employees, and agents from and against any and all claims, liabilities, damages, losses, or expenses, including attorney\'s fees and costs, arising out of or in any way connected with your use of the application.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '6. Governing Law:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'These terms and conditions are governed by and construed in accordance with the laws of [Your Country] and you irrevocably submit to the exclusive jurisdiction of the courts in that State or location.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '7. Changes to Terms:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'The application reserves the right to revise these terms and conditions at any time without notice. By using this application, you are agreeing to be bound by the current version of these terms and conditions.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '8. Entire Agreement:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'These terms and conditions constitute the entire agreement between you and the application regarding your use of this application and supersede all prior and contemporaneous understandings, agreements, representations, and warranties, both written and oral.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
