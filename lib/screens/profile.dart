import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String getInitials(String fullName) {
    List<String> names = fullName.split(' ');
    String initials = '';
    for (String name in names) {
      initials += name[0];
    }
    return initials.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    String fullName = 'Sami Dilawar Wasta';
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SafeArea(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60.0,
                  backgroundColor: const Color(0xFFD2686E),
                  child: Text(
                    getInitials(fullName),
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            fullName,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8,),
          const Text(
            'samiwasta.11@gmail.com',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const Text(
            '7559161447',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                ListTile(
                  title: const Text('About Us'),
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutUs');
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text('Contact Us'),
                  onTap: () {
                    // Navigate to Contact Us screen
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text('Terms and Conditions'),
                  onTap: () {
                    // Navigate to Terms and Conditions screen
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text('Privacy Policy'),
                  onTap: () {
                    // Navigate to Privacy Policy screen
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text('Logout'),
                  onTap: () async {
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    Navigator.popAndPushNamed(context, '/login');
                  },
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Divider(),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SvgPicture.asset(
              "assets/images/Logo-grey.svg",
              height: 40,
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
