import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:e7sebly/features/bmi/presentation/view/bmiScreen.dart';
import 'package:e7sebly/features/calculator/presentation/view/Calculator.dart';
import 'package:e7sebly/features/gpa/presentation/view/Gpa.dart';
import 'package:e7sebly/features/qrcode/presentation/view/QrCode.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Color blue = const Color(0xFF1e6bdd); // colors variables
  Color blue2 = const Color(0xFF2787ee);
  Color dark = const Color(0xFF0d0e22);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;
    return Scaffold(
        backgroundColor: const Color(0XFF1D6BDD),
        body: Padding(
          padding: const EdgeInsets.only(right: 16.0,left: 16.0, top: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'نورتنا',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mess_bold",
                            fontSize: 50,
                          ),
                        ),
                        Text(
                          'هتحسب إيه النهارده',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mess_medium",
                            letterSpacing: 1,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Qrcode()),
                      );
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: blue2,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/img/icons/barcode.png',
                          width: 100,
                        ),
                        const Text(
                          'الماسح الضوئي',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mess_regular",
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'خدماتنا',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "mess_medium",
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.pushReplacementNamed(context, "azkar");
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: blue2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                child: Image.asset(
                                  'assets/img/icons/Exchange.png',
                                  filterQuality: FilterQuality.high,
                                ),
                              ),
                              const Text(
                                'تحويل العملات',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "mess_regular",
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Calculator()),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28.0),
                            color: blue2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/img/icons/budget.png',
                                width: 100,
                                filterQuality: FilterQuality.high,
                              ),
                              const Text(
                                'آلة حاسبة',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "mess_regular",
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const BmiScreen()),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: blue2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/img/icons/body-mass-index.png',
                                width: 100,
                                filterQuality: FilterQuality.high,
                              ),
                              const Text(
                                'كتله الجسم',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "mess_regular",
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 160,
                      width: 160,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const GPA()),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: blue2,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'assets/img/icons/cum-laude.png',
                                width: 100,
                                filterQuality: FilterQuality.high,
                              ),
                              const Text(
                                'المعدل التراكمي',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "mess_regular",
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ));
  }
}
