import 'package:flutter/material.dart';

// https://fluttercentral.com/Articles/Post/41

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentstep = 0;

  void _movetonext() {
    setState(() {
      _currentstep++;
    });
  }

  void _movetostart() {
    setState(() {
      _currentstep = 0;
    });
  }

  void _showcontent(int s) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('You clicked on'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                spr[s].title,
                spr[s].subtitle,
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text(widget.title),
//        ),
//        body: new Container(
//            child: new Stepper(
//          steps: spr,
//          type: StepperType.vertical,
//          currentStep: _currentstep,
//          onStepContinue: _movetonext,
//          onStepCancel: _movetostart,
//          onStepTapped: _showcontent,
//        )));
//  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new Container(
            child: new Stepper(
          controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
            return Row(
              children: <Widget>[
                FlatButton(
                  child: Row(children: <Widget>[
                    Text('CONTINUE', style: TextStyle(color: Colors.black38),),
                    Icon(Icons.arrow_right, color: Colors.black38,),
                  ],),
                  onPressed: _movetonext,
                ),

//                FlatButton.icon(
//                  onPressed: _movetonext,
//                  label: const Text('CONTINUE', style: TextStyle(color: Colors.black38),),
//                  icon: Icon(Icons.arrow_forward,),
////                  child: const Text('CONTINUE', style: TextStyle(color: Colors.black38),),
//                ),
                FlatButton(
                  onPressed: _movetostart,
                  child: const Text('CANCEL'),
                ),
              ],
            );
          },
          steps: spr,
          type: StepperType.vertical,
          currentStep: _currentstep,
//          onStepContinue: _movetonext,
//          onStepCancel: _movetostart,
          onStepTapped:(step) {
            // On hitting step itself, change the state and jump to that step
            setState(() {
              // update the variable handling the current step value
              // jump to the tapped step
              _currentstep = step;
            });
            // Log function call
            print("onStepTapped : " + step.toString());
          },
        )));
  }
}

List<Step> spr = <Step>[
  // const Step( title:  ,'SubTitle1', 'This is Content', state: StepState.indexed, true)
  Step(
      title: Text('Capítulo 1'),
      subtitle: Text('Versículo 1'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: Text('12 - ', style: TextStyle(color: Colors.black),),
            ),
          ),



          Expanded(
              child: Text('E a terra produziu erva, erva dando semente conforme a sua espécie, e a árvore frutífera, cuja semente está nela conforme a sua espécie; e viu Deus que era bom.',
              style: TextStyle(fontSize: 16.0,),),
          ),
        ],
      ),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello2'),
      subtitle: Text('SubTitle2'),
      content: const Text('This is Content2'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello3'),
      subtitle: Text('SubTitle3'),
      content: const Text('This is Content3'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello4'),
      subtitle: Text('SubTitle4'),
      content: const Text('This is Content4'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello5'),
      subtitle: Text('SubTitle5'),
      content: const Text('This is Content5'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello6'),
      subtitle: Text('SubTitle6'),
      content: const Text('This is Content6'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello7'),
      subtitle: Text('SubTitle7'),
      content: const Text('This is Content7'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello8'),
      subtitle: Text('SubTitle8'),
      content: const Text('This is Content8'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello9'),
      subtitle: Text('SubTitle9'),
      content: const Text('This is Content9'),
      state: StepState.indexed,
      isActive: true),
  Step(
      title: const Text('Hello10'),
      subtitle: Text('SubTitle10'),
      content: const Text('This is Content10'),
      state: StepState.indexed,
      isActive: true),
];
