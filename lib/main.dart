import 'package:flutter/material.dart';

import 'app_widget.dart';
import 'injection.dart';
import 'restart_app.dart';

/// Application entry point.
///
/// Initializes Flutter engine bindings, configures dependency injection via GetIt,
/// and mounts the root application widget wrapped in a restart provider.
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const RestartApp(child: AppWidget()));
}
