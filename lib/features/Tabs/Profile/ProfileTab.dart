import 'package:flutter/material.dart';
import 'package:movies/core/models/user_model.dart';

import '../../../core/resources/colors_manger.dart';

class Profiletab extends StatelessWidget {
  const Profiletab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManger.yellow,
      child: Center(child: Text(UserModel.currentUser!.name,style: TextStyle(color: Colors.black,fontSize: 30),)),
    );  }
}
