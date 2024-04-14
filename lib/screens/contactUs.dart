import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> contacts = [
    {
      'name': 'Mr. Ajit Palkar',
      'phone': '9657202326',
      'whatsapp': 'https://wa.me/919657202326',
    },
    {
      'name': 'Mr. Manoj Mahale',
      'phone': '9822168072',
      'whatsapp': 'https://wa.me/919822168072',
    },
    {
      'name': 'Mrs. Rupali Rahate',
      'phone': '9130974433',
      'whatsapp': 'https://wa.me/919130974433',
    },
  ];

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: SizedBox()),
          const Padding(
            padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Color(0xFFD2686E),
              ),
            ),
          ),
          SizedBox(
            height: 230, // Adjust the height as needed
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(
                    contact['name'],
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone, color: Color(0xFFD2686E)),
                        onPressed: () => _launchPhoneCall(contact['phone']),
                      ),
                      IconButton(
                        icon: const Icon(Icons.chat, color: Color(0xFFD2686E)),
                        onPressed: () => _launchWhatsApp(contact['whatsapp']),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'We are here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // Set border color if needed
                  width: 1, // Set border width if needed
                ),
              ),
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                  target: LatLng(16.986299660379263, 73.298647132757),
                  zoom: 17.0,
                ),
                markers: <Marker>{
                  const Marker(
                    markerId: MarkerId('marker_1'),
                    position: LatLng(16.986299660379263, 73.298647132757), // Provide the position for the marker
                    infoWindow: InfoWindow(
                      title: 'We are here',
                    ),
                  ),
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _launchPhoneCall(String phoneNumber) async {
    final String url = 'tel:$phoneNumber';
    try {
      await launch(url);
    } catch (e) {
      throw 'Could not launch $url';
    }
  }

  _launchWhatsApp(String whatsappUrl) async {
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }
}
