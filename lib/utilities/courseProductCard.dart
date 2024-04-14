import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:genius/screens/lectureScreen.dart'; // Import LectureScreen if not already imported

class CourseProductCard extends StatefulWidget {
  final String title;
  final String batch;
  final String imageUrl;
  final String price;
  final String duration; // Duration of the course

  const CourseProductCard({
    Key? key,
    required this.title,
    required this.batch,
    required this.imageUrl,
    required this.price,
    required this.duration,
  }) : super(key: key);

  @override
  State<CourseProductCard> createState() => _CourseProductCardState();
}

class _CourseProductCardState extends State<CourseProductCard> {
  late Razorpay _razorpay;
  bool purchased = false;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success
    print('Payment successful: ${response.paymentId}');
    setState(() {
      purchased = true;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment failure
    print('Payment failed: ${response.code} - ${response.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet payment
    print('External wallet selected: ${response.walletName}');
  }

  void _openRazorpay() {
    var options = {
      'key': 'rzp_test_UUO4CRYrk6tLCW', // Replace with your Razorpay key
      'amount': int.parse(widget.price) * 100, // Convert to paise
      'name': 'Genius',
      'description': widget.title,
      'prefill': {'contact': '', 'email': ''}, // Pre-filled customer details
      'external': {
        'wallets': ['paytm'] // List of external wallets
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error: $e');
    }
  }

  void _redirectToLectures() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LectureScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.grey, width: 1), // Add border side
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Targeted Batch: ${widget.batch}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.watch_later_outlined),
                          const SizedBox(width: 4),
                          Text(
                            widget.duration, // Display duration
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: purchased ? _redirectToLectures : _openRazorpay,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: purchased ? Colors.green : Colors.black87,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                        child: Text(
                          purchased ? 'Study' : 'Purchase',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
