import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini/Number.dart';

class Settings extends StatefulWidget {
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Settings> {
  int _currentIndex = 0;

  TimeOfDay _startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay _endTime = TimeOfDay(hour: 0, minute: 0);

  @override
  void _selectStartTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final formatter = DateFormat('hh:mm a');
    return formatter.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
          ),
        ),
        Positioned(
          top: 200,
          left: 30,
          right: 30,
          child: Center(
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Registred User phone number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ]),
                  Text(
                    'user phoneNumber',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 300,
          left: 30,
          right: 30,
          child: Center(
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start Time: ${_formatTimeOfDay(_startTime)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: _selectStartTime,
                        child: Text('Select Start Time'),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'End Time: ${_formatTimeOfDay(_endTime)}',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          primary: Theme.of(context).colorScheme.secondary,
                        ),
                        onPressed: _selectEndTime,
                        child: Text('Select End Time'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 320,
            left: 50,
            right: 30,
            child: Center(
                child: Container(
              height: 30,
              width: 350,
              child: Container(
                child: Column(children: [
                  Row(
                      // mainAxisSize: MainAxisSize.min,
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Set the Activation time',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.w400),
                        )
                      ])
                ]),
              ),
            ))),
        Positioned(
          bottom: 150,
          left: 30,
          right: 30,
          child: Center(
            child: Container(
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 221, 221, 221),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Registred device phone number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ]),
                  Text(
                    'devicephoneNumber', // replace with your pre-defined phone number
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ]),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
