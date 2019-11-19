import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialog',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter Dialog'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text('Exibir Alerta'),
            onPressed: () {
              showAlertDialog(context);
            },
          ),
        ));
  }

  void showAlertDialog(BuildContext context) {
    Widget yesButton = FlatButton(
      child: Text(
        "NÃO",
        style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget noButton = FlatButton(
      child: Text(
        "SIM",
        style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.bold),
      ),
      onPressed: () async {
        //Popping the confirm dialog
        Navigator.pop(context);
        //Showing the progress dialog
        showProcessingDialog();
        //wait 5 seconds : just for testing purposes, you don't need to wait in a real scenario
        await Future.delayed(Duration(seconds: 3));
        //call export data
        await exportData();
        //Pops the progress dialog
        Navigator.pop(context);
        //Shows the finished dialog
        await showFinishedDialog(true);
      },
    );

    //exibe o diálogo
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Atenção"),
          content: Text("Tem certeza que deseja apagar os seus dados de cadastro?"),
          actions: [
            yesButton,
            noButton,
          ],
        );
      },
    );
  }

  void showProcessingDialog() async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Por favor espere"),
              content: Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.pink[700]),
                    ),
                  ),
                  Text(
                    "Removendo dados...",
                  ),
                ],
              )));
        });
  }

  void showFinishedDialog(bool isSuccess) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("LG pra Você"),
            content: isSuccess
                ? Text(
                    "Dados apagados com sucesso.",
                  )
                : Text(
                    "Não foi possível apagar os dados.",
                  ),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.pink[700], fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> exportData() {
    Future.delayed(Duration(seconds: 5)).then((_) {
      Timer(Duration(seconds: 3), () => print("teste"));
    });
  }
}

// https://stackoverflow.com/questions/53872082/how-to-fix-my-code-to-show-alert-dialog-on-flutter
