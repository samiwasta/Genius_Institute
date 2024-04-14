import 'package:flutter/material.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> with SingleTickerProviderStateMixin {

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
        title: const Text('DPPs'),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xFFD2686E),
          labelColor: const Color(0xFFD2686E),
          tabs: const [
            Tab(text: 'Physics'),
            Tab(text: 'Chemistry'),
            Tab(text: 'Maths'),
            Tab(text: 'Biology'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TabBarView(
          controller: _tabController,
          children: List.generate(
            4,
                (index) => _buildExpandableContainer(context, index),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableContainer(BuildContext context, int index) {
    return ListView.builder(
      itemCount: 5, // Number of expandable items
      itemBuilder: (context, itemIndex) {
        return ExpansionTile(
          title: Text(
            'Title ${itemIndex + 1}', // Change the title accordingly
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          children: List.generate(
            3, // Number of DPP items
                (index) {
              return ListTile(
                title: Text('Notes ${index + 1} | Title ${itemIndex + 1}'),
                onTap: () {
                  Navigator.pushNamed(context, '/notePdfScreen');
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
