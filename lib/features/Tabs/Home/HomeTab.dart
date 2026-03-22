import 'package:flutter/material.dart';

import '../../../core/resources/colors_manger.dart';

class Hometab extends StatelessWidget {
  const Hometab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManger.yellow,
      child: Center(child: Text("1",style: TextStyle(color: Colors.black,fontSize: 30),)),
    );
  }
}
