import 'package:e7sebly/core/util/styles.dart';
import 'package:e7sebly/core/util/sizeConfig.dart';
import 'package:e7sebly/features/onboarding%20screen/data/onboardingContents.dart';
import 'package:flutter/material.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreens> {
  late PageController _controller;
  var nameController = TextEditingController();

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        color: _currentPage == index ? const Color(0XFF3788FF) : const Color(0XFFAFD0FF),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: SizeConfig.blockV! * 0.8, // Adjusted height
      width: _currentPage == index ? SizeConfig.blockH! * 4.5 : SizeConfig.blockH! * 1.5, // Adjusted width
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenW!;
    double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/icons/wall.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 5,
                child: PageView.builder(
                  itemCount: contents.length,
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _currentPage = value),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.blockH! * 5, // Adjusted padding
                        vertical: SizeConfig.blockV! * 3,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            contents[index].image,
                            height: SizeConfig.blockV! * 45,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                                  (int index) => _buildDots(index: index),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                contents[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: darkText,
                                  fontFamily: "mess_bold",
                                  fontSize: (width <= 550) ? 25 : 20,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                contents[index].desc,
                                style: TextStyle(
                                  fontFamily: "mess_medium",
                                  fontWeight: FontWeight.w300,
                                  fontSize: (width <= 550) ? 16 : 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _currentPage + 1 == contents.length
                        ? Padding(
                      padding: EdgeInsets.all(SizeConfig.blockH! * 7),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<dynamic>(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                color: Color(0XFF1D6BDD),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0.0),
                                  topRight: Radius.circular(0.0),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.blockH! * 8,
                                  right: SizeConfig.blockH! * 8,
                                  bottom: SizeConfig.blockV! * 10,
                                  top: SizeConfig.blockV! * 14,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      " تسجيل دخول ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "mess_semibold",
                                        fontSize: (width <= 550) ? 25 : 30,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              TextField(
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white,
                                                  fontFamily: "mess_semibold",
                                                ),
                                                textAlign: TextAlign.end,
                                                controller: nameController,
                                                keyboardType: TextInputType.text,
                                                decoration: InputDecoration(
                                                  hintText: 'من فضلك اكتب اسمك',
                                                  hintStyle: const TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontFamily: "mess_semibold",
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(50),
                                                    borderSide: const BorderSide(
                                                      width: 0,
                                                      style: BorderStyle.none,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  contentPadding: const EdgeInsets.all(16),
                                                  fillColor: const Color(0XFF2585EC),
                                                ),
                                              ),
                                              Image.asset(
                                                "assets/img/icons/slideup.png",
                                                height: 180,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(context, 'main');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0XFFFFD323),
                                        shape: const CircleBorder(),
                                        elevation: 0,
                                        padding: EdgeInsets.symmetric(
                                          horizontal: SizeConfig.blockH! * 6,
                                          vertical: SizeConfig.blockV! * 2.5,
                                        ),
                                        textStyle: TextStyle(
                                          fontSize: (width <= 550) ? 13 : 17,
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF3788FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.blockH! * 11,
                            vertical: SizeConfig.blockV! * 2.5,
                          ),
                          textStyle: TextStyle(
                            fontSize: (width <= 550) ? 15 : 17,
                          ),
                        ),
                        child: const Text(
                          "يلا احسبلي",
                          style: TextStyle(
                            fontFamily: "mess_bold",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                        : Padding(
                      padding: EdgeInsets.all(SizeConfig.blockH! * 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _controller.jumpToPage(3);
                            },
                            style: TextButton.styleFrom(
                              elevation: 0,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: (width <= 550) ? 18 : 22,
                              ),
                            ),
                            child: Text(
                              "تخطي",
                              style: TextStyle(
                                color: darkText,
                                fontFamily: "mess_bold",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0XFF3788FF),
                              shape: const CircleBorder(),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.blockH! * 6,
                                vertical: SizeConfig.blockV! * 2.5,
                              ),
                              textStyle: TextStyle(
                                fontSize: (width <= 550) ? 13 : 17,
                              ),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
