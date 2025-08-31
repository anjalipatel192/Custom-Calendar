import 'package:flutter/material.dart';

class RestartApp extends StatefulWidget {
  final Widget child;
  const RestartApp({super.key, required this.child});

  @override
  State<RestartApp> createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: key, child: widget.child);
  }
}
