import 'package:flutter/material.dart';
class BmiResultScreen extends StatelessWidget
{
  final int result;
  final bool isMale;
  final double age;
  final double weight;
  final double height;

  const BmiResultScreen({Key? key,
    required this.age,
    required this.result,
    required this.isMale,
    required this.weight,
    required this.height,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Color blue = const Color(0xFF1e6bdd); // colors variables
    Color blue2 = const Color(0xFF2B91F7);
    Color dark = const Color(0xFFFAB400);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 90,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 30,
          ),
        ),
        title:const Text(
          "كتلة الجسم",
          style: TextStyle(
              fontFamily: "three",
              color: Colors.white,
              fontSize: 35

          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/img/logo_source/b3.png',
            fit: BoxFit.cover,
            alignment: Alignment.bottomLeft,
            height: 1920,
            width: 1080,
          ),
           SizedBox(
             width: 500,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 200,),
                      Text(
                        '${result.round()}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "five",
                          fontSize: 170.0,
                        ),
                      ),
                      const Text(
                        'حسبنالك',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "three",
                          fontSize: 60.0,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 300,),
                  Container(
                    decoration:  BoxDecoration(
                        color: dark,
                        borderRadius: const BorderRadius.all(Radius.circular(40))

                    ),
                    width:400,
                    height:80,

                    child: TextButton(
                        onPressed: (){
                          Navigator.pushReplacementNamed(context, "homeScreen");
                        },
                        child:const Text(
                          'تحب تحسب حاجه تاني ؟',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "three",
                            fontSize: 32.0,
                          ),
                        )),
                  ),
                ],
              ),
           ),
        ],
      )


    );
  }
}