import 'package:custom_calender/app_router.dart';
import 'package:custom_calender/injection.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Custom Calender',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(navigatorObservers: () => []),
    );
  }
}
