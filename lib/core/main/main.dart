import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_ninja/core/app_router.dart';

import 'main_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (_, child) {
        return BlocProvider<MainBloc>(
          create: (context) => MainBloc()..add(const MainEvent.started()),
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                title: 'Food Ninja',
                theme: state.currentTheme,
                routerConfig: AppRouter.router,
              );
            },
          ),
        );
      },
    );
  }
}
