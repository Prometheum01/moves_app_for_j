import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:moves_app_for_job/core/provider/search_filter_provider.dart';
import 'package:moves_app_for_job/features/pages/home_page/view/home_page_view.dart';
import 'package:moves_app_for_job/product/constants/color_constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchFilterProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moves App For Job :)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConst.lightCyan,
        textTheme: TextTheme(
          headline6: context.textTheme.headline6
              ?.copyWith(color: ColorConst.skyBlueCrayola, fontSize: 18),
        ),
      ),
      home: const HomePageView(),
    );
  }
}
