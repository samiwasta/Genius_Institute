import 'package:flutter/material.dart';
import 'package:Genius/utilities/courseProductCard.dart';

class BatchesScreen extends StatefulWidget {
  const BatchesScreen({Key? key}) : super(key: key);

  @override
  State<BatchesScreen> createState() => _BatchesScreenState();
}

class _BatchesScreenState extends State<BatchesScreen> {
  final ValueNotifier<int> tabIndexNotifier = ValueNotifier<int>(0);
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
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
                  _buildCourseList([
                    CourseProductCard(
                      title: 'MISSION JEE 2025',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/p1jPtM6/JEE2025.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION JEE 2026',
                      batch: '2026',
                      imageUrl: 'https://i.ibb.co/wCVyZdf/JEE2026.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION JEE 2025 (Droppers)',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/NyVC7JF/JEE2025-DROPPER.png',
                      price: '₹9999',
                      duration: '1 year',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'JEE CRASH COURSE',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/mB8FM07/JEECRASH.png',
                      price: '₹9999',
                      duration: '3 Months',
                    ),
                  ]),
                  _buildCourseList([
                    CourseProductCard(
                      title: 'MISSION NEET 2025',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/qWB8yPy/NEET2025.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION NEET 2026',
                      batch: '2026',
                      imageUrl: 'https://i.ibb.co/w7dvhdT/NEET2026.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION NEET 2025 (Droppers)',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/7JGnDHN/NEET2025-DROPPER.png',
                      price: '₹9999',
                      duration: '1 year',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'NEET CRASH COURSE',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/4d3QNpQ/NEETCRASH.png',
                      price: '₹9999',
                      duration: '3 months',
                    ),
                  ]),
                  _buildCourseList([
                    CourseProductCard(
                      title: 'MISSION CET 2025',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/fNqrVyS/CET2025.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION CET 2026',
                      batch: '2026',
                      imageUrl: 'https://i.ibb.co/wQFYCkR/CET2026.png',
                      price: '₹9999',
                      duration: '2 years',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'MISSION CET 2025 (Droppers)',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/SnCPp2f/CET2025-DROPPER.png',
                      price: '₹9999',
                      duration: '1 year',
                    ),
                    SizedBox(height: 25,),
                    CourseProductCard(
                      title: 'CET CRASH COURSE',
                      batch: '2025',
                      imageUrl: 'https://i.ibb.co/fNPhqvM/CETCRASH.png',
                      price: '₹9999',
                      duration: '3 months',
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
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
