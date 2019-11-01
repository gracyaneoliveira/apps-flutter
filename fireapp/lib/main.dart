import 'dart:io';

import 'package:fireapp/service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'casa_list.dart';

void main() {
  new FirebaseService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> _pathImages = [];

  @override
  initState() {
    print("initState()");
    super.initState();
    _getLocalFile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(children: [
          Expanded(child: CasaList(_pathImages))
        ]));
  }

  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    print("FILES");
    bool fsp = await Directory("${directory.path}/packages").exists();

    if(fsp == false){
      print("Is empty directore packages");
    }

    Stream<FileSystemEntity> fs = directory.list(recursive: true);
    fs.forEach((data){
      print("_getLocalFile path: ${data.path}");
      print("_getLocalFile exist: ${data.exists()}");
    });
  }
// /data/user/0/com.reino.fireapp/app_flutter/packages/400/small/small_casa_moderna.jpg
  Future<File> _getFile() async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _getBannerByPackageId(int packId) async{
    final directory = await getApplicationDocumentsDirectory();
    await Directory("${directory.path}/packages/$packId/small")
        .list().forEach((data){
        return File(data.path);
    });
    return null;
  }

//  Future<File> _saveData() async{
//    String data = json.encode(_toDoList);
//    final file = await _getFile();
//    return file.writeAsString(data);
//  }

  Future<String> _readData() async{
    try{
      final file = await _getFile();
      if(!file.existsSync()){
        return null;
      }
      return file.readAsString();
    }catch(e){
      return null;
    }
  }
}

//Future<File> _getLocalFile() async {
////  String dir = (await getApplicationDocumentsDirectory()).path;
////  File f = new File('$dir/"flutter_assets/0/small/default.png"');
////  return f;
////}
