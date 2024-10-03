import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled2/test.dart';

import 'test2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: false),
      home: Scaffold(
        appBar: AppBar(title: Text('Slider with Stars')),
        body: StarSlider(),
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('LINE Messaging API Broadcast Example'),
      //   ),
      //   body: Center(
      //     child: ElevatedButton(
      //       onPressed: _sendLineBroadcastMessage,
      //       child: const Text('Send Broadcast Message to LINE'),
      //     ),
      //   ),
      // ),
    );
  }

  Future<void> _sendLineBroadcastMessage() async {
    const channelAccessToken = 'a7Go46NWXf1r0fRnUcR1s7QJbaEuECQ6uIIXquGfz3jtTT30+ryJ1RuV3RtHzqEoGHcRW3oMTEqmsTTID+IrDFfk+nuzCReZsyOjN8RsNFZ7F8C0poYtyBsLBBw30hSavWQPw0HMu4NRvWEiyuw4mwdB04t89/1O/w1cDnyilFU=';

    final url = Uri.https('api.line.me', '/v2/bot/message/broadcast');
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $channelAccessToken',
    };

    final body = jsonEncode({
      // 'to': userId,
      'messages': [
        {
          'type': 'text',
          'text': '去你X的李伯毅',
        },
      ],
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Broadcast message sent successfully');
    } else {
      print('Failed to send broadcast message: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }
}