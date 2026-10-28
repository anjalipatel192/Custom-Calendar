import 'package:flutter/material.dart';

/// Utility widget that rebuilds the entire widget tree by regenerating its root key.
///
/// Useful for restarting app state on user logout or dynamic locale/theme resets.
class RestartApp extends StatefulWidget {
  final Widget child;

  const RestartApp({super.key, required this.child});

  /// Rebuilds the nearest ancestor [RestartApp] widget tree.
  static void restart(BuildContext context) {
    context.findAncestorStateOfType<_RestartAppState>()?.restart();
  }

  @override
  State<RestartApp> createState() => _RestartAppState();
}

class _RestartAppState extends State<RestartApp> {
  Key _key = UniqueKey();

  /// Forces a complete subtree rebuild with a fresh key.
  void restart() {
    setState(() {
      _key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(key: _key, child: widget.child);
  }
}
