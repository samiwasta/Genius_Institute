import 'package:flutter/material.dart';
import 'package:genius/utilities/courseProductCard.dart';
import 'package:genius/globalData.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BatchesScreen extends StatefulWidget {
  const BatchesScreen({Key? key}) : super(key: key);

  @override
  State<BatchesScreen> createState() => _BatchesScreenState();
}

class _BatchesScreenState extends State<BatchesScreen> {
  final ValueNotifier<int> tabIndexNotifier = ValueNotifier<int>(0);
  late PageController _pageController;

  List<Widget> NEETbatches = [];
  List<Widget> JEEbatches = [];
  List<Widget> CETbatches = [];

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Fetch all batches
    db.collection("batches").get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {

          var data = docSnapshot.data();

          var card = CourseProductCard(
            title: '${docSnapshot.id}',
            batch: data['batch'],
            imageUrl: data['imageURL'],
            price: '₹${data['price']}',
            duration: data['duration'],
          );

          if (data['exam'] == 'JEE') {
            JEEbatches.add(card);
          } else if (data['exam'] == 'NEET') {
            NEETbatches.add(card);
          } else if (data['exam'] == 'CET') {
            CETbatches.add(card);
          }

          setState(() {
            isLoaded = true;
          });
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (isLoaded)
          ? Padding(
              padding:
                  const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SafeArea(child: SizedBox()),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildTab("IIT-JEE", 0),
                          SizedBox(width: 16),
                          _buildTab("NEET", 1),
                          SizedBox(width: 16),
                          _buildTab("MHT-CET", 2),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (index) {
                        tabIndexNotifier.value = index;
                      },
                      children: [
                        _buildCourseList(JEEbatches),
                        _buildCourseList(NEETbatches),
                        _buildCourseList(CETbatches),
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildTab(String label, int index) {
    return ValueListenableBuilder(
      valueListenable: tabIndexNotifier,
      builder: (context, tabIndex, child) {
        final isSelected = tabIndex == index;
        return InkWell(
          onTap: () {
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected ? Color(0xFFD2686E) : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCourseList(List<Widget> courses) {
    return ListView(
      children: courses,
    );
  }
}
