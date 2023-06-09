import 'package:flutter/material.dart';
//import 'package:mini/Home.dart';
import 'package:mini/bottomNavigation.dart';
import 'package:mini/main.dart';
import 'Settings.dart';

void main() => runApp(Number());

class Number extends StatefulWidget with ChangeNotifier {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Number> {
  var devicephoneNumber = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: Container(
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
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back,
                        size: 32,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 244, 242, 248),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/mini_project_logo.png',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Conectivity',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter your device number. we'll connnect the device with us",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black38,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Container(
                    padding: EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 246, 248, 249),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        TextFormField(
                          maxLength: 10,
                          onChanged: (value) {
                            devicephoneNumber = value;
                            print(devicephoneNumber);
                          },
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                            counterText: '',
                            hintText: 'Enter device number',
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(10)),
                            prefix: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '(+91)',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),

                                //      onChanged: (value) {
                                //   phoneNumber = value;
                                // }
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (devicephoneNumber != null) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => BottomNavigation()),
                                );
                              }
                              ;
                            },
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 255, 255, 255)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.secondary),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.0),
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
