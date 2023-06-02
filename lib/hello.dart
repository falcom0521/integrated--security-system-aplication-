import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  final Telephony telephony = Telephony.instance;
  void askPermission() async {
    bool? permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    askPermission();
    hello();
  }

  void hello() async {
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) async {
          // if(message.address==''){}
          Map res = jsonDecode(message.body!);
          log('this is res : ${res["lock"]}');
        },
        listenInBackground: false);
    // JSON
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
