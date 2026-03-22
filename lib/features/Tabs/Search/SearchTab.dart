import 'package:flutter/material.dart';

import '../../../core/resources/colors_manger.dart';

class Searchtab extends StatelessWidget {
  const Searchtab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManger.yellow,
      child: Center(child: Text("2",style: TextStyle(color: Colors.black,fontSize: 30),)),
    );  }
}
