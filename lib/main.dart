import 'package:challenge_task/ui/helper/route_generator.dart';
import 'package:challenge_task/ui/resource/app_colors.dart';
import 'package:challenge_task/ui/resource/app_routes.dart';
import 'package:challenge_task/ui/resource/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(384, 805),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.order,
        theme: ThemeData(
          backgroundColor: AppPalette.backgroundColor,
          primaryColor: AppPalette.primaryColor,
          accentColor: AppPalette.accentColor,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppRoute.home,
      ),
    );
  }
}
