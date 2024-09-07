import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../core/util/sizeConfig.dart';
import '../../../bmi/presentation/view/bmiScreen.dart';
import '../../../calculator/presentation/view/Calculator.dart';
import '../../../gpa/presentation/view/Gpa.dart';
import '../../../qrcode/presentation/view/QrCode.dart';

class Azkarpage extends StatefulWidget {
  const Azkarpage({Key? key}) : super(key: key);

  @override
  State<Azkarpage> createState() => _AzkarpageState();
}

class _AzkarpageState extends State<Azkarpage> {
  Color blue = const Color(0xFF1e6bdd);
  Color blue2 = const Color(0xFF2787ee);
  Color dark = const Color(0xFFFAB400);

  final List<String> duaaList = [
    'اللهم اجعلني لك شاكراً، لك ذاكراً، لك راهباً، لك مطواعاً، إليك مخبتاً أوّاهاً منيباً',
    'اللهم اجعل خير عمري آخره وخير عملي خواتمه وخير أيامي يوم ألقاك',
    'اللهم اغفر لي خطيئتي وجهلي وإسرافي في أمري وما أنت أعلم به مني',
    'اللهم اجعلني من الذين إذا أحسنوا استبشروا، وإذا أساءوا استغفروا',
    'اللهم إني أسألك إيماناً لا يرتد ونعيماً لا ينفد وقرة عين لا تنقطع',
    'اللهم إني أعوذ بك من زوال نعمتك وتحول عافيتك وفجاءة نقمتك وجميع سخطك',
    'اللهم إني أسألك العفو والعافية في الدنيا والآخرة',
    'اللهم اغفر لي وارحمني واهدني وعافني وارزقني',
    'اللهم إني أسألك الهدى والتقى والعفاف والغنى',
    'اللهم اجعلني من أهل التقى واغفر لي ذنبي ووسع لي في رزقي',
    'اللهم اجعلني من التوابين واجعلني من المتطهرين',
    'اللهم اجعلني من عبادك المخلصين واهدني إلى صراطك المستقيم',
    'اللهم اجعلني من الذين لا خوف عليهم ولا هم يحزنون',
    'اللهم اجعلني من الذاكرين لك الشاكرين لك الطائعين لك',
    'اللهم اغفر لي ذنبي كله دقه وجله وأوله وآخره وعلانيته وسره',
    'اللهم اجعلني من عبادك الصالحين وارزقني حسن الخاتمة',
    'اللهم إني أسألك العفو والعافية في ديني ودنياي وأهلي ومالي',
    'اللهم إني أسألك الجنة وما قرب إليها من قول أو عمل',
    'اللهم إني أسألك رضاك والجنة وأعوذ بك من سخطك والنار',
    'اللهم اجعلني من المصلحين في الأرض واغفر لي ولأهلي',
  ];

  String currentDuaa = 'اللهم اجعلني لك شاكراً، لك ذاكراً، لك راهباً، لك مطواعاً، إليك مخبتاً أوّاهاً منيباً';

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        currentDuaa = duaaList[DateTime.now().second % duaaList.length];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double spacing = screenWidth * 0.04;
    final double spacingPadding = screenWidth * 0.06;
    SizeConfig().init(context);
    double w = SizeConfig.screenW!;
    return Scaffold(
      backgroundColor: const Color(0XFF1D6BDD),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: screenHeight * 0.1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: screenWidth * 0.06,
          ),
        ),
        title: Text(
          "التسبيح والأذكار",
          style: TextStyle(
            fontFamily: "mess_bold",
            color: Colors.white,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(right: spacingPadding, left: spacingPadding),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        const Flexible(
                          child: Text(
                            'التسبيح \nعقب الصلوات',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "mess_regular",
                              fontSize: 24,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Image.asset(
                          'assets/img/icons/pray.png',
                          width: 90,
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: spacing),
              Column(
                children: [
                  Row(
                    children: [
                      buildServiceCard(
                        context,
                        'assets/img/icons/Day Clouds.png',
                        'أذكار \nالصباح',
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
                      SizedBox(width: spacing),
                      buildServiceCard(
                        context,
                        'assets/img/icons/Night Wind.png',
                        'أذكار \nالمساء',
                        blue2,
                            () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Azkarpage()),
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: spacing/1.5,
              ),
              const Text(
                'أكثر من الدعاء',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "mess_bold",
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: spacing / 2,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: dark,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 11,right: 11,bottom: 13,top: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,                    children: [
                    Flexible(
                      child: Text(
                        currentDuaa,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "mess_regular",
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  ),
                ),
              ),
              SizedBox(
                height: spacing/1.5,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'إحساسك ايه؟',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "mess_bold",
                        fontSize: 20,
                      ),
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
                      child: const Text(
                        'المزيد',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "mess_regular",
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: spacing / 2,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/study.png',
                          'بتذاكر؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/disappointment.png',
                          'زعلان ؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/happy.png',
                          'فرحان؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/impatient.png',
                          'مستعجل؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/relax.png',
                          'مرتاح؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/sick.png',
                          'مريض؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/weakness.png',
                          'ضعيف؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/love.png',
                          'حب؟',
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
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: buildServiceCardSmall(
                          context,
                          'assets/img/icons/anger.png',
                          'غضب؟',
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
                      ),
                    ],
                  ),
                ),
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
    final double spacingPadding = screenWidth * 0.05; // 5% of screen width for spacing
    return SizedBox(
      height: screenWidth - (((spacingPadding * 2) * 7) - (spacing / 3)),
      width: screenWidth - (((spacingPadding * 2) * 6) - (spacing / 3)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: color,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imagePath,
                  width: 75,
                  filterQuality: FilterQuality.high,
                ),
                Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "mess_regular",
                    fontSize: 17,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildServiceCardSmall(BuildContext context, String imagePath, String label, Color color, VoidCallback onTap) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double spacing = screenWidth * 0.06;
    final double spacingPadding = screenWidth * 0.05; // 5% of screen width for spacing
    return SizedBox(
      height: screenWidth - (((spacingPadding * 2) * 8) - (spacing / 4)),
      width: screenWidth - (((spacingPadding * 2) * 8) - (spacing / 6)),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: color,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 45,
                filterQuality: FilterQuality.high,
              ),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "mess_regular",
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
