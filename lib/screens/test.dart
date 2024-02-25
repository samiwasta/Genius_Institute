import 'package:genius/globalData.dart';
import 'package:flutter/material.dart';
import 'package:genius/utilities/testCard.dart';
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

  List weeklyTests = [];
  List monthlyTests = [];
  List fullTests = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    for (var test in testMaterial) {
      if (test['periodicity'] == 0 ) {
        weeklyTests.add(test);
      }
      else if (test['periodicity'] == 1) {
        monthlyTests.add(test);
      }
      else if (test['perdiocity'] == 2) {
        fullTests.add(test);
      }
    }
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
      body: (isMaterialLoaded) ? TabBarView(
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
      ) : Center(child: CircularProgressIndicator(),),
    );
  }

  List<Test> _getSubjectwiseTests(List<String> selectedSubjects) {
    // Define and return subjectwise test data based on selected subjects
    // Filter tests based on selected subjects

    List<Test> testList = [];

    for (var test in testMaterial) {
      testList.add(
        Test(
          title: test['name'],
          duration: test['duration'],
          URL: test['URL']
        )
      );
    }

    return testList;
  }

  List<Test> _getWeeklyTests() {
    // Define and return weekly test data

    List<Test> testList = [];

    for (var test in weeklyTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL']
          )
      );
    }

    return testList;
  }

  List<Test> _getMonthlyTests() {
    // Define and return monthly test data
    List<Test> testList = [];

    for (var test in monthlyTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL']
          )
      );
    }

    return testList;
  }

  List<Test> _getFullTests() {
    // Define and return full test data
    List<Test> testList = [];

    for (var test in fullTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL']
          )
      );
    }

    return testList;
  }
}
