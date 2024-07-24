import 'package:flutter/material.dart';

class LecturesScreen extends StatefulWidget {
  @override
  _LecturesScreenState createState() => _LecturesScreenState();
}

class _LecturesScreenState extends State<LecturesScreen> {
  List<String> _lectures = ['Palestra 08:00 ', 'Palestra 11:30 ', 'Palestra 13:30 '];
  Map<String, bool> _selectedLectures = {};

  @override
  void initState() {
    super.initState();
    for (var lecture in _lectures) {
      _selectedLectures[lecture] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Palestras'),
      ),
      body: ListView(
        children: _lectures.map((lecture) {
          return CheckboxListTile(
            title: Text(lecture),
            value: _selectedLectures[lecture],
            onChanged: (bool? value) {
              setState(() {
                _selectedLectures[lecture] = value!;
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
