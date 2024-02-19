import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

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
          _buildTestCards('Subjectwise Test'),
          _buildTestCards('Weekly Test'),
          _buildTestCards('Monthly Test'),
          _buildTestCards('Full Test'),
        ],
      ),
    );
  }

  Widget _buildTestCards(String tabName) {
    return ListView(
      children: [
        _buildTestCard(tabName, 'Test 1', '1 hour'),
        _buildTestCard(tabName, 'Test 2', '45 minutes'),
        _buildTestCard(tabName, 'Test 3', '30 minutes'),
      ],
    );
  }

  Widget _buildTestCard(String tabName, String title, String duration) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Duration: $duration',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add your logic to start the test
              },
              child: Text('Attempt Test'),
            ),
          ],
        ),
      ),
    );
  }
}
