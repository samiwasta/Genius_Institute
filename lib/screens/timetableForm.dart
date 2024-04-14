import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class TimetableForm extends StatefulWidget {
  const TimetableForm({super.key});

  @override
  State<TimetableForm> createState() => _TimetableFormState();
}

class _TimetableFormState extends State<TimetableForm> {
  // Variables to store form values
  TimeOfDay? _studyStartTime;
  TimeOfDay? _studyEndTime;
  String? _preparationTime;
  double _physicsDifficulty = 1; // Default difficulty for physics
  double _chemistryDifficulty = 1; // Default difficulty for chemistry
  double _mathsDifficulty = 1; // Default difficulty for maths
  double _biologyDifficulty = 1; // Default difficulty for biology

  List<String> tags = [];
  List<String> options = ['IIT-JEE', 'NEET'];

  int tag = -1;
  List<String> group = ['Short (0-4 Months)', 'Medium (5-12 Months)', 'Long (1-2 Years)'];

  // Function to handle time picker for study start time
  Future<void> _selectStudyStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _studyStartTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _studyStartTime) {
      setState(() {
        _studyStartTime = picked;
      });
    }
  }

  // Function to handle time picker for study end time
  Future<void> _selectStudyEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _studyEndTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _studyEndTime) {
      setState(() {
        _studyEndTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timetable Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                const Text(
                  'Study Start Time',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                      fontSize: 16
                  ),
                ),
                const SizedBox(width: 16,),
                ElevatedButton(
                  onPressed: () => _selectStudyStartTime(context),
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: Colors.grey)
                  ),
                  child: Text(_studyStartTime != null
                      ? _studyStartTime!.format(context)
                      : 'Select Time',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFD2686E)
                  ),),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Text(
                'Total Preparation Time',
                style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 16
            ),
            ),
            ChipsChoice.single(
              value: tag,
              onChanged: (val) => setState(() => tag = val),
              choiceItems: C2Choice.listFrom(
                  source: group, value: (i, v) => i, label: (i, v) => v),
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
            const SizedBox(height: 20.0),
            const Text(
              'Exam(s) You Are Preparing',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16
              ),
            ),
            ChipsChoice<String>.multiple(
              value: tags,
              onChanged: (val) => setState(() => tags = val),
              choiceItems: C2Choice.listFrom(
                  source: options,
                  value: (i, v) => v,
                  label: (i, v) => v
              ),
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
            const SizedBox(height: 20.0),
            Text(
                'Physics Difficulty: ${_physicsDifficulty.toStringAsFixed(1)}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16
              ),
            ),
            Slider(
              value: _physicsDifficulty,
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: const Color(0xFFD2686E),
              inactiveColor: Colors.red[100],
              onChanged: (double value) {
                setState(() {
                  _physicsDifficulty = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
                'Chemistry Difficulty: ${_chemistryDifficulty.toStringAsFixed(1)}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16
              ),
            ),
            Slider(
              value: _chemistryDifficulty,
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: const Color(0xFFD2686E),
              inactiveColor: Colors.red[100],
              onChanged: (double value) {
                setState(() {
                  _chemistryDifficulty = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
                'Maths Difficulty: ${_mathsDifficulty.toStringAsFixed(1)}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16
              ),
            ),
            Slider(
              value: _mathsDifficulty,
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: const Color(0xFFD2686E),
              inactiveColor: Colors.red[100],
              onChanged: (double value) {
                setState(() {
                  _mathsDifficulty = value;
                });
              },
            ),
            const SizedBox(height: 20.0),
            Text(
                'Biology Difficulty: ${_biologyDifficulty.toStringAsFixed(1)}',
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16
              ),
            ),
            Slider(
              value: _biologyDifficulty,
              min: 1,
              max: 10,
              divisions: 9,
              activeColor: const Color(0xFFD2686E),
              inactiveColor: Colors.red[100],
              onChanged: (double value) {
                setState(() {
                  _biologyDifficulty = value;
                });
              },
            ),
            const Expanded(child: SizedBox()),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add code to generate timetable based on inputs
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      elevation: 0,
                    ),
                    child: const Text(
                      'Generate Timetable',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
