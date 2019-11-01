import 'dart:io';

import 'package:flutter/material.dart';

class CasaList extends StatelessWidget {

  final List<String> pathImages;

  CasaList(this.pathImages);

  @override
  Widget build(BuildContext context) {
    return _buildList(context);
  }

  Widget _buildCasaItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          pathImages.isNotEmpty ?
          Image.file(
            new File(pathImages[index]),
            fit: BoxFit.cover,) :
          Image.asset('assets/images/default.jpg') ,
        ],
      ),
    );
  }

  Widget _buildList(context) {
    return ListView.builder(
      itemCount: pathImages.length == 0 ? 1 : pathImages.length,
      itemBuilder: _buildCasaItem,
    );
  }
}
