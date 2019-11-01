import 'dart:convert';

import 'package:fireapp/model/data_model.dart';
import 'package:fireapp/service/package_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print("myBackgroundMessageHandler: $message");
  if (message.containsKey('data')) {
    // Handle data message
    dynamic data = message['data'];
    var decode = json.decode(message['data']['pack']);
    print("DATA > $data");

    print("decode $decode");
    DataModel dataModel = DataModel.fromJson(decode);
    print("name: ${dataModel.name}");

    DataModel dm;
    message.forEach((key, value){
      print("key: $key - value: ${value['pack']}");
      dm = DataModel.fromJson(json.decode(value['pack']));
      print(dm.name);
    });

    PackageService ps = new PackageService();
    ps.handlerMessage(int.parse(dm.id));
  }
}


class FirebaseService{
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  initialize(){
    _showToken();
    _configure();
  }

  _showToken(){
    _firebaseMessaging.getToken().then((token){
      print("TOKEN > $token");
    });
  }

  _configure(){
    _firebaseMessaging.configure(onMessage: processMessage,
        onBackgroundMessage: myBackgroundMessageHandler);
  }

  Future<dynamic> processMessage(Map<String, dynamic> map) async {
    print("received message:");
    print(map);
    DataModel dataModel;
    if (map.containsKey('data')) {
      var decode = json.decode(map['data']['pack']);
      dataModel = DataModel.fromJson(decode);
      print("name foreground: ${dataModel.name}");
    }
    PackageService ps = new PackageService();
    ps.handlerMessage(int.parse(dataModel.id));
  }
}