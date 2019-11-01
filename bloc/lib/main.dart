import 'package:bloc/service/package_service.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

import 'increment/increment-controller.dart';
import 'increment/increment-widget.dart';

void main() {
  runApp(Home());
  PackageService ps = new PackageService();
  ps.showValue();
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IncrementWidget(),
      ),
      blocs: [
        Bloc((i) => IncrementController()),
      ],
    );
  }
}

