import 'package:device_preview/device_preview.dart';
import 'package:e7sebly/core/routing/app_router.dart';
import 'package:e7sebly/core/routing/routes.dart';
import 'package:e7sebly/core/util/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => E7seblyApp(appRouter: AppRouter()),
    ),
  );
}

class E7seblyApp extends StatelessWidget {
  final AppRouter appRouter;

  const E7seblyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'e7sebly',
              theme: ThemeData(
                primaryColor: primaryColor,
                scaffoldBackgroundColor: Colors.white,
                textTheme: Typography.englishLike2018.apply(
                  fontSizeFactor: SizeExtension(1).sp,
                ),
              ),
              initialRoute: Routes.splashScreen,
              onGenerateRoute: appRouter.generateRoute,
            );
          },
        );
      },
    );
  }
}

