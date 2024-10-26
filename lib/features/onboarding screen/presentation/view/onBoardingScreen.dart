import 'package:e7sebly/core/util/constants.dart';
import 'package:e7sebly/core/util/styles.dart';
import 'package:e7sebly/features/onboarding%20screen/data/onboardingContents.dart';
import 'package:flutter/material.dart';
import 'package:e7sebly/core/routing/routes.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  State<OnboardingScreens> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreens> {
  late PageController _controller;
  final nameController = TextEditingController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    nameController.addListener(() {
      AppConstants.userName = nameController.text;
    });
  }

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: _currentPage == index ? const Color(0XFF3788FF) : const Color(0XFFAFD0FF),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 13,
      width: _currentPage == index
          ? MediaQuery.of(context).size.width * 0.1
          : MediaQuery.of(context).size.width * 0.03,
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double width = screenSize.width;
    final double height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Container(
        height: height,
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
                flex: 7,
                child: PageView.builder(
                  itemCount: contents.length,
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  onPageChanged: (value) => setState(() => _currentPage = value),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * 0.05,
                        vertical: height * 0.02,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: Image.asset(
                              contents[index].image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              contents.length,
                                  (int index) => _buildDots(index: index),
                            ),
                          ),
                          SizedBox(height: height * 0.04),
                          Column(
                            children: [
                              Text(
                                contents[index].title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: darkText,
                                  fontFamily: "mess_bold",
                                  fontSize: width <= 550 ? 20 : 25,
                                ),
                              ),
                              SizedBox(height: height * 0.01),
                              Text(
                                contents[index].desc,
                                style: TextStyle(
                                  fontFamily: "mess_medium",
                                  fontWeight: FontWeight.w300,
                                  fontSize: width <= 550 ? 16 : 20,
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
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _currentPage + 1 == contents.length
                        ? Padding(
                      padding: EdgeInsets.all(width * 0.05),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) =>
                                buildLoginBottomSheet(context, width, height),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0XFF3788FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: width * 0.1,
                            vertical: height * 0.03,
                          ),
                          textStyle: TextStyle(
                            fontSize: width <= 550 ? 15 : 17,
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
                      padding: EdgeInsets.all(width * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              _controller.jumpToPage(contents.length - 1);
                            },
                            style: TextButton.styleFrom(
                              elevation: 0,
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: width <= 550 ? 18 : 22,
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
                                horizontal: width * 0.06,
                                vertical: height * 0.03,
                              ),
                              textStyle: TextStyle(
                                fontSize: width <= 550 ? 13 : 17,
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

  Widget buildLoginBottomSheet(BuildContext context, double width, double height) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          left: width * 0.05,
          right: width * 0.05,
          top: height * 0.05,
        ),
        decoration: const BoxDecoration(
          color: Color(0XFF1D6BDD),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "تسجيل الدخول",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "mess_semibold",
                fontSize: width <= 550 ? 25 : 30,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontFamily: "mess_semibold",
              ),
              decoration: InputDecoration(
                hintText: 'من فضلك اكتب اسمك',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontFamily: "mess_semibold",
                ),
                filled: true,
                fillColor: const Color(0XFF2585EC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.home);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0XFFFFD323),
                shape: const CircleBorder(),
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.06,
                  vertical: height * 0.03,
                ),
                elevation: 0,
              ),
              child: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

