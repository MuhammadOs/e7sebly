import 'package:flutter/material.dart';
import 'package:e7sebly/features/bmi/presentation/view/bmiScreen.dart';
import 'package:e7sebly/features/calculator/presentation/view/Calculator.dart';
import 'package:e7sebly/features/gpa/presentation/view/Gpa.dart';
import 'package:e7sebly/features/qrcode/presentation/view/QrCode.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color blue = const Color(0xFF1e6bdd); // colors variables
  Color blue2 = const Color(0xFF2787ee);
  Color dark = const Color(0xFF0d0e22);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final double spacing = screenWidth * 0.06;
    final double spacingPadding = screenWidth * 0.05;// 5% of screen width for spacing

    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      body: Padding(
        padding: EdgeInsets.only(right: spacingPadding, left: spacingPadding),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'أهلاً يا يوسف',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mess_bold",
                            fontSize: 40,
                          ),
                        ),
                        Text(
                          'هنحسب إيه النهاردة',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "mess_medium",
                            letterSpacing: 1,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
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
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12, bottom: 12),
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'خدماتنا',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "mess_bold",
                    fontSize: 28,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Column(
                  children: [
                    Row(

                      children: [
                        buildServiceCard(
                          context,
                          'assets/img/icons/ramadan.png',
                          'التسبيح والأذكار',
                          blue2,
                              () {
                            setState(() {
                              Navigator.pushReplacementNamed(context, "azkar");
                            });
                          },
                        ),
                        SizedBox(width: spacing),
                        buildServiceCard(
                          context,
                          'assets/img/icons/gpa.png',
                          'المعدل التراكمي',
                          blue2,
                              () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const GPA()),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: spacing), // Dynamic spacing
                    Row(
                      children: [
                        buildServiceCard(
                          context,
                          'assets/img/icons/budget.png',
                          'اله حاسبة',
                          blue2,
                              () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Calculator()),
                              );
                            });
                          },
                        ),
                        SizedBox(width: spacing),
                        buildServiceCard(
                          context,
                          'assets/img/icons/body-mass-index.png',
                          'كتلة الجسم',
                          blue2,
                              () {
                            setState(() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const BmiScreen()),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
    );
  }

  Widget buildServiceCard(BuildContext context, String imagePath, String label, Color color, VoidCallback onTap) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double spacing = screenWidth * 0.06;
    final double spacingPadding = screenWidth * 0.05;// 5% of screen width for spacing
    return SizedBox(
      height: screenWidth-(((spacingPadding*2)*6)-(spacing/3)),
      width: screenWidth-(((spacingPadding*2)*6)-(spacing/3)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                width: 90,
                filterQuality: FilterQuality.high,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "mess_regular",
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
