import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/sizeConfig.dart';

class Azkarpage extends StatelessWidget {
  const Azkarpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double w = SizeConfig.screenW!;
    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon:  Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: (w <= 550) ? 25 : 30,
          ),
        ),
        title: Text(
          "التسبيح والأذكار",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
            fontSize: (w <= 550) ? 25 : 30,

          ),
        ),
        centerTitle: true,
      ),
      body:SafeArea(
        child: Container(),

      ),


    );
  }
}
