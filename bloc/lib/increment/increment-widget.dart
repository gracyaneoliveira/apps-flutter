import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'increment-controller.dart';

class IncrementWidget extends StatefulWidget {
  @override
  _IncrementWidgetState createState() => _IncrementWidgetState();
}

class _IncrementWidgetState extends State<IncrementWidget> {
  @override
  Widget build(BuildContext context) {
    print("Construindo Widget");

    final IncrementController bloc =
        BlocProvider.getBloc<IncrementController>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: bloc.increment,
          )
        ],
      ),
      body: Center(
        child: StreamBuilder(
            stream: bloc.outCounter,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Text("Click no botão add ${snapshot.data} vezes");
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: bloc.increment,
      ),
    );
  }
}
