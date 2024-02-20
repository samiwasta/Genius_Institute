import 'package:flutter/material.dart';
import 'package:Genius/utilities/testCard.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int tag = 0;
  List<String> selectedSubject = ['All', 'Physics', 'Chemistry', 'Maths', 'Biology'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tests'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Color(0xFFD2686E),
          labelColor: Color(0xFFD2686E),
          tabs: [
            Tab(text: 'Subject Test'),
            Tab(text: 'Week Test'),
            Tab(text: 'Month Test'),
            Tab(text: 'Full Test'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column(
            children: [
              ChipsChoice.single(
                value: tag,
                onChanged: (val) => setState(() => tag = val),
                choiceItems: C2Choice.listFrom(
                    source: selectedSubject,
                    value: (i, v) => i,
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
              Expanded(
                child: buildTestCards(_getSubjectwiseTests(selectedSubject)),
              ),
            ],
          ),
          buildTestCards(_getWeeklyTests()),
          buildTestCards(_getMonthlyTests()),
          buildTestCards(_getFullTests()),
        ],
      ),
    );
  }

  List<Test> _getSubjectwiseTests(List<String> selectedSubjects) {
    // Define and return subjectwise test data based on selected subjects
    // Filter tests based on selected subjects
    return [
      Test(title: 'Subjectwise Test 1', duration: '1 hour'),
      Test(title: 'Subjectwise Test 2', duration: '45 minutes'),
      Test(title: 'Subjectwise Test 3', duration: '30 minutes'),
    ];
  }

  List<Test> _getWeeklyTests() {
    // Define and return weekly test data
    return [
      Test(title: 'Weekly Test 1', duration: '2 hours'),
      Test(title: 'Weekly Test 2', duration: '1.5 hours'),
    ];
  }

  List<Test> _getMonthlyTests() {
    // Define and return monthly test data
    return [
      Test(title: 'Monthly Test 1', duration: '3 hours'),
    ];
  }

  List<Test> _getFullTests() {
    // Define and return full test data
    return [
      Test(title: 'Full Test 1', duration: '4 hours'),
    ];
  }
}
