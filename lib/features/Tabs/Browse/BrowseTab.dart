import 'package:flutter/material.dart';
import 'package:movies/core/resources/colors_manger.dart';

class Browsetab extends StatelessWidget {
  const Browsetab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManger.yellow,
      child: Center(child: Text("3",style: TextStyle(color: Colors.black,fontSize: 30),)),
    );
  }
}
