import 'dart:convert';

import 'package:fcm_notification/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationServices notificationServices=NotificationServices();

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "NOTIFICATION",
          style: TextStyle(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.lightGreen,
      ),   body: InkWell(onTap: (){
      notificationServices.getDeviceToken().then((value) async {
        var data = {
          'to' : value.toString(),
          'notification' : {
            'title' : 'Createex' ,
            'body' : 'Join Createex Company' ,
            "sound": "jetsons_doorbell.mp3"
          },
          'android': {
            'notification': {
              'notification_count': 23,
            },
          },
          'data' : {
            'type' : 'msj' ,
            'id' : 'Asif Taj'
          }
        };
        await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body:jsonEncode(data) ,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization' : 'key=AAAAxvCMVCk:APA91bHNnnhdeA1E8GP3CpOzKfquJuWlKRf2yZv94ixzxkiVMccOMpa8X1qYC_wfiiznKrkllt6S4EmZDDle-UlWK8TJJ6n8RLk8z9JNmsci4rBE90RbxFurySJAPMCNBR4v9ujKUzJu'

        }
        );


      }

      );
    },
        child: const Center(child: Text("Notifications"),)), );
  }
}
