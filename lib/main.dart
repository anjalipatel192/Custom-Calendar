import 'package:custom_calender/app_widget.dart';
import 'package:custom_calender/injection.dart';
import 'package:custom_calender/restart_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RestartApp(child: AppWidget()));
}
