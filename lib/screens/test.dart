import 'package:genius/globalData.dart';
import 'package:flutter/material.dart';
import 'package:genius/utilities/testCard.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class TestsScreen extends StatefulWidget {
  const TestsScreen({super.key});

  @override
  _TestsScreenState createState() => _TestsScreenState();
}

class _TestsScreenState extends State<TestsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int tag = 0;
  List<String> selectedSubject = ['All', 'Physics', 'Chemistry', 'Maths', 'Biology'];

  List subjectTests = [];
  List weeklyTests = [];
  List monthlyTests = [];
  List fullTests = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);

    for (var test in testMaterial) {
      if (test['periodicity'] == 0) {
        subjectTests.add(test);
      }
      else if (test['periodicity'] == 1 ) {
        weeklyTests.add(test);
      }
      else if (test['periodicity'] == 2) {
        monthlyTests.add(test);
      }
      else if (test['perdiocity'] == 3) {
        fullTests.add(test);
      }
    }
  }


  @override
  Widget build(BuildContext context) {


    void launchFunction(String URL) {
        //var uri = Uri(path: URL, scheme: 'https');
        //print(uri);
        //controller.loadRequest(uri);
        String iframe = '<style> #frame {-ms-zoom: 1.5; zoom:1.5; -moz-transform: scale(0.75); -moz-transform-origin: 0 0;} </style> <iframe src="$URL" width="100%" height="100%" frameborder="0" marginheight="0" marginwidth="0">Loading…</iframe>';

        controller.loadHtmlString(iframe);
// Add your logic to start the test
      Navigator.pushNamed(context, '/testScreen');

    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Tests'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD2686E),
          labelColor: const Color(0xFFD2686E),
          tabs: const [
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
                child: buildTestCards(_getSubjectwiseTests(launchFunction)),
              ),
            ],
          ),
          buildTestCards(_getWeeklyTests(launchFunction)),
          buildTestCards(_getMonthlyTests(launchFunction)),
          buildTestCards(_getFullTests(launchFunction)),
        ],
      ) : const Center(child: CircularProgressIndicator(),),
    );
  }


  List<Test> _getSubjectwiseTests(Function launchFunction) {

    List<Test> testList = [];

    for (var test in subjectTests) {
      testList.add(
        Test(
          title: test['name'],
          duration: test['duration'],
          URL: test['URL'],
          launchFunction: launchFunction
        )
      );
    }

    return testList;
  }

  List<Test> _getWeeklyTests(Function launchFunction) {
    // Define and return weekly test data

    List<Test> testList = [];

    for (var test in weeklyTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL'],
              launchFunction: launchFunction
          )
      );
    }

    return testList;
  }

  List<Test> _getMonthlyTests(Function launchFunction) {
    // Define and return monthly test data
    List<Test> testList = [];

    for (var test in monthlyTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL'],
              launchFunction: launchFunction
          )
      );
    }

    return testList;
  }

  List<Test> _getFullTests(Function launchFunction) {
    // Define and return full test data
    List<Test> testList = [];

    for (var test in fullTests) {
      testList.add(
          Test(
              title: test['name'],
              duration: test['duration'],
              URL: test['URL'],
              launchFunction: launchFunction
          )
      );
    }

    return testList;
  }
}
