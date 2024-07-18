import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../core/util/sizeConfig.dart';


class BmiScreen extends StatefulWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale=false;
  double height=120;
  double weight=60;
  double age=28;
  Color blue = const Color(0xFF1e6bdd); // colors variables
  Color blue2 = const Color(0xFF2B91F7);
  Color dark = const Color(0xFFFAB400);
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
            "كتلة الجسم",
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